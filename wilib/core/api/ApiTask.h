//
//  ApiTask.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTask.h"

@interface ApiTask : NSObject <HttpTask>

-(void)setApiUrl:(NSString*)url;

-(void)setApiMethod:(NSString*)method;

-(void)setApiParams:(NSDictionary*)params;

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

-(void)setCallbackToMainThread:(BOOL)val;
    

@end
