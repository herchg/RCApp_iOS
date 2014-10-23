//
//  dataService.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "DataService.h"

@implementation DataService

-(void)testDataService{
    
    Api *testApi = [[Api alloc] init];
    [testApi setCallbackBlock:^(NSDictionary *data) {
        [Log loggerMessage:[NSString stringWithFormat:@"success %@",data]];
    }];
    
    [testApi testApi:nil];
}

@end
