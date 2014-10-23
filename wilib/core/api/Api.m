//
//  Api.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "Api.h"

@implementation Api{
    
    //外部設定的callback block
    void (^_callbackBlock)(NSDictionary* resultData);
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock{
    _callbackBlock = callbackBlock;
}

-(void)testApi:(NSDictionary*)data{
    
    [HttpTaskManager executeHttpTaskPost:[Config getConfigJsonValueForKey:@"AddOrderApiUrl"] withParams:data withTask:self];
}

/*-----------以下為HttpTask protocal必須實做的method-----------------*/

/*
 若成功
 result['result'] = 1
 result['data'] = NSDictionary物件
 
 若失敗
 result['result'] = 0
 result['error'] = NSERROR物件
 */
-(void)doCallback:(NSDictionary*)result{
    
    _callbackBlock(result);
}

//callback是否返回到main thread 若需要對UI進行更新則return YES
-(BOOL)callbackToMainThread{
    return YES;
}

@end
