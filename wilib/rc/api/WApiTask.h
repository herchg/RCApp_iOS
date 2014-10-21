//
//  WApiTask.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/21.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WApiTask

@required

-(NSDictionary*)getApiInputParameters;

//task的後續處理
-(void)onApiComplite:(id)data;

//callback是否返回到main thread 若需要對UI進行更新則return YES
-(BOOL)apiCallbackToMainThread;

@end
