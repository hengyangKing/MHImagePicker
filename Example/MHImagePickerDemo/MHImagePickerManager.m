//
//  MHImagePickerManager.m
//  musichome
//
//  Created by J on 2017/8/8.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHImagePickerManager.h"
#import "TZImagePickerController+MHImagePicker.h"
#import "UIApplication+MHRootController.h"
@interface MHImagePickerManager()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,copy)void (^selectPhotoBlock)(NSArray *photos);
@property(nonatomic,copy)void (^cancelBlock)();
@property(nonatomic,copy)void (^showBlock)();
@property(nonatomic,copy)void (^selectVideoBlock)(UIImage *coverImage,NSString *reduceVideoFileName);
@property(nonatomic,strong)MHImagePickerAppearanceConfig *MHConfig;
@end
@implementation MHImagePickerManager
+ (instancetype)imagePickerManager {
    static MHImagePickerManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
-(MHImagePickerAppearanceConfig *)MHConfig
{
    if (!_MHConfig) {
        _MHConfig=[MHImagePickerAppearanceConfig defConfig];
        _MHConfig
        .ImagePickerAppearanceTakePicture([UIImage imageNamed:@"MH_takePicture"])
        .ImagePickerAppearanceVideoIcon([UIImage imageNamed:@"MH_videoSendIcon"])
        .ImagePickerAppearanceTableviewArrow([UIImage imageNamed:@"arrows_right_n"])
        .ImagePickerAppearancePhotoSelPicker([UIImage imageNamed:@"MH_picker_photo_sel"])
        .ImagePickerAppearancePhotoDefPicker([UIImage imageNamed:@"MH_picker_photo_def"])
        .ImagePickerAppearancePhotoDefOriginal([UIImage imageNamed:@"MH_original_def"])
        .ImagePickerAppearancePhotoSelOriginal([UIImage imageNamed:@"MH_original_sel"])
        .ImagePickerAppearancePhotoNumberBG([UIImage imageNamed:@"MH_photo_number_BG"])
        .ImagePickerAppearanceNavImage([UIImage imageNamed:@"navigationbarback_n"])
        .ImagePickerAppearanceNavHImage([UIImage imageNamed:@"navigationbarback_h"])
        .ImagePickerAppearancePlay([UIImage imageNamed:@"start"])
        
        .ImagePickerAppearanceOKButtonTitleColorDisabled([UIColor lightGrayColor])
        .ImagePickerAppearanceOKButtonTitleColorNormal([UIColor blueColor])
        .ImagePickerAppearancePhotoSelPickerPreview([UIImage imageNamed:@"MH_preview_photo_sel"])
        .ImagePickerAppearancePhotoDefPickerPreview([UIImage imageNamed:@"MH_preview_photo_def"]);
    }
    return _MHConfig;
}
-(void)MHImagePickPhotoWithCount:(NSInteger)count andSeletePhotoBlock:(void (^)(NSArray *photos))selectPhotoBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock
{
    [self setShowBlock:showBlock];
    [self setCancelBlock:cancelBlock];
    [self setSelectPhotoBlock:selectPhotoBlock];
    [self setSelectVideoBlock:nil];
    [TZImagePickerController MHImagePickPhotoWithCount:count andConfig:^MHImagePickerAppearanceConfig *{
        return self.MHConfig;
    } andseletePhotoBlock:self.selectPhotoBlock andCancelBlock:self.cancelBlock andShowBlcok:self.showBlock];
}


-(void)MHImagePickVideoWithSelectVideoBlock:(void(^)(UIImage *coverImage,NSString *reduceVideoFileName))selectBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock{
    [self setShowBlock:showBlock];
    [self setCancelBlock:cancelBlock];
    [self setSelectPhotoBlock:nil];
    [self setSelectVideoBlock:selectBlock];
    
    
    [TZImagePickerController MHImagePickVideoWithConfig:^MHImagePickerAppearanceConfig *{
        return self.MHConfig;
    } andSelectVideoBlock:self.selectVideoBlock andCancelBlock:self.cancelBlock andShowBlcok:self.showBlock];
    

}


-(void)MHTakePictureWithBlock:(void (^)(NSArray *photos))takePictureBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock{

    [self setShowBlock:showBlock];
    [self setCancelBlock:cancelBlock];
    [self setSelectPhotoBlock:takePictureBlock];
    [self setSelectVideoBlock:nil];
    
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.sourceType=UIImagePickerControllerSourceTypeCamera;
    picker.delegate=self;
    [[UIApplication sharedApplication].root presentViewController:picker animated:YES completion:self.showBlock];
    
}
#pragma mark delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (self.selectPhotoBlock&&image) {
        self.selectPhotoBlock(@[image]);
    }
    [[UIApplication sharedApplication].root dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[UIApplication sharedApplication].root dismissViewControllerAnimated:YES completion:^{
        if (self.cancelBlock) {
            self.cancelBlock();
        }
    }];
}
@end
