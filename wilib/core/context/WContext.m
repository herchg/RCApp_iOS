//
//  Context.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "WContext.h"

@implementation WContext

+(NSUserDefaults*)createContext{
    return [NSUserDefaults standardUserDefaults];
}

+(void)syncContext:(NSUserDefaults*)userdefault{
    [userdefault synchronize];
}

+(void)setObject:(NSString*)key withObject:(id)data{
    NSUserDefaults *userDefaulf = [WContext createContext];

    [userDefaulf setObject:data forKey:key];
    
    [WContext syncContext:userDefaulf];
}

+(void)setBool:(NSString*)key withBool:(BOOL)data{
    NSUserDefaults *userDefaulf = [WContext createContext];
    
    [userDefaulf setBool:data forKey:key];
    
    [WContext syncContext:userDefaulf];
}

+(void)setIntegert:(NSString*)key withInteger:(int)data{
    NSUserDefaults *userDefaulf = [WContext createContext];
    
    [userDefaulf setInteger:data forKey:key];
    
    [WContext syncContext:userDefaulf];
}

+(NSString*)getStringForKey:(NSString*)key{
    return [[WContext createContext] stringForKey:key];
}

+(NSArray*)getArrayForKey:(NSString*)key{
    return [[WContext createContext] arrayForKey:key];
}

+(BOOL)getBoolForKey:(NSString*)key{
    return [[WContext createContext] boolForKey:key];
}

+(int)getIntegerForKey:(NSString*)key{
    return (int)[[WContext createContext] integerForKey:key];
}

@end
