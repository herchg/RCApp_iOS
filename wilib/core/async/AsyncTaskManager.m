//
//  AsyncTaskManager.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/17.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "AsyncTaskManager.h"

@implementation AsyncTaskManager

+(void)executeTask:(id<WTask>)task{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        [task doTask];
        //做完之後返回MainThread
        if([task callbackToMainThread]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [task doCallback];
            });
        }else{//做完之後不返回main thread
            [task doCallback];
        }
    });
}

@end
