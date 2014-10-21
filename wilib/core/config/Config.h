//
//  configLib.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Json.h"

@interface Config : NSObject

//讀取plist的設定內容
+(NSString*)getPlistConfigValueForKey:(NSString*)key;

//讀取resource內config.json的內容
+(NSString*)getConfigJsonValueForKey:(NSString*)key;

@end
