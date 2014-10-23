//
//  HttpTaskManager.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"
#import "HttpTask.h"

@interface HttpTaskManager : NSObject

+(void)executeHttpTask:(id<HttpTask>)task;

@end
