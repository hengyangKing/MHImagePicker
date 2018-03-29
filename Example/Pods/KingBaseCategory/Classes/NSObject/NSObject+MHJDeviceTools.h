//
//  NSObject+MHJDeviceTools.h
//  musichome
//
//  Created by J on 2016/12/14.
//  Copyright © 2016年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

//机型枚举
typedef NS_ENUM(NSInteger,MHJDeviceType){
    iphoneHoary=0, // iphone 4 4s
    iphoneLesser=1,//iphone 5 5s se
    iphoneNormel=2, //iphone 6 6s 7 8
    iphonePlus=3, //iphone 6+ 6s+ 7+ 8+
    iphoneX =4, //iphone X
};

//ios系统版本

#define ios8x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f)

#define ios9x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 10.0f)

#define ios10x [[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0f


@interface NSObject (MHJDeviceTools)
/**
 *  返回系统号
 *
 */
-(double)getSelfDevice;
/**
 *  返回用户机型
 */
-(MHJDeviceType)getDeviceModel;


/**
 返回机器统一标识
 */
-(NSString *)ADID;


/**
 返回version
 */
-(NSString *)MHJVersion;

@end
