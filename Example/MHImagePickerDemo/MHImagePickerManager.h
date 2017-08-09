//
//  MHImagePickerManager.h
//  musichome
//
//  Created by J on 2017/8/8.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MHImagePickerManager : NSObject
+ (instancetype)imagePickerManager ;
/**
 *  创建TZImagepick照片选择对象
 
 @param count 最大的照片数量
 @param selectPhotoBlock 选中回调
 @param cancelBlock 取消回调
 @param showBlock show回调
 */
-(void)MHImagePickPhotoWithCount:(NSInteger)count andSeletePhotoBlock:(void (^)(NSArray *photos))selectPhotoBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock;

/**
 *  创建TZImagePick视频选择对象
 
 @param selectBlock 选中回调
 @param cancelBlock 取消回调
 @param showBlock show回调
 */
-(void)MHImagePickVideoWithSelectVideoBlock:(void(^)(UIImage *coverImage,NSString *reduceVideoFileName))selectBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock;


/**
 拉起系统相机拍照方法

 @param takePictureBlock 照片对象
 @param cancelBlock 取消block
 @param showBlock 展示block
 */
-(void)MHTakePictureWithBlock:(void (^)(NSArray *photos))takePictureBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock;





@end
