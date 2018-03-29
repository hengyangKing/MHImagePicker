//
//  UIApplication+MHRootController.m
//  musichome
//
//  Created by J on 2017/8/9.
//  Copyright © 2017年 J. All rights reserved.
//

#import "UIApplication+MHRootController.h"

@interface UIViewController (topVC)
- (UIViewController*)topVC;
/**
 当前VC是否位于视图栈顶层
 */
- (BOOL)isCurrentTopVC;
@end
@implementation UIViewController (topVC)
- (BOOL)isCurrentTopVC
{
    return self == [[UIApplication sharedApplication] root];
}

#pragma mark - pricate
- (UIViewController*)topVC
{
    if ([self isKindOfClass:[UITabBarController class]])
    {
        UITabBarController* tabBarController = (UITabBarController*)self;
        return [tabBarController.selectedViewController topVC];
    }
    else if ([self isKindOfClass:[UINavigationController class]])
    {
        UINavigationController* navigationController = (UINavigationController*)self;
        return [navigationController.topViewController topVC];
    }
    else if (self.presentedViewController)
    {
        return [self.presentedViewController topVC];
    }
    else if (self.childViewControllers.count > 0)
    {
        return [self.childViewControllers.lastObject topVC];
    }
    return self;
}
@end

@implementation UIApplication (MHRootController)

-(UIViewController * _Nullable)root {
    UIWindow * window = [self keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    // window Add subView, 寻找nextResponder的VC,这种结构不考虑了,建议修改结构
    if (!result)  return nil;
    
    return [result topVC];
}
@end




