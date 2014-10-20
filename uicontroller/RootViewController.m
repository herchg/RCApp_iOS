//
//  RootViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "RootViewController.h"
#import "Context.h"
#import "Image.h"
#import "AsyncTaskManager.h"

@interface RootViewController ()

@end

@implementation RootViewController{
    //下載後的圖檔
    UIImage *contentImage;
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
    [AsyncTaskManager executeTask:self withTaskName:@"DownloadTask_1"];
}

- (IBAction)clickBtn2:(id)sender {
    NSLog(@"clickBtn2");
}

/*-----------以下為protocal必須實做的method-----------------*/


-(BOOL)callbackToMainThread{
    return YES;
}

-(BOOL)doTask{
    contentImage = [Image getImageFromUrl:@"http://www.glitters20.com/wp-content/uploads/2013/06/Lol-19.jpg"];
    
    if(contentImage != nil){
        return YES;
    }else{
        return NO;
    }
}

-(void)onSuccess:(NSString*)taskName{
    [_imageView setImage:contentImage];
    NSLog(@"task finish,task name:%@",taskName);
}

-(void)onFail:(NSString*)taskName{
    NSLog(@"error with task name:%@",taskName);
}

@end
