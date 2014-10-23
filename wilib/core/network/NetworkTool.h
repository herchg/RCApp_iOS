//
//  NetworkTool.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface NetworkTool : NSObject

//判斷網路是否work
+(NSNumber*)checkNetworkIsWork;

@end
