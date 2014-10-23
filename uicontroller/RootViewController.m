//
//  RootViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "RootViewController.h"
#import "WContext.h"
#import "Config.h"
#import "Log.h"
#import "DataService.h"
#import "ImageLoder.h"
#import "NetworkTool.h"
#import "UiTool.h"

@interface RootViewController ()

@end

@implementation RootViewController{
    //下載後的圖檔
    UIImage *m_ContentImage;
    
    NSMutableArray *m_MyDataService;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView.frame = CGRectMake(0, 0, 800,800);

    m_MyDataService = [[NSMutableArray alloc] init];
    /*
    NSString *logStr = [NSString stringWithFormat:@"config value:%@",[Config getConfigJsonValueForKey:@"LogWriteToFile"]];
    [Log loggerMessage:logStr];
    */
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {

    UIImageView *loadingView = [UiTool createLoadingImageView];
    
    [self.view addSubview:loadingView];
    
    //取消使用者的手勢/touch事件 不能點擊任何按鈕
    [self.view setUserInteractionEnabled:NO];
    
    DataService *mydataService = [[DataService alloc] init];
    [mydataService setCallbackToMainThread:NO];
    [mydataService setCallbackBlock:^(NSDictionary *data) {
        NSLog(@"get data:%@",data);
        
        [loadingView removeFromSuperview];
        
        //還原使用者的手勢/touch事件
        [self.view setUserInteractionEnabled:YES];
    }];
    [mydataService testDataService];
    
    
    /*
    DataService *mydata = [[DataService alloc] init];
    [mydata setCallbackBlock:^(NSDictionary *data) {
        NSLog(@"success:%@",data);
    }];
    [mydata testApi:nil];
  
   */
    
    /*
    ImageLoder *myTask = [[ImageLoder alloc] init];
    [myTask setTargetImageView:_imageView withDefaultImage:@"p3.png"];
    [myTask setImageUrl:@"http://cg2010studio.files.wordpress.com/2011/12/mrt.png"];
    [myTask startLoadingImage];
     */
}



- (IBAction)clickBtn2:(id)sender {
    NSLog(@"clickBtn2");
    
}


@end
