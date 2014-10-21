//
//  webApiLib.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/15.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Json.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"

@interface WApi : NSObject

-(WApi*)init;

-(void)responseIsText;

-(void)callApiGet:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName;

-(void)callApiPost:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName;

-(void)callApiDelete:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName;

-(void)callApiPut:(NSString*)url withParameters:(NSDictionary*)parameters withTaskName:(NSString*)taskName;
    
@end
