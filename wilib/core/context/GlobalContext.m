//
//  Context.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "GlobalContext.h"

@implementation GlobalContext{
    
    NSUserDefaults *mUserDefaulf;
}

-(void)createContext {
    
    if(mUserDefaulf == nil){
        mUserDefaulf = [NSUserDefaults standardUserDefaults];
    }
}

-(void)syncContext {
    
    [mUserDefaulf synchronize];
}

-(void)setObject:(NSString*)key withObject:(id)data{
    
    [self createContext];

    [mUserDefaulf setObject:data forKey:key];
    
    [self syncContext];
}

-(void)setBool:(NSString*)key withBool:(BOOL)data{
    
    [self createContext];
    
    [mUserDefaulf setBool:data forKey:key];
    
    [self syncContext];
}

-(void)setIntegert:(NSString*)key withInteger:(int)data{
    
    [self createContext];
    
    [mUserDefaulf setInteger:data forKey:key];
    
    [self syncContext];
}

-(NSString*)getStringForKey:(NSString*)key{
    
    [self createContext];
    
    return [mUserDefaulf stringForKey:key];
}

-(NSArray*)getArrayForKey:(NSString*)key{
    
    [self createContext];
    
    return [mUserDefaulf arrayForKey:key];
}

-(BOOL)getBoolForKey:(NSString*)key{
    
    [self createContext];
    
    return [mUserDefaulf boolForKey:key];
}

-(int)getIntegerForKey:(NSString*)key{
    
    [self createContext];
    
    return (int)[mUserDefaulf integerForKey:key];
}

@end
