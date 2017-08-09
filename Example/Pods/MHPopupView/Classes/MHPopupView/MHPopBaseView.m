//
//  MHPopBaseView.m
//  musichome
//
//  Created by J on 2017/7/20.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHPopBaseView.h"

@implementation MHPopBaseView
-(instancetype)init
{
    self=[super init];
    if (self) {
        [self setOpaque:YES];
        [self setFrame:[UIScreen mainScreen].bounds];
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.backgroundView];
        [self.backgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

#pragma lazy
-(UIView *)backgroundView
{
    if (!_backgroundView)
    {
        _backgroundView=[[UIView alloc]initWithFrame:CGRectZero];
        UIVisualEffect *blurEffect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [_backgroundView addSubview:visualEffectView];
        [visualEffectView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];

        [_backgroundView setAlpha:0.0];
    }
    return _backgroundView;
}
-(void)showPopViewSucess:(void (^)())success
{
    [UIView animateWithDuration:0.1 animations:^{
        [self.backgroundView setAlpha:1.0];
        if (success) {
            success();
        }
    }];
    
}




@end
