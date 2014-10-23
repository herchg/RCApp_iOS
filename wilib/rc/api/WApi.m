//
//  WApi.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "WApi.h"

@implementation WApi{
    BOOL m_CallbackToMainThread;
    
    NSString *m_ApiUrl;
    
    NSString *m_ApiMethod;
    
    NSDictionary *m_ApiParameters;
    
    NSString *m_ContentType;
    
    AFHTTPRequestOperationManager *_NetworkManager;
    
    NSDictionary *m_ResultObject;
    
    void (^_callbackBlock)(NSDictionary* resultData);
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock{
    _callbackBlock = callbackBlock;
}

-(void)isCallbackToMainThread:(BOOL)value{
    m_CallbackToMainThread = value;
}

-(void)setApiUrl:(NSString*)url{
    m_ApiUrl = url;
}

-(void)setApiMethod:(NSString*)method{
    m_ApiMethod = method;
}

-(void)setContentType:(NSString*)contentType{
    m_ContentType = contentType;
}

-(void)setApiParameters:(NSDictionary*)parameters{
    m_ApiParameters = parameters;
}

-(void)createNetworkManager{
    _NetworkManager = [AFHTTPRequestOperationManager manager];
    
    [_NetworkManager.responseSerializer.acceptableContentTypes setByAddingObject:m_ContentType];
}

-(void)callApiGet{
    [self createNetworkManager];
    [_NetworkManager GET:m_ApiUrl parameters:m_ApiParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self apiComplite:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self apiComplite:error];
    }];
}

-(void)callApiPost{
    [self createNetworkManager];
    [_NetworkManager POST:m_ApiUrl parameters:m_ApiParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self apiComplite:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self apiComplite:error];
    }];
}

-(void)callApiPut{
    [self createNetworkManager];
    [_NetworkManager PUT:m_ApiUrl parameters:m_ApiParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self apiComplite:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self apiComplite:error];
    }];
}

-(void)callApiDelete{
    [self createNetworkManager];
    [_NetworkManager DELETE:m_ApiUrl parameters:m_ApiParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self apiComplite:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self apiComplite:error];
    }];
}

-(void)apiComplite:(id)data{
    //Error
    if([data isKindOfClass:[NSError class]]){
        m_ResultObject = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],@"error",data,@"data", nil];
    }else{//success
        m_ResultObject = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],@"result",data,@"data", nil];
    }
    
    //返回mainthread
    if(m_CallbackToMainThread){
        dispatch_async(dispatch_get_main_queue(), ^{
            _callbackBlock(m_ResultObject);
        });
    }else{
        _callbackBlock(m_ResultObject);
    }
}

-(void)startCallApi{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *methodList = @[@"GET", @"POST", @"PUT", @"DELETE"];
        int key = [methodList indexOfObject:m_ApiMethod];
        switch (key) {
                //GET
            case 0:{
                [self callApiGet];
            }break;
                
                //POST
            case 1:{
                [self callApiPost];
            }break;
                
                //PUT
            case 2:{
                [self callApiPut];
            }break;
                
                //DELETE
            case 3:{
                [self callApiDelete];
            }break;
            default:
                break;
        }
        
    });
}


@end
