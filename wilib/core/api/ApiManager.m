//
//  Api.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "ApiManager.h"

@implementation ApiManager{

    //外部設定的callback block
    void (^mCallbackBlock)(NSDictionary* resultData);
    
    BOOL mCallbackToMainThread;
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock {
    
    mCallbackBlock = callbackBlock;
}

-(void)setCallbackToMainThread:(BOOL)val {
    
    mCallbackToMainThread = val;
}

-(void)apiComplite:(NSDictionary*)data {

    if(mCallbackBlock){
        mCallbackBlock(data);
    }
}

-(ApiTask*)createApiTask {

    return [[ApiTask alloc] init];
}

//test
-(void)testApi:(NSDictionary*)data {
    
    ApiTask *myTask = [self createApiTask];
    
    [myTask setApiUrl:[Config getConfigJsonValueForKey:@"LogServerUrl"]];
    
    [myTask setApiMethod:@"GET"];
    
    [myTask setApiParams:data];
    
    [myTask setCallbackToMainThread:YES];
    
    [myTask setCallbackBlock:^(NSDictionary *data) {
        
        [self apiComplite:data];
    }];
    
    [HttpTaskManager executeHttpTask:myTask];
}

//發送LOG至server
-(void)sendLogToServer:(NSDictionary*)data {
    
    ApiTask *myTask = [self createApiTask];
    
    [myTask setApiUrl:[Config getConfigJsonValueForKey:@"LogServerUrl"]];
    
    [myTask setApiMethod:@"POST"];
    
    [myTask setApiParams:data];
    
    //[myTask setCallbackToMainThread:YES];
    
    [myTask setCallbackBlock:^(NSDictionary *data) {
        
        [self apiComplite:data];
    }];
    
    [HttpTaskManager executeHttpTask:myTask];
}

@end
