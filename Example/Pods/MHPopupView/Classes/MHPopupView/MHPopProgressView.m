//
//  MHPopProgressView.m
//  musichome
//
//  Created by J on 2017/7/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHPopProgressView.h"
#import "MHProgressView.h"
@interface MHPopProgressView()
@property(nonatomic,strong)MHPopProgressViewConfig *config;
@property(nonatomic,strong)MHProgressView *progressView;
@property(nonatomic,strong)UILabel *titleLabel;
@end
@implementation MHPopProgressView
+ (MHPopProgressView *)sharedInstance{
    static MHPopProgressView *_popProgressView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _popProgressView = [[MHPopProgressView alloc] init];
    });
    return _popProgressView;
}
-(instancetype)init
{
    self=[super init];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
-(void)showWithConfig:(MHPopProgressViewConfig *(^)(MHPopProgressViewConfig *config))config
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (config) {
            self.config=config([MHPopProgressViewConfig defaultConfig]);
        }
        [self createSubView];
        [self show];
    });
}
-(void (^)(CGFloat))MHPopProgressViewProgress
{
    return ^(CGFloat progress){
        self.config.MHPopProgressViewProgress(progress);
        if(self.config.progress>=1.0){
            [self disMiss];
            return ;
        }
        [self.progressView setProgress:self.config.progress];
    };
}
-(void)setConfig:(MHPopProgressViewConfig *)config
{
    _config=config;
    [self layoutSubviewsUI];
}
-(void)layoutSubviewsUI
{
    self.progressView.config=self.config;
    self.titleLabel.font=self.config.titleFont;
    self.titleLabel.textColor=self.config.titleColor;
    [self.titleLabel setText:self.config.title];
}
-(MHProgressView *)progressView
{
    if (!_progressView) {
        _progressView=[[MHProgressView alloc]init];
    }
    return _progressView;
}
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc]init];
        _titleLabel.font=self.config.titleFont;
        _titleLabel.textColor=self.config.titleColor;
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        _titleLabel.backgroundColor=[UIColor clearColor];
        [_titleLabel setText:self.config.title];
            }
    return _titleLabel;
}
-(void)createSubView
{
    [self addSubview:self.progressView];
    [self.progressView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).mas_offset(10);
        make.width.height.mas_equalTo(SELFSIZE.width/8.0);
    }];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.progressView.mas_bottom).mas_offset(10);
    }];
    [self layoutSubviewsUI];
}
-(void)show{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    [window makeKeyAndVisible];
    [self showPopViewSucess:nil];
}
-(void)disMiss
{
    [self.titleLabel removeFromSuperview];
    [self.progressView removeFromSuperview];
    _titleLabel=nil;
    _progressView=nil;
    [self removeFromSuperview];
}

@end
