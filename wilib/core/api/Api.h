//
//  Api.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

/*負責所有對Server端的API*/

#import <Foundation/Foundation.h>
#import "Log.h"
#import "Config.h"
#import "HttpTaskManager.h"
#import "ApiTask.h"


@interface Api : NSObject

//設定callback
-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

-(void)setCallbackToMainThread:(BOOL)val;

//test
-(void)testApi:(NSDictionary*)data;

//發送log訊息到server
-(void)sendLogToServer:(NSDictionary*)data;

@end
