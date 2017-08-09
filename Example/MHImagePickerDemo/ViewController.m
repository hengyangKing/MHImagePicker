//
//  ViewController.m
//  MHImagePickerDemo
//
//  Created by J on 2017/8/1.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "MHImagePickerManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pickPhoto:(UIButton *)sender {
    [[MHImagePickerManager imagePickerManager]MHImagePickPhotoWithCount:9 andSeletePhotoBlock:^(NSArray *photos) {
        NSLog(@"photos----%@",photos);
    } andCancelBlock:^{
        
    } andShowBlcok:^{
        
    }];
}
- (IBAction)pickVideo:(id)sender {
    [[MHImagePickerManager imagePickerManager]MHImagePickVideoWithSelectVideoBlock:^(UIImage *coverImage, NSString *reduceVideoFileName) {
        NSLog(@"coverImage---%@",coverImage);
        NSLog(@"reduceVideoFileName----%@",reduceVideoFileName);
    } andCancelBlock:^{
        
    } andShowBlcok:^{
        
    }];
}
- (IBAction)takePicture:(id)sender {
    [[MHImagePickerManager imagePickerManager]MHTakePictureWithBlock:^(NSArray *photos) {
        NSLog(@"photos----%@",photos);
    } andCancelBlock:^{
        
    } andShowBlcok:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
