//
//  AsyncTaskManager.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/17.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "AsyncTaskManager.h"

@implementation AsyncTaskManager

+(void)executeTask:(id<WTask>)task withTaskName:(NSString*)taskName{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        BOOL result = [task doTask];
        
        //做完之後返回MainThread
        if([task callbackToMainThread]){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(result){
                    [task onSuccess:taskName];
                }else{
                    [task onFail:taskName];
                }
            });
            
        }else{//做完之後不返回main thread
            if(result){
                [task onSuccess:taskName];
            }else{
                [task onFail:taskName];
            }
        }
    });
    
}

@end
