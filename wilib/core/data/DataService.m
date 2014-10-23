//
//  dataService.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "DataService.h"

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

-(void)testDataService {
    /*
    Db *mydb = [[Db alloc] init];
    NSDictionary *queryData = [mydb doQuery:@"select * from cacheData"];
    NSLog(@"data:%@",queryData);
    */

    
    Api *testApi = [[Api alloc] init];
    [testApi setCallbackToMainThread:mCallbackToMainThread];
    [testApi setCallbackBlock:^(NSDictionary *data) {
        if(mCallbackBlock){
            mCallbackBlock(data);
        }
    }];
    
    [testApi testApi:nil];
}

@end
