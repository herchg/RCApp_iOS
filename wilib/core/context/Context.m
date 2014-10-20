//
//  Context.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "Context.h"

@implementation Context

+(NSUserDefaults*)createContext{
    return [NSUserDefaults standardUserDefaults];
}

+(void)syncContext:(NSUserDefaults*)userdefault{
    [userdefault synchronize];
}

+(void)setObject:(NSString*)key withObject:(id)data{
    NSUserDefaults *userDefaulf = [Context createContext];

    [userDefaulf setObject:data forKey:key];
    
    [Context syncContext:userDefaulf];
}

+(void)setBool:(NSString*)key withBool:(BOOL)data{
    NSUserDefaults *userDefaulf = [Context createContext];
    
    [userDefaulf setBool:data forKey:key];
    
    [Context syncContext:userDefaulf];
}

+(void)setIntegert:(NSString*)key withInteger:(int)data{
    NSUserDefaults *userDefaulf = [Context createContext];
    
    [userDefaulf setInteger:data forKey:key];
    
    [Context syncContext:userDefaulf];
}

+(NSString*)getStringForKey:(NSString*)key{
    return [[Context createContext] stringForKey:key];
}

+(NSArray*)getArrayForKey:(NSString*)key{
    return [[Context createContext] arrayForKey:key];
}

+(BOOL)getBoolForKey:(NSString*)key{
    return [[Context createContext] boolForKey:key];
}

+(int)getIntegerForKey:(NSString*)key{
    return (int)[[Context createContext] integerForKey:key];
}

@end
