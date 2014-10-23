//
//  CacheManager.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

-(void)writeCacheData:(NSString*)key withData:(NSDictionary*)data;

-(NSDictionary*)getCacheData:(NSString*)key;

@end
