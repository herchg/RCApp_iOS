//
//  RCLogApi.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "ApiTask.h"
#import "HttpTaskManager.h"

@interface RCLogApi : NSObject

-(void)sendLogToServer:(NSDictionary*)data withCallback:(void(^)(NSDictionary* resultData))callbackBlock;

@end
