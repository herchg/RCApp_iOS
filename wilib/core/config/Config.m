//
//  configLib.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "Config.h"

@implementation Config

+(NSString*)getConfigValueForKey:(NSString*)key{
    NSBundle *bundel = [NSBundle mainBundle];
    
    NSString *configValue = [bundel objectForInfoDictionaryKey:key];
    
    return configValue;
}

@end
