//
//  webApiLib.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "WApi.h"

@implementation WApi{
    AFHTTPRequestOperationManager *m_networkManager;
}

-(WApi*)init{
    
    m_networkManager = [AFHTTPRequestOperationManager manager];
    
    return self;
}

-(void)responseIsText{
    m_networkManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
}

-(void)callApiGet:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName{
    [m_networkManager GET:url
               parameters:parameters
                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                      [self apiSuccessCallback:taskName withObject:responseObject];
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      [self apiFailCallback:taskName withError:error];
                  }];
}

-(void)callApiPost:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName{
    [m_networkManager POST:url
                parameters:parameters
                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       [self apiSuccessCallback:taskName withObject:responseObject];
                   }
                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       [self apiFailCallback:taskName withError:error];
                   }];
}

-(void)callApiDelete:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName{
    [m_networkManager DELETE:url
               parameters:parameters
                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                      [self apiSuccessCallback:taskName withObject:responseObject];
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      [self apiFailCallback:taskName withError:error];
                      
                  }];
}

-(void)callApiPut:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName{
    [m_networkManager PUT:url
                  parameters:parameters
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                         
                         [self apiSuccessCallback:taskName withObject:responseObject];
                     }
                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                         [self apiFailCallback:taskName withError:error];
                     }];
}

-(void)apiSuccessCallback:(NSString*)taskName withObject:(id)object{
    
    NSDictionary *successDict = @{@"taskName":taskName,@"object":object};
    [[NSNotificationCenter defaultCenter] postNotificationName:taskName object:successDict];
}

-(void)apiFailCallback:(NSString*)taskName withError:(NSError*)error{
    
    NSDictionary *failDict = @{@"taskName":taskName,@"error":error};
    [[NSNotificationCenter defaultCenter] postNotificationName:taskName object:failDict];
}

@end
