//
//  NetworkTool.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "NetworkTool.h"
#import "Reachability.h"

@implementation NetworkTool {

    Reachability *mReachability;
}

-(void)createReachability {

    if(!mReachability){
        mReachability = [Reachability reachabilityForInternetConnection];
    }
}

-(NSNumber*)checkNetworkIsWork {
    
    [self createReachability];
    
    NSNumber *isWork = [NSNumber numberWithBool:YES];
    
    if ([mReachability currentReachabilityStatus] == NotReachable) {
        
        isWork = [NSNumber numberWithBool:NO];
    }

    return isWork;
}

@end
