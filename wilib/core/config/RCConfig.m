//
//  configLib.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "RCConfig.h"
#import "Json.h"

@implementation RCConfig

-(NSString*)getPlistConfigValueForKey:(NSString*)key{
    
    NSBundle *bundel = [NSBundle mainBundle];
    
    NSString *configValue = [bundel objectForInfoDictionaryKey:key];
    
    return configValue;
}

-(NSString*)getConfigJsonValueForKey:(NSString*)key{
    
    NSString *configName = [self getPlistConfigValueForKey:@"RC_Config_Name"];
    
    NSString *configSubName = [self getPlistConfigValueForKey:@"RC_Config_SubName"];
    
    NSString *path   = [[NSBundle mainBundle] pathForResource:configName ofType:configSubName ];
    
    NSString *jsonText = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

    NSDictionary *configDict = [[Json new] jsonDecodeWithString:jsonText];
    
    return [configDict objectForKey:key];
}

@end
