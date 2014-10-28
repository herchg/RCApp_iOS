//
//  WContext.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/24.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCConfig.h"
#import "DataService.h"
#import "CacheManager.h"
#import "RCApi.h"

@interface WContext : NSObject

+(DataService*)getDataServiceClass;

+(RCConfig*)getRCConfigClass;

+(CacheManager*)getCacheManagerClass;

+(RCApi*)getRCApiClass;



@end
