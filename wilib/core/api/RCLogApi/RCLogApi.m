//
//  RCLogApi.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "RCLogApi.h"

@implementation RCLogApi


-(void)sendLogToServer:(NSDictionary*)data withCallback:(void(^)(NSDictionary* resultData))callbackBlock {

    ApiTask *myTask = [[ApiTask alloc] init];
    
    [myTask setApiUrl:[Config getConfigJsonValueForKey:@"LogServerUrl"]];
    
    [myTask setApiMethod:@"POST"];
    
    [myTask setApiParams:nil];
    
    [myTask setCallbackToMainThread:YES];
    
    [myTask setCallbackBlock:^(NSDictionary *data) {
        if(callbackBlock){
            callbackBlock(data);
        }
    }];
    
    [HttpTaskManager executeHttpTask:myTask];
}

@end
