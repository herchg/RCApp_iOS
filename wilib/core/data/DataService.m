//
//  dataService.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "DataService.h"

@implementation DataService{
    void (^_callbackBlock)(NSDictionary* resultData);
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock{
    _callbackBlock = callbackBlock;
}

-(void)testApi:(NSDictionary*)data{
    WApi *myapi = [[WApi alloc] init];
    [myapi setApiMethod:@"GET"];
    [myapi setApiUrl:[Config getConfigJsonValueForKey:@"AddOrderApiUrl"]];
    [myapi setApiParameters:data];
    [myapi setContentType:@"text/html"];
    [myapi isCallbackToMainThread:YES];
    [myapi setCallbackBlock:^(NSDictionary *resultData) {
        [self checkApiComplite:resultData];
    }];
    
    [myapi startCallApi];
}

-(void)checkApiComplite:(NSDictionary*)data{
    
    _callbackBlock(data);
}

@end
