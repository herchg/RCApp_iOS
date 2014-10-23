//
//  HttpTaskManager.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "HttpTaskManager.h"

@implementation HttpTaskManager


+(void)executeHttpTaskGet:(NSString*)apiUrl withParams:(NSDictionary*)params withTask:(id<HttpTask>)task {
    
     AFHTTPRequestOperationManager *networkManager = [AFHTTPRequestOperationManager manager];
 
     [networkManager GET:apiUrl parameters :params success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
         NSDictionary *successResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],@"result",responseObject,@"data", nil];
         
         if([task callbackToMainThread]){
             dispatch_async(dispatch_get_main_queue(), ^{
                 [task doCallback:successResult];
             });
         }else{
             [task doCallback:successResult];
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         NSDictionary *errorResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],@"result",error,@"error", nil];
         
         if([task callbackToMainThread]){
             dispatch_async(dispatch_get_main_queue(), ^{
                 [task doCallback:errorResult];
             });
         }else{
             [task doCallback:errorResult];
         }
     }];
}

+(void)executeHttpTaskPost:(NSString*)apiUrl withParams:(NSDictionary*)params withTask:(id<HttpTask>)task {
    
    AFHTTPRequestOperationManager *networkManager = [AFHTTPRequestOperationManager manager];
    
    [networkManager POST:apiUrl parameters :params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *successResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],@"result",responseObject,@"data", nil];
        
        if([task callbackToMainThread]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [task doCallback:successResult];
            });
        }else{
            [task doCallback:successResult];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSDictionary *errorResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],@"result",error,@"error", nil];
        
        if([task callbackToMainThread]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [task doCallback:errorResult];
            });
        }else{
            [task doCallback:errorResult];
        }
    }];
}

+(void)executeHttpTaskPut:(NSString*)apiUrl withParams:(NSDictionary*)params withTask:(id<HttpTask>)task {
    
    AFHTTPRequestOperationManager *networkManager = [AFHTTPRequestOperationManager manager];
    
    [networkManager PUT:apiUrl parameters :params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *successResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],@"result",responseObject,@"data", nil];
        
        if([task callbackToMainThread]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [task doCallback:successResult];
            });
        }else{
            [task doCallback:successResult];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSDictionary *errorResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],@"result",error,@"error", nil];
        
        if([task callbackToMainThread]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [task doCallback:errorResult];
            });
        }else{
            [task doCallback:errorResult];
        }
    }];
}

+(void)executeHttpTaskDelete:(NSString*)apiUrl withParams:(NSDictionary*)params withTask:(id<HttpTask>)task {
    
    AFHTTPRequestOperationManager *networkManager = [AFHTTPRequestOperationManager manager];
    
    [networkManager DELETE:apiUrl parameters :params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *successResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],@"result",responseObject,@"data", nil];
        
        if([task callbackToMainThread]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [task doCallback:successResult];
            });
        }else{
            [task doCallback:successResult];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSDictionary *errorResult = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],@"result",error,@"error", nil];
        
        if([task callbackToMainThread]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [task doCallback:errorResult];
            });
        }else{
            [task doCallback:errorResult];
        }
    }];
}



@end
