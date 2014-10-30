//
//  dataService.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>


/*負責所有的資料處理*/

@interface DataService : NSObject

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

-(void)setCallbackToMainThread:(BOOL)val;

-(void)createNewOrder:(NSDictionary*)data;

-(void)testDataService;

@end
