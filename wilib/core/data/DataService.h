//
//  dataService.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Log.h"
#import "WApi.h"
#import "Config.h"
#import "AsyncTaskManager.h"

@interface DataService : NSObject

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

-(void)testApi:(NSDictionary*)data;

@end
