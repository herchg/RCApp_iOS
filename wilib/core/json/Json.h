//
//  jsonLib.h
//  LucasApp1
//
//  Created by Samuel on 2014/10/13.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Json : NSObject

//json encode
-(NSData*) jsonEncode:(NSDictionary*)data;

//json decode with string
-(NSDictionary*) jsonDecodeWithString:(NSString*)data;

//json decode with NSDATA
-(NSDictionary*) jsonDecodeWithNsdata:(NSData*)data;

@end
