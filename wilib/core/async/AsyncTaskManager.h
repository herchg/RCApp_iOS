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
#import "WApiTask.h"

@interface AsyncTaskManager : NSObject

//執行Task 並傳入taskName作為識別
+(void)executeTask:(id<WTask>)task withTaskName:(NSString*)taskName;

+(void)executeApiTask:(id<WApiTask>)task withTaskName:(NSString*)taskName;

@end
