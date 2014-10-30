//
//  RCOrderApi.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/29.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCOrderApi : UIView


-(void)createNewOrder:(NSDictionary*)data withCallback:(void(^)(NSDictionary* resultData))callbackBlock;


@end
