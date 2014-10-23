//
//  NetworkTool.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool

+(NSNumber*)checkNetworkIsWork {
    
    Reachability *r= [Reachability reachabilityForInternetConnection];
    
    NSNumber *isWork = [NSNumber numberWithBool:YES];
    
    if ([r currentReachabilityStatus] == NotReachable) {
        isWork = [NSNumber numberWithBool:NO];
    }

    return isWork;
}

@end
