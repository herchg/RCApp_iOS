//
//  configLib.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

+(NSString*)getConfigValueForKey:(NSString*)key;

@end
