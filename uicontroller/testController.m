//
//  RootViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "testController.h"
#import "WContext.h"
#import "UiTool.h"
#import "Log.h"
#import "Image.h"
#import "PhotoAlbumListViewController.h"

@interface testController ()

@end

@implementation testController{
    
    PhotoAlbumListViewController *mListPhoto;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView.frame = CGRectMake(0, 0, 800,800);
 
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickButton:(id)sender {
    
    UIImage *myimg = [Image getImageFromName:@"p1.png"];
    
    [Image saveImageToPhotoAlbum:myimg];
    
    /*
    UiTool *myUITool = [[UiTool alloc] init];
    
    UIImageView *loadingView = [myUITool createLoadingImageView];
    
    [self.view addSubview:loadingView];
    
    //取消使用者的手勢/touch事件 不能點擊任何按鈕
    [self.view setUserInteractionEnabled:NO];
    
    DataService *mydataService = [WContext getDataServiceClass];
    [mydataService setCallbackToMainThread:NO];
    [mydataService setCallbackBlock:^(NSDictionary *data) {
        [Log loggerMessage:[NSString stringWithFormat:@"get data:%@",data]];
        
        [loadingView removeFromSuperview];
        
        //還原使用者的手勢/touch事件
        [self.view setUserInteractionEnabled:YES];
    }];
    [mydataService testDataService];
    */
    
    
    /*
    ImageLoder *myTask = [[ImageLoder alloc] init];
    [myTask setTargetImageView:_imageView withDefaultImage:@"p3.png"];
    [myTask setImageUrl:@"http://cg2010studio.files.wordpress.com/2011/12/mrt.png"];
    [myTask startLoadingImage];
     */
}



- (IBAction)clickBtn2:(id)sender {
    
    [Log loggerMessage:@"clickBtn2"];
    
    if(mListPhoto == nil){
        mListPhoto = [[PhotoAlbumListViewController alloc] init];
    }
    
    [mListPhoto setCallbackBlock:^(NSDictionary *data) {
        if(data == nil){
            NSLog(@"no select");
        }else{
            NSLog(@"image=%@",[data objectForKey:@"image"]);
        }
        
        
    }];
    
    UIViewController *albumView = [mListPhoto createPhotoAlbumViewController];
     
    [self presentViewController:albumView animated:YES completion:nil];
     
    
    
}

@end
