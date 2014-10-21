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
#import "WApi.h"


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
    //[AsyncTaskManager executeTask:self withTaskName:@"DownloadTask_1"];
    
    
    NSString *taskname = @"lucas_task_01";    
    [AsyncTaskManager executeApiTask:self withTaskName:taskname];
    /*
    NSString *taskname = @"lucas_task_01";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(compliteFunction:) name:taskname object:nil];
    
    
    WApi *myapi = [[WApi alloc] init];
    [myapi callApiGet:@"http://60.199.195.25/test.php" withParameters:nil withTaskName:taskname];
    
    */

}

-(void)compliteFunction:(NSNotification*) notification{
    
    NSDictionary *resultObject = [notification object];
    
    NSString *taskName = [resultObject objectForKey:@"taskName"];
    NSDictionary *data = [resultObject objectForKey:@"object"];
    NSError *error = [resultObject objectForKey:@"error"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:taskName object:nil];
    
    if(data != nil){
        [Log loggerMessage:[NSString stringWithFormat:@"taskName=%@ , object=%@",taskName,data]];
    }
    
    if(error != nil){
        [Log loggerMessage:[NSString stringWithFormat:@"taskName=%@ , error=%@",taskName,error]];
    }
}

- (IBAction)clickBtn2:(id)sender {
    NSLog(@"clickBtn2");
    
}

/*-----------以下為WApiTaskprotocal必須實做的method-----------------*/
-(NSDictionary*)getApiInputParameters{

    NSDictionary *input = [NSDictionary dictionaryWithObjectsAndKeys:@"http://60.199.195.25/test.php",@"url",@"GET",@"method",nil,@"parameters", nil];

    return input;
}

//task成功的後續處理
-(void)onApiComplite:(id)data{

    [Log loggerMessage:[NSString stringWithFormat:@"object=%@",data]];
}

//callback是否返回到main thread 若需要對UI進行更新則return YES
-(BOOL)apiCallbackToMainThread{
    return YES;
}


/*-----------以下為WTaskprotocal必須實做的method-----------------*/

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
