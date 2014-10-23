//
//  RootViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "RootViewController.h"
#import "WContext.h"
#import "Image.h"
#import "AsyncTaskManager.h"
#import "Config.h"
#import "Log.h"
#import "DataService.h"

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
    //[AsyncTaskManager executeTask:self];
    
    DataService *mydata = [[DataService alloc] init];
    [mydata setCallbackBlock:^(NSDictionary *data) {
        NSLog(@"success:%@",data);
        UIImage *img = [Image getImageFromName:@"p1.png"];
        _imageView.image = img;
    }];
    [mydata testApi:nil];
  
   
}



- (IBAction)clickBtn2:(id)sender {
    NSLog(@"clickBtn2");
    
}

/*-----------以下為WTaskprotocal必須實做的method-----------------*/
-(BOOL)callbackToMainThread{
    return YES;
}

-(void)doTask{
    NSLog(@"image doTask");
    m_ContentImage = [Image getImageFromUrl:@"http://cg2010studio.files.wordpress.com/2011/12/mrt.png"];
}

-(void)doCallback{
    NSLog(@"image doCallback");
    if(m_ContentImage !=nil){
        [_imageView setImage:m_ContentImage];
    }
}


@end
