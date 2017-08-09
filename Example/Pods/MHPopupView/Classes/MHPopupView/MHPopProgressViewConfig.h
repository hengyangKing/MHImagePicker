//
//  MHPopProgressViewConfig.h
//  musichome
//
//  Created by J on 2017/7/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHPopProgressViewConfig : NSObject
@property(nonatomic,copy,readonly)NSString *title;
@property(nonatomic,strong,readonly)UIFont *titleFont;
@property(nonatomic,strong,readonly)UIColor *titleColor;

@property(nonatomic,strong,readonly)UIColor *progressColor;
@property(nonatomic,strong,readonly)UIColor *progressBGColor;
@property(nonatomic,assign,readonly)CGFloat progressWidth;
@property(nonatomic,assign,readonly)CGFloat progress;


@property(nonatomic,copy,readonly)MHPopProgressViewConfig *(^MHPopProgressViewTitle)(NSString *title);

@property(nonatomic,copy,readonly)MHPopProgressViewConfig *(^MHPopProgressViewTitleFont)(UIFont *font);

@property(nonatomic,copy,readonly)MHPopProgressViewConfig *(^MHPopProgressViewTitleColor)(UIColor *color);

@property(nonatomic,copy,readonly)MHPopProgressViewConfig *(^MHPopProgressViewProgressColor)(UIColor *color);

@property(nonatomic,copy,readonly)MHPopProgressViewConfig *(^MHPopProgressViewProgressBGColor)(UIColor *color);

@property(nonatomic,copy,readonly)MHPopProgressViewConfig *(^MHPopProgressViewProgressWidth)(CGFloat width);

@property(nonatomic,copy,readonly)MHPopProgressViewConfig *(^MHPopProgressViewProgress)(CGFloat progress);



+(MHPopProgressViewConfig *)defaultConfig;





@end
