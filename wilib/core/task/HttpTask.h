//
//  HttpTask.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpTask

@required

-(NSString*)getApiMethod;

-(NSString*)getApiUrl;

-(NSDictionary*)getApiParams;

//task後續處理
-(void)doCallback:(NSDictionary*)result;

//callback是否返回到main thread 若需要對UI進行更新則return YES
-(BOOL)callbackToMainThread;

@end
