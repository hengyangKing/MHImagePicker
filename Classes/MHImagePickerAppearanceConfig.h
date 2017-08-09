//
//  MHImagePickerAppearanceConfig.h
//  musichome
//
//  Created by J on 2017/8/7.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHImagePickerAppearanceConfig : NSObject
+(MHImagePickerAppearanceConfig *_Nullable)defConfig;
/**
 导航栏iamge
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable nav_back;


@property(nonatomic,strong,readonly)UIImage * _Nullable nav_back_h;
/**
 选中数量底色
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable photo_number_bg;

/**
 未选中原图
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable photo_def_original;


/**
 选中原图
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable photo_sel_original;

/**
 未选中image
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable photo_def_picker;


/**
 未选中image_preview
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable photo_def_picker_preview;


/**
 选中image
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable photo_sel_picker;


/**
 选中image_preview
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable photo_sel_picker_preview;
/**
 视频icon
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable videoIcon;


/**
 列表图标
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable tableviewArrow;


/**
 拍照图标
 */
@property(nonatomic,strong,readonly)UIImage * _Nullable takePicture;


/**
 播放视频logo
 */
@property(nonnull,strong,readonly)UIImage *playVideo;

/**
 确定buttonTitleColor normal
 */
@property(nonatomic,strong,readonly)UIColor * _Nullable oKButtonTitleColorNormal;


/**
 确定buttonTitleColor Disabled
 */
@property(nonatomic,strong,readonly)UIColor * _Nullable oKButtonTitleColorDisabled;



/**
 设置导航栏back
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearanceNavImage)(UIImage * _Nullable image);


/**
 设置导航栏backH
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearanceNavHImage)(UIImage * _Nullable image);


/**
 设置选中时数量底色
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePhotoNumberBG)(UIImage * _Nullable image);


/**
 未选中原图
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePhotoDefOriginal)(UIImage * _Nullable image);


/**
 选中原图
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePhotoSelOriginal)(UIImage * _Nullable image);


/**
 未选中image
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePhotoDefPicker)(UIImage * _Nullable image);

/**
 未选中image预览
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePhotoDefPickerPreview)(UIImage * _Nullable image);


/**
 选中image
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePhotoSelPicker)(UIImage * _Nullable image);


/**
 选中image预览
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePhotoSelPickerPreview)(UIImage * _Nullable image);

/**
 视频icon
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearanceVideoIcon)(UIImage * _Nullable image);


/**
 列表箭头
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearanceTableviewArrow)(UIImage * _Nullable image);


/**
 拍照
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearanceTakePicture)(UIImage * _Nullable image);


/**
 播放视频
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearancePlay)(UIImage * _Nullable image);
/**
 okButtonTitleColor
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearanceOKButtonTitleColorNormal)(UIColor * _Nullable color);


/**
 OKButtonTitleColorDisabled
 */
@property(nonatomic,copy,readonly)MHImagePickerAppearanceConfig *_Nullable(^ _Nullable ImagePickerAppearanceOKButtonTitleColorDisabled)(UIColor * _Nullable color);

@end
