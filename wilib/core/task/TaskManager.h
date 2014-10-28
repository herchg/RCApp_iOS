//
//  AsyncTaskManager.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/17.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Task.h"
#import "Log.h"

@interface TaskManager : NSObject

//執行Task
+(void)executeTask:(id<Task>)task;

@end
