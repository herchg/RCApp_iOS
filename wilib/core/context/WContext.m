//
//  WContext.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/24.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "WContext.h"

@implementation WContext


+(DataService*)getDataServiceClass {

    return [[DataService alloc] init];
}


+(RCConfig*)getRCConfigClass {
    
    return [[RCConfig alloc] init];
}


+(CacheManager*)getCacheManagerClass {

    return [[CacheManager alloc] init];
}

+(RCApi*)getRCApiClass {

    return [[RCApi alloc] init];
}

@end
