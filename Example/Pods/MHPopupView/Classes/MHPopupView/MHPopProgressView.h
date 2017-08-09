//
//  MHPopProgressView.h
//  musichome
//
//  Created by J on 2017/7/23.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHPopBaseView.h"
#import "MHPopProgressViewConfig.h"
@interface MHPopProgressView : MHPopBaseView
+ (MHPopProgressView *)sharedInstance;

-(void)showWithConfig:(MHPopProgressViewConfig *(^)(MHPopProgressViewConfig *config))config;

-(void)disMiss;

@property(nonatomic,copy,readonly)void (^MHPopProgressViewProgress)(CGFloat progress);


@end
