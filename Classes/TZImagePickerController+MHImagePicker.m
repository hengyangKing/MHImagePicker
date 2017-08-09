//
//  TZImagePickerController+MHImagePicker.m
//  musichome
//
//  Created by J on 2017/8/8.
//  Copyright © 2017年 J. All rights reserved.
//

#import "TZImagePickerController+MHImagePicker.h"
#import "UIApplication+MHRootController.h"
@implementation TZImagePickerController (MHImagePicker)
/**
 选取照片
 
 @param count 选中照片数量
 @param config 外观设置
 @param selectBlock 选中照片block
 @param cancelBlock 取消选中block
 @param showBlock 展示block
 */
+(void)MHImagePickPhotoWithCount:(NSInteger)count andConfig:(MHImagePickerAppearanceConfig *(^)())config andseletePhotoBlock:(void (^)(NSArray *photos))selectBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:count andConfig:config];
    
    imagePickerVc.allowPickingVideo=NO;
    imagePickerVc.allowPickingOriginalPhoto=NO;
    imagePickerVc.allowPickingImage=YES;
    imagePickerVc.oKButtonTitleColorNormal=[TZImageManager manager].config.oKButtonTitleColorNormal;
    imagePickerVc.oKButtonTitleColorDisabled=[TZImageManager manager].config.oKButtonTitleColorDisabled;
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto){
        if (selectBlock) {
            selectBlock(photos);
        }
    }];
    [imagePickerVc setImagePickerControllerDidCancelHandle:cancelBlock];
    
    [[UIApplication sharedApplication].root presentViewController:imagePickerVc animated:YES completion:showBlock];
}




/**
 选择视频
 
 @param config 外观设置
 @param selectBlock 选中block
 @param cancelBlock 取消block
 @param showBlock 展示block
 */
+(void)MHImagePickVideoWithConfig:(MHImagePickerAppearanceConfig *(^)())config andSelectVideoBlock:(void(^)(UIImage *coverImage,NSString *reduceVideoFileName))selectBlock andCancelBlock:(void (^)())cancelBlock andShowBlcok:(void(^)())showBlock
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 andConfig:config];
    imagePickerVc.allowPickingVideo=YES;
    imagePickerVc.allowPickingOriginalPhoto=NO;
    imagePickerVc.allowPickingImage=NO;
    imagePickerVc.oKButtonTitleColorNormal=[TZImageManager manager].config.oKButtonTitleColorNormal;
    imagePickerVc.oKButtonTitleColorDisabled=[TZImageManager manager].config.oKButtonTitleColorDisabled;

    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage,NSString *reduceVideoFileName){
        if (selectBlock) {
            selectBlock(coverImage,reduceVideoFileName);
        }
    }];
    [imagePickerVc setImagePickerControllerDidCancelHandle:cancelBlock];
    
    [[UIApplication sharedApplication].root presentViewController:imagePickerVc animated:YES completion:showBlock];
}


@end
