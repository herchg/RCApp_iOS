//
//  Context.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WContext : NSObject

+(NSUserDefaults*)createContext;

+(void)syncContext:(NSUserDefaults*)userdefault;

+(void)setObject:(NSString*)key withObject:(id)data;

+(void)setBool:(NSString*)key withBool:(BOOL)data;

+(void)setIntegert:(NSString*)key withInteger:(int)data;

+(NSString*)getStringForKey:(NSString*)key;

+(NSArray*)getArrayForKey:(NSString*)key;

+(BOOL)getBoolForKey:(NSString*)key;

+(int)getIntegerForKey:(NSString*)key;

@end
