//
//  HttpTaskManager.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "HttpTaskManager.h"

@implementation HttpTaskManager

+(AFHTTPRequestOperationManager *)createNetworkManager{

    AFHTTPRequestOperationManager *networkManager = [AFHTTPRequestOperationManager manager];
    
    [networkManager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    //timeout設定
    [networkManager.requestSerializer setTimeoutInterval:15];
    
    return networkManager;
}

//GET
+(void)executeHttpTask:(id<HttpTask>)task {
    
    NSArray *methodList = @[@"GET", @"POST", @"PUT",@"DELETE"];
    
    int method = [methodList indexOfObject:[task getApiMethod]];
    
    switch (method) {
        case 0:
            // GET
            [HttpTaskManager startGet:task];
            break;
        case 1:
            // POST
            [HttpTaskManager startPost:task];
            break;
        case 2:
            // PUT
            [HttpTaskManager startPut:task];
            break;
        case 3:
            // DELETE
            [HttpTaskManager startDelete:task];
            break;
        default:
            break;
    }
}


+(void)startGet:(id<HttpTask>)task {
    
    AFHTTPRequestOperationManager *networkManager = [HttpTaskManager createNetworkManager];
    
    [networkManager GET:[task getApiUrl] parameters :[task getApiParams]
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
                    [HttpTaskManager taskComplite:task withResult:YES withData:responseObject];
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     
                    [HttpTaskManager taskComplite:task withResult:NO withData:error];
                }];
}


+(void)startPost:(id<HttpTask>)task {
    
    AFHTTPRequestOperationManager *networkManager = [HttpTaskManager createNetworkManager];
    
    [networkManager POST:[task getApiUrl] parameters :[task getApiParams]
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
                    [HttpTaskManager taskComplite:task withResult:YES withData:responseObject];
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    
                    [HttpTaskManager taskComplite:task withResult:NO withData:error];
                }];
}


+(void)startPut:(id<HttpTask>)task {
    
    AFHTTPRequestOperationManager *networkManager = [HttpTaskManager createNetworkManager];
    
    [networkManager PUT:[task getApiUrl] parameters :[task getApiParams]
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
                    [HttpTaskManager taskComplite:task withResult:YES withData:responseObject];
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    
                    [HttpTaskManager taskComplite:task withResult:NO withData:error];
                }];
}


+(void)startDelete:(id<HttpTask>)task {
    
    AFHTTPRequestOperationManager *networkManager = [HttpTaskManager createNetworkManager];
    
    [networkManager DELETE:[task getApiUrl] parameters :[task getApiParams]
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
                    [HttpTaskManager taskComplite:task withResult:YES withData:responseObject];
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    
                    [HttpTaskManager taskComplite:task withResult:NO withData:error];
                }];
}


+(void)taskComplite:(id<HttpTask>)task withResult:(BOOL)result withData:(id)data {

    NSDictionary *resultDict;
    
    if(result){
        
        resultDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],@"result",data,@"data", nil];
    }else{
        
        resultDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],@"result",data,@"error", nil];
    }
    
    
    if([task callbackToMainThread]){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [task doCallback:resultDict];
        });
    }else{
        
        [task doCallback:resultDict];
    }
}

@end
