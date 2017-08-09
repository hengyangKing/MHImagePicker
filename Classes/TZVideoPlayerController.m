//
//  TZVideoPlayerController.m
//  TZImagePickerController
//
//  Created by 谭真 on 16/1/5.
//  Copyright © 2016年 谭真. All rights reserved.
//

#import "TZVideoPlayerController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZAssetModel.h"
#import "TZImagePickerController.h"
#import "TZPhotoPreviewController.h"
//我的添加
#import "NSDate+MHDateExtension.h"
#import "MHPopProgressView.h"
#import "MHAVFormatShop.h"
#import "NSFileManager+MHImagePickerTools.h"
#import "NSFileManager+MHFileSize.h"
#import "NSFileManager+MHFilePath.h"
#import "MHAVFormatShop.h"
#import "NSFileManager+MHReduceVideoPlistTools.h"
#import "MHBase.h"

@interface TZVideoPlayerController () {
    AVPlayer *_player;
    UIButton *_playButton;
    UIImage *_cover;
    
    UIView *_toolBar;
    UIButton *_okButton;
    UIProgressView *_progress;
}

@end

@implementation TZVideoPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.title = @"视频预览";
    [self configMoviePlayer];
}

- (void)configMoviePlayer {
    [[TZImageManager manager] getPhotoWithAsset:_model.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
        _cover = photo;
    }];
    [[TZImageManager manager] getVideoWithAsset:_model.asset completion:^(AVPlayerItem *playerItem, NSDictionary *info) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _player = [AVPlayer playerWithPlayerItem:playerItem];
            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
            playerLayer.frame = self.view.bounds;
            [self.view.layer addSublayer:playerLayer];
            [self addProgressObserver];
            [self configPlayButton];
            [self configBottomToolBar];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pausePlayerAndShowNaviBar) name:AVPlayerItemDidPlayToEndTimeNotification object:_player.currentItem];
        });
    }];
}

/// Show progress，do it next time / 给播放器添加进度更新,下次加上
-(void)addProgressObserver{
    AVPlayerItem *playerItem = _player.currentItem;
    UIProgressView *progress = _progress;
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current = CMTimeGetSeconds(time);
        float total = CMTimeGetSeconds([playerItem duration]);
        if (current) {
            [progress setProgress:(current/total) animated:YES];
        }
    }];
}

- (void)configPlayButton {
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _playButton.frame = CGRectMake(0, 64, self.view.tz_width, self.view.tz_height - 64 - 44);
    [_playButton setImage:[TZImageManager manager].config.playVideo forState:(UIControlStateNormal)];
    [_playButton addTarget:self action:@selector(playButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playButton];
}

- (void)configBottomToolBar {
    _toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.tz_height - 44, self.view.tz_width, 44)];
    CGFloat rgb = 34 / 255.0;
    _toolBar.backgroundColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
    _toolBar.alpha = 0.7;
    
    _okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _okButton.frame = CGRectMake(self.view.tz_width - 44 - 12, 0, 44, 44);
    _okButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_okButton addTarget:self action:@selector(okButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_okButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [_okButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    
    [_toolBar addSubview:_okButton];
    [self.view addSubview:_toolBar];
}

#pragma mark - Click Event

- (void)playButtonClick {
    CMTime currentTime = _player.currentItem.currentTime;
    CMTime durationTime = _player.currentItem.duration;
    if (_player.rate == 0.0f) {
        if (currentTime.value == durationTime.value) [_player.currentItem seekToTime:CMTimeMake(0, 1)];
        [_player play];
        [self hideBar];
        [_playButton setImage:nil forState:UIControlStateNormal];
        if (iOS7Later) [UIApplication sharedApplication].statusBarHidden = YES;
    } else {
        [self pausePlayerAndShowNaviBar];
    }
}
-(void)hideBar
{
    [self.navigationController setNavigationBarHidden:YES];
    _toolBar.hidden = YES;
}
//King的二次封装
- (void)okButtonClick {
    
#pragma mark  注意看这里的二次封装
    [self hideBar];
    TZImagePickerController *imagePickerVc = (TZImagePickerController *)self.navigationController;
    //1.先转存
    //2.计算大小是否符合小于30M(若是不符合，先保存在文件夹，避免二次转码，等发布流程结束一并删除已转码文件)
    //3.一切正常，销毁控控制器，否则弹窗警告
    if ([_model.asset isKindOfClass:[PHAsset class]]){
        
        PHAsset *jhyAsset=_model.asset;
    //    1.检测文件是否存在
        NSString *seleteFileName=[NSString stringWithFormat:@"%@.mp4",[jhyAsset.creationDate getCreateTime]];
        
        if ([JHYFILEMANAGER isReduced:seleteFileName]) {
            //已存在
            //检验大小
            if ([JHYFILEMANAGER ReducedVideoIsIsOverflow:nil andFileName:seleteFileName]){
                //符合大小
                if (imagePickerVc.didFinishPickingVideoHandle){

                    imagePickerVc.didFinishPickingVideoHandle(_cover, seleteFileName);
                    
                    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                }
            }else{
                [imagePickerVc showAlertWithTitle:@"该文件过大，不能上传"];
                [self pausePlayerAndShowNaviBar];
            }
        }else{
            
            PHVideoRequestOptions* options = [[PHVideoRequestOptions alloc] init];
            options.version = PHVideoRequestOptionsVersionOriginal;
            options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
            options.networkAccessAllowed = YES;
            
            [[PHImageManager defaultManager] requestAVAssetForVideo:jhyAsset options:options resultHandler:^(AVAsset* avasset, AVAudioMix* audioMix, NSDictionary* info){
                
                AVURLAsset* urlAsset = (AVURLAsset*)avasset;
                
                [[MHPopProgressView sharedInstance]showWithConfig:^(MHPopProgressViewConfig *config) {
                    config.MHPopProgressViewTitle(@"正在加载,请稍后...");
                    return config;
                }];
                
                [[MHAVFormatShop shareFormatShop]exportAVURLAssetWithConfig:^(MHAVFormatShopConfig *config) {
                    
                    config.MHAVFormatShopAsset(urlAsset);
                    config.MHAVFormatShopOutputFileName(seleteFileName);
                    
                } andProgress:^(float progress) {
                    MHJLog(@"-------progress------%f",progress);
                    [MHPopProgressView sharedInstance].MHPopProgressViewProgress(progress);
                    
                } andCompletion:^(MHAVFormatShopConfig *config) {
                    [JHYFILEMANAGER reduceVideo:seleteFileName];

                    if ([JHYFILEMANAGER ReducedVideoIsIsOverflow:nil andFileName:seleteFileName]){
                        if (imagePickerVc.didFinishPickingVideoHandle) {
                            
                            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                            
                            imagePickerVc.didFinishPickingVideoHandle(_cover, seleteFileName);
                        }
                    }else{
                        [imagePickerVc showAlertWithTitle:@"该文件过大，不能上传"];
                        [self pausePlayerAndShowNaviBar];
                    }
                } andFailed:^{
                    [[MHPopProgressView sharedInstance]disMiss];
                    [imagePickerVc showAlertWithTitle:@"转码失败,请稍后再试"];
                }];
            }];
        }
    }
}

#pragma mark - Notification Method

- (void)pausePlayerAndShowNaviBar {
    [_player pause];
    _toolBar.hidden = NO;
    [self.navigationController setNavigationBarHidden:NO];
    [_playButton setImage:[UIImage imageNamed:@"start"] forState:(UIControlStateNormal)];
    if (iOS7Later) [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}



@end
