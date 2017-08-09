//
//  MHPopBaseView.h
//  musichome
//
//  Created by J on 2017/7/20.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "MHPopupViewConst.h"
@interface MHPopBaseView : UIView
@property(nonatomic,strong)UIView *backgroundView;
-(void)showPopViewSucess:(void(^)())success;


@property(nonatomic,copy)void (^showBlock)();
@property(nonatomic,copy)void (^dismissBlock)();
@property(nonatomic,copy)void (^needDisMissBlock)();

@end
