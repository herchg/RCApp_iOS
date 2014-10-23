//
//  Api.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

/*負責所有對Server端的API*/

#import <Foundation/Foundation.h>
#import "RCLogApi.h"

@interface RCApi : NSObject

//send log to server
-(void)sendLogToServer:(NSDictionary*)data withCallback:(void(^)(NSDictionary* resultData))callbackBlock;


@end
