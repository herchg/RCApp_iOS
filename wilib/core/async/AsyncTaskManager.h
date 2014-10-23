//
//  AsyncTaskManager.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/17.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Json.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"
#import "WTask.h"
#import "Log.h"

@interface AsyncTaskManager : NSObject

//執行Task
+(void)executeTask:(id<WTask>)task;

@end
