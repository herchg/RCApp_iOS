//
//  dataService.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "DataService.h"
#import "Log.h"
#import "RCConfig.h"
#import "RCApi.h"
#import "Db.h"

@implementation DataService {
    //外部設定的callback block
    void (^mCallbackBlock)(NSDictionary* resultData);

    BOOL mCallbackToMainThread;
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock {
    
    mCallbackBlock = callbackBlock;
}

-(void)setCallbackToMainThread:(BOOL)val {
    
    mCallbackToMainThread = val;
}

-(void)createNewOrder:(NSDictionary*)data {
    //整理出有效資料
    NSMutableDictionary *inputData = [self checkInputData:data];
    //把資料交給ＡＰＩ處理
    RCApi *myApi = [[RCApi alloc] init];
    [myApi createNewOrder:inputData withCallback:^(NSDictionary *resultData) {
        if(mCallbackBlock){
            mCallbackBlock(resultData);
        }
    }];
    
}

-(NSMutableDictionary*)checkInputData:(NSDictionary*)data{
    //整理資料
    
    //order
    NSArray *orderDataKey = @[@"order_id",@"customer_id",@"company_id",@"store_id",@"employee_id",@"ncode",@"total_amount",@"order_datetime",@"log_datetime",@"status",@"pos_order_id"];
    
    int i;
    NSString *key;
    NSMutableDictionary *orderData = [[NSMutableDictionary alloc] init];
    
    for( i = 0 ; i < [orderDataKey count] ; i ++){
        
        key = [orderDataKey objectAtIndex:i];
        
        if([data objectForKey:key] != nil){
        
            [orderData setObject:[data objectForKey:key] forKey:key];
        }
    }
    
    //orderDetail
    NSArray *orderDataDetailKey = @[@"order_id",@"product_id",@"price",@"amount",@"total_amount"];
    
    NSArray *orderDetailArray = [data objectForKey:@"orderDetail"];

    NSMutableArray *orderDetailList = [[NSMutableArray alloc] init];
    
    if(orderDetailArray != nil ){
        int i2;
        for( i = 0 ; i < [orderDetailArray count] ; i ++){
            
            NSDictionary *detailInfo = [orderDetailArray objectAtIndex:i];
            
            if(detailInfo != nil){
                NSMutableDictionary *orderDetail = [[NSMutableDictionary alloc] init];
                
                for( i2 = 0 ; i2 < [orderDataDetailKey count] ; i2 ++){
                    
                    key = [orderDataDetailKey objectAtIndex:i2];
                    
                    if([detailInfo objectForKey:key] != nil){
                        
                        [orderDetail setObject:[detailInfo objectForKey:key] forKey:key];
                    }
                }
                
                [orderDetailList addObject:orderDetail];
            }
        }
    }

    //塞入input
    NSMutableDictionary *inputData = [[NSMutableDictionary alloc] init];
    
    [inputData setObject:orderData forKey:@"order"];
    
    [inputData setObject:orderDetailList forKey:@"order_detail"];
 
    return inputData;
}



-(void)testDataService {
    /*
    Db *mydb = [[Db alloc] init];
    NSDictionary *queryData = [mydb doQuery:@"select * from cacheData"];
    NSLog(@"data:%@",queryData);
    */

    RCApi *myApi = [[RCApi alloc] init];
    [myApi sendLogToServer:nil withCallback:^(NSDictionary *resultData) {
        
        if(mCallbackBlock){
            mCallbackBlock(resultData);
        }
    }];
}

@end
