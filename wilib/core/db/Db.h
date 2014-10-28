//
//  dbLib.h
//  LucasApp1
//
//  Created by Samuel on 2014/10/13.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Db : NSObject

-(NSDictionary*)doQuery:(NSString*)queryString;

@end
