//
//  MHPopProgressViewConfig.m
//  musichome
//
//  Created by J on 2017/7/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHPopProgressViewConfig.h"
#import "UIFont+MHJFont.h"
@implementation MHPopProgressViewConfig
+(MHPopProgressViewConfig *)defaultConfig
{
    MHPopProgressViewConfig *config=[[MHPopProgressViewConfig alloc]init];
    
    config.MHPopProgressViewTitleFont([UIFont MHFont:13]).MHPopProgressViewTitleColor([UIColor whiteColor]).MHPopProgressViewProgressBGColor([UIColor lightGrayColor]).MHPopProgressViewProgressColor([UIColor whiteColor]).MHPopProgressViewProgressWidth(2.0f);
    config.MHPopProgressViewProgress(0);
    
    return config;
}
-(void)setTitle:(NSString *)title
{
    _title=title;
}
-(void)setTitleFont:(UIFont *)titleFont
{
    _titleFont=titleFont;
}
-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor=titleColor;
}
-(void)setProgressColor:(UIColor *)progressColor
{
    _progressColor=progressColor;
}
-(void)setProgressBGColor:(UIColor *)progressBGColor
{
    _progressBGColor=progressBGColor;
}
-(void)setProgressWidth:(CGFloat)progressWidth
{
    _progressWidth=progressWidth;
}
-(void)setProgress:(CGFloat)progress
{
    _progress=progress;
}
-(MHPopProgressViewConfig *(^)(NSString *))MHPopProgressViewTitle
{
    return ^(NSString *title){
        self.title=title;
        return self;
    };
}

-(MHPopProgressViewConfig *(^)(UIFont *))MHPopProgressViewTitleFont
{
    return ^(UIFont *font){
        self.titleFont=font;
        return self;
    };
}
-(MHPopProgressViewConfig *(^)(UIColor *))MHPopProgressViewTitleColor
{
    return ^(UIColor *color){
        self.titleColor=color;
        return self;};
}
-(MHPopProgressViewConfig *(^)(CGFloat))MHPopProgressViewProgress
{
    return ^(CGFloat progress){
        self.progress=progress;
        return self;};
}
-(MHPopProgressViewConfig *(^)(CGFloat))MHPopProgressViewProgressWidth
{
    return ^(CGFloat width){
        self.progressWidth=width;
        return self;
    };
}
-(MHPopProgressViewConfig *(^)(UIColor *))MHPopProgressViewProgressColor
{
    return ^(UIColor *color){
        self.progressColor=color;
        return self;
    };
}
-(MHPopProgressViewConfig *(^)(UIColor *))MHPopProgressViewProgressBGColor
{
    return ^(UIColor *color){
        self.progressBGColor=color;
        return self;
    };
}


@end
