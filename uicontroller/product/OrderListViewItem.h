//
//  OrderListViewItem.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListViewItem : UIView

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

-(void)setItem:(NSDictionary*)data;


@end
