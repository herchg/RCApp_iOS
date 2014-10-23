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
#import "HttpTask.h"

@interface Api : NSObject <HttpTask>

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

-(void)testApi:(NSDictionary*)data;

@end
