//
//  NSObject+MHJDeviceTools.m
//  musichome
//
//  Created by J on 2016/12/14.
//  Copyright © 2016年 J. All rights reserved.
//

#import "NSObject+MHJDeviceTools.h"
#import <AdSupport/AdSupport.h>
@implementation NSObject (MHJDeviceTools)

-(double)getSelfDevice
{
    return    [[[UIDevice currentDevice] systemVersion] doubleValue];
}
-(MHJDeviceType)getDeviceModel
{
    CGSize currentSize = [[UIScreen mainScreen] currentMode].size;
    

    if (CGSizeEqualToSize(CGSizeMake(1125, 2436), currentSize)) {
        return iphoneX;
    }else if (CGSizeEqualToSize(CGSizeMake(1242, 2208), currentSize)){
        return iphonePlus;
    }else if (CGSizeEqualToSize(CGSizeMake(750, 1334), currentSize)){
        return iphoneNormel;
    }else if (CGSizeEqualToSize(CGSizeMake(640, 1136), currentSize)){
        return iphoneLesser;
    }else{
        return iphoneHoary;
    }
}
//得到ADID
-(NSString *)ADID{
    
    NSString *adid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return adid;
    
}

-(NSString *)MHJVersion
{
    //添加版本信息
    //    basic/check?v=1.0.1_12&basicVer=20140812
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    //    CFBundleShortVersionString
    NSString *ShortVersion=[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSString *version=[NSString stringWithFormat:@"%@_%@",ShortVersion,currentVersion];
    
    return version;
}



@end
