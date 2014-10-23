//
//  WApi.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"
#import "AsyncTaskManager.h"

@interface WApi : NSObject 

-(void)isCallbackToMainThread:(BOOL)value;

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

-(void)setApiUrl:(NSString*)url;

-(void)setApiMethod:(NSString*)method;

-(void)setContentType:(NSString*)contentType;

-(void)setApiParameters:(NSDictionary*)parameters;

-(void)startCallApi;

@end
