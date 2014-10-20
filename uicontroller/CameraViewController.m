//
//  CameraViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/16.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButtomHandel:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];

    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    imagePicker.delegate = self;
    
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(0,0,160,240)];
    [imageView setCenter:self.view.center];
    
    [self.view addSubview:imageView];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
