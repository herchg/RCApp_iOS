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


+(void)executeApiTask:(id<WApiTask>)task withTaskName:(NSString*)taskName{
    
      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
          
        AFHTTPRequestOperationManager *networkManager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *inputData = [task getApiInputParameters];

        NSString *url = [inputData objectForKey:@"url"];
        NSString *method = [inputData objectForKey:@"method"];
        NSDictionary *parameters = [inputData objectForKey:@"parameters"];
          
        NSArray *methodList = @[@"GET",@"POST",@"PUT",@"DELETE"];
        NSUInteger selectMethod = [methodList indexOfObject:method];
          
        switch(selectMethod){
            //GET
            case 0:
            {
                [networkManager GET:url
                         parameters:parameters
                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:YES withObject:responseObject];
                            }
                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:NO withObject:error];
                            }];
            }
                break;
            //POST
            case 1:
            {
                [networkManager POST:url
                         parameters:parameters
                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:YES withObject:responseObject];
                            }
                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:NO withObject:error];
                            }];
            }
                break;
            //PUT
            case 2:
            {
                [networkManager PUT:url
                         parameters:parameters
                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:YES withObject:responseObject];
                            }
                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:NO withObject:error];
                            }];
            }
                break;
            //DELETE
            case 3:
            {
                [networkManager DELETE:url
                         parameters:parameters
                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:YES withObject:responseObject];
                            }
                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                [AsyncTaskManager apiTaskComplite:task withTaskName:taskName isSuccess:NO withObject:error];
                            }];
            }
                break;
            default:
                
                break;
        }
    });
}

+(void)apiTaskComplite:(id<WApiTask>)task withTaskName:(NSString*)taskName isSuccess:(BOOL)status withObject:(id)object{

    NSDictionary *result;
    if(status){
        result = @{@"taskName":taskName,@"object":object};
    }else{
        result = @{@"taskName":taskName,@"error":object};
    }

    //做完之後返回MainThread
    if([task apiCallbackToMainThread]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [task onApiComplite:result];
        });
    }else{
        [task onApiComplite:result];
    }
    
}


@end
