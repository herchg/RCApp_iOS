//
//  configLib.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "Config.h"

@implementation Config

+(NSString*)getPlistConfigValueForKey:(NSString*)key{
    
    NSBundle *bundel = [NSBundle mainBundle];
    
    NSString *configValue = [bundel objectForInfoDictionaryKey:key];
    
    return configValue;
}

+(NSString*)getConfigJsonValueForKey:(NSString*)key{
    
    NSString *configName = [Config getPlistConfigValueForKey:@"RC_Config_Name"];
    
    NSString *configSubName = [Config getPlistConfigValueForKey:@"RC_Config_SubName"];
    
    NSString *path   = [[NSBundle mainBundle] pathForResource:configName ofType:configSubName ];
    
    NSString *jsonText = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

    NSDictionary *configDict = [Json jsonDecodeWithString:jsonText];
    
    return [configDict objectForKey:key];
}

@end
