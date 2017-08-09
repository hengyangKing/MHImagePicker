//
//  MHProgressView.m
//  musichome
//
//  Created by J on 2017/7/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHProgressView.h"

@implementation MHProgressView

-(instancetype)init
{
    self =[super init];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

-(void)setProgress:(CGFloat)progress
{
    _progress=progress;
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //    A圈完整为灰色
    CGFloat centerX=rect.size.width*0.5;
    CGFloat centerY=rect.size.height*0.5;
    CGFloat width=centerX-3;
    
    // 上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 保存一个当前上下文的绘图状态到一个栈里面
    // G代理Graphics[绘图]
    CGContextSaveGState(ctx);
    CGContextSaveGState(ctx);
    
    //    A圈
    [self.config.progressBGColor set];
    CGContextSetLineWidth(ctx, self.config.progressWidth);
    //    CGFloat AendAngle = - M_PI_2;
    CGContextAddArc(ctx, centerX, centerY, width,0, 4*M_PI_2, 0);
    CGContextStrokePath(ctx);
    
    //    B圈
    [self.config.progressColor set];
    CGContextSetLineWidth(ctx, 2);
    CGFloat BendAngle = 2 * M_PI * self.progress - M_PI_2;
    CGContextAddArc(ctx, centerX, centerY, width, -M_PI_2, BendAngle, 0);
    
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttr[NSFontAttributeName]=[UIFont fontWithName:@"Avenir-Light" size:15];
    
    CGContextStrokePath(ctx);
}
@end
