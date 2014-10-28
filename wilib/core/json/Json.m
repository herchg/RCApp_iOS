//
//  jsonLib.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/13.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import "Json.h"

@implementation Json


//json encode
-(NSData*) jsonEncode:(NSDictionary*)data {
    
    NSData *jsonData;
    
    if([NSJSONSerialization isValidJSONObject:data]){
        NSError *error;
    
        jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    }
    
    return jsonData;
}

//json decode with string
-(NSDictionary*) jsonDecodeWithString:(NSString*)data {
    
    NSData *source = [data dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDict = [self jsonDecodeWithNsdata:source];
    
    return jsonDict;
}

//json decode with NSdata
-(NSDictionary*) jsonDecodeWithNsdata:(NSData*)data {
    
    NSError *error;
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    return jsonDict;
}



@end
