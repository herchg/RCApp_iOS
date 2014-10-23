//
//  logLib.h
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileManage.h"
#import "Config.h"
#import "Api.h"

@interface Log : NSObject

//取代nslog
+(void)loggerMessage:(NSString*)msg;

@end
