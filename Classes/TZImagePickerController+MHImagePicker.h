//
//  TZImagePickerController+MHImagePicker.h
//  musichome
//
//  Created by J on 2017/8/8.
//  Copyright © 2017年 J. All rights reserved.
//

#import "TZImagePickerController.h"
#import "MHImagePickerAppearanceConfig.h"
@interface TZImagePickerController (MHImagePicker)

/**
 选取照片

 @param count 选中照片数量
 @param config 外观设置
 @param selectBlock 选中照片block
 @param cancelBlock 取消选中block
 @param showBlock 展示block
 */
+(void)MHImagePickPhotoWithCount:(NSInteger)count andConfig:(MHImagePickerAppearanceConfig *(^)())config andseletePhotoBlock:(void (^)(NSArray *photos))selectBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock;




/**
 选择视频

 @param config 外观设置
 @param selectBlock 选中block
 @param cancelBlock 取消block
 @param showBlock 展示block
 */
+(void)MHImagePickVideoWithConfig:(MHImagePickerAppearanceConfig *(^)())config andSelectVideoBlock:(void(^)(UIImage *coverImage,NSString *reduceVideoFileName))selectBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock;
@end
