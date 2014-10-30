//
//  Api.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "RCApi.h"

@implementation RCApi


-(void)sendLogToServer:(NSDictionary*)data withCallback:(void(^)(NSDictionary* resultData))callbackBlock {
    
    RCLogApi *logApi = [[RCLogApi alloc] init];
    
    [logApi sendLogToServer:data withCallback:callbackBlock];
}

-(void)createNewOrder:(NSDictionary*)data withCallback:(void(^)(NSDictionary* resultData))callbackBlock {
    
    RCOrderApi *orderApi = [[RCOrderApi alloc] init];
    
    [orderApi createNewOrder:data withCallback:callbackBlock];
}

@end
