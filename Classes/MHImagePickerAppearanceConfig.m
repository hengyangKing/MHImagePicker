//
//  MHImagePickerAppearanceConfig.m
//  musichome
//
//  Created by J on 2017/8/7.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHImagePickerAppearanceConfig.h"

@implementation MHImagePickerAppearanceConfig
+(MHImagePickerAppearanceConfig *)defConfig
{
    MHImagePickerAppearanceConfig *config=[[MHImagePickerAppearanceConfig alloc]init];
    return config;
}
-(void)setNav_back:(UIImage * _Nullable)nav_back
{
    _nav_back=nav_back;
}
-(void)setNav_back_h:(UIImage * _Nullable)nav_back_h
{
    _nav_back=nav_back_h;
}
-(void)setVideoIcon:(UIImage *)videoIcon
{
    _videoIcon=videoIcon;
}
-(void)setTableviewArrow:(UIImage *)tableviewArrow
{
    _tableviewArrow=tableviewArrow;
}
-(void)setPhoto_number_bg:(UIImage *)photo_number_bg
{
    _photo_number_bg=photo_number_bg;
}
-(void)setPhoto_def_picker:(UIImage *)photo_def_picker
{
    _photo_def_picker=photo_def_picker;
}
-(void)setPhoto_def_picker_preview:(UIImage * _Nullable)photo_def_picker_preview
{
    _photo_def_picker_preview=photo_def_picker_preview;
}
-(void)setPhoto_sel_picker:(UIImage *)photo_sel_picker
{
    _photo_sel_picker=photo_sel_picker;
}
-(void)setPhoto_sel_picker_preview:(UIImage * _Nullable)photo_sel_picker_preview
{
    _photo_sel_picker_preview=photo_sel_picker_preview;
}
-(void)setPhoto_def_original:(UIImage *)photo_def_original
{
    _photo_def_original=photo_def_original;
}
-(void)setPhoto_sel_original:(UIImage *)photo_sel_original
{
    _photo_sel_original=photo_sel_original;
}
-(void)setTakePicture:(UIImage *)takePicture
{
    _takePicture=takePicture;
}
-(void)setPlayVideo:(UIImage * _Nonnull)playVideo
{
    _playVideo=playVideo;
}
-(void)setOKButtonTitleColorNormal:(UIColor *)oKButtonTitleColorNormal
{
    _oKButtonTitleColorNormal=oKButtonTitleColorNormal;
}
-(void)setOKButtonTitleColorDisabled:(UIColor *)oKButtonTitleColorDisabled
{
    _oKButtonTitleColorDisabled=oKButtonTitleColorDisabled;
}

-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearanceNavImage{

    return ^(UIImage *image){
        self.nav_back=image;
        return self;
    };
}
-(MHImagePickerAppearanceConfig * _Nullable (^)(UIImage * _Nullable))ImagePickerAppearanceNavHImage
{
    return ^(UIImage *image){
        self.nav_back_h=image;
        return self;
    };
}


-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearancePhotoNumberBG
{
    return ^(UIImage *image){
        self.photo_number_bg=image;
        return self;
    };
}
-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearancePhotoDefOriginal{

    return ^(UIImage *image){
        self.photo_def_original=image;
        return self;
    };
}
-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearancePhotoSelOriginal{

    return ^(UIImage *image){
        self.photo_sel_original=image;
        return self;
    };
}
-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearancePhotoDefPicker{

    return ^(UIImage *image){
        self.photo_def_picker=image;
        return self;};

}
-(MHImagePickerAppearanceConfig * _Nullable (^)(UIImage * _Nullable))ImagePickerAppearancePhotoDefPickerPreview
{
    return ^(UIImage *image){
        self.photo_def_picker_preview=image;
        return self;};
}
-(MHImagePickerAppearanceConfig * _Nullable (^)(UIImage * _Nullable))ImagePickerAppearancePhotoSelPickerPreview
{
    return ^(UIImage *image){
        self.photo_sel_picker_preview=image;
        return self;
    };
}

-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearancePhotoSelPicker
{
    return ^(UIImage *image){
        self.photo_sel_picker=image;
        return self;
    };
}
-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearanceVideoIcon
{
    return ^(UIImage *image){
        self.videoIcon=image;
        return self;
    };
}
-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearanceTableviewArrow
{
    return ^(UIImage *image){
        self.tableviewArrow=image;
        return self;
    };
}
-(MHImagePickerAppearanceConfig *(^)(UIColor *))ImagePickerAppearanceOKButtonTitleColorNormal
{
    return ^(UIColor *color){
        self.oKButtonTitleColorNormal=color;
        return self;};
    
}
-(MHImagePickerAppearanceConfig *(^)(UIColor *))ImagePickerAppearanceOKButtonTitleColorDisabled{


    return ^(UIColor *color){
        self.oKButtonTitleColorDisabled=color;
        return self;
    };
}
-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearanceTakePicture
{
    return ^(UIImage *image){
        self.takePicture=image;
        return self;};
}

-(MHImagePickerAppearanceConfig *(^)(UIImage *))ImagePickerAppearancePlay{
    return ^(UIImage *image){
        self.playVideo=image;
        return self;};

}





@end
