//
//  MHProgressView.h
//  musichome
//
//  Created by J on 2017/7/23.
//  Copyright © 2017年 J. All rights reserved.
//
#import "MHPopProgressViewConfig.h"

@interface MHProgressView : UIView
@property(nonatomic,assign)CGFloat progress;
@property(nonatomic,strong)MHPopProgressViewConfig *config;
@end
