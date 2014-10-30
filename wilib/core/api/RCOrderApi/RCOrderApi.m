//
//  RCOrderApi.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/29.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "RCOrderApi.h"
#import "RCConfig.h"
#import "ApiTask.h"
#import "HttpTaskManager.h"
#import "Json.h"

@implementation RCOrderApi

-(void)createNewOrder:(NSDictionary*)data withCallback:(void(^)(NSDictionary* resultData))callbackBlock {
    
    /*
    //test input
    Json *myjson = [[Json alloc] init];
    NSLog(@"json:%@",[[NSString alloc] initWithData:[myjson jsonEncode:data] encoding:NSUTF8StringEncoding]);
    */
    
    ApiTask *myTask = [[ApiTask alloc] init];
    
    [myTask setApiUrl:[[RCConfig new] getConfigJsonValueForKey:@"AddOrderApiUrl"]];
    
    [myTask setApiMethod:@"POST"];
    
    [myTask setApiParams:data];
    
    [myTask setCallbackToMainThread:YES];
    
    [myTask setCallbackBlock:^(NSDictionary *data) {
        if(callbackBlock){
            callbackBlock(data);
        }
    }];
    
    [HttpTaskManager executeHttpTask:myTask];
    
}



@end
