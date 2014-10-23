//
//  ApiTask.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "ApiTask.h"

@implementation ApiTask{
    
    NSString *mApiUrl;
    
    NSString *mApiMethod;
    
    NSDictionary *mApiParams;
    
    //外部設定的callback block
    void (^mCallbackBlock)(NSDictionary* resultData);
    
    BOOL mCallbackToMainThread;
}

-(void)setApiUrl:(NSString*)url {
    
    mApiUrl = url;
}

-(void)setApiMethod:(NSString*)method {
    
    mApiMethod = method;
}

-(void)setApiParams:(NSDictionary*)params {
    
    mApiParams = params;
}


-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock {
    
    mCallbackBlock = callbackBlock;
}

-(void)setCallbackToMainThread:(BOOL)val {
    
    mCallbackToMainThread = val;
}


/*-----------以下為HttpTask protocal必須實做的method-----------------*/

-(NSString*)getApiMethod {
    
    return mApiMethod;
}

-(NSString*)getApiUrl {
    
    return mApiUrl;
}

-(NSDictionary*)getApiParams {
    
    return mApiParams;
}

/*
 若成功
 result['result'] = 1
 result['data'] = NSDictionary物件
 
 若失敗
 result['result'] = 0
 result['error'] = NSERROR物件
 */
-(void)doCallback:(NSDictionary*)result{
    
    if(mCallbackBlock){
        mCallbackBlock(result);
    }
}

//callback是否返回到main thread 若需要對UI進行更新則return YES
-(BOOL)callbackToMainThread{
    return mCallbackToMainThread;
}


@end
