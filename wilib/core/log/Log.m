//
//  logLib.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//
#import "Log.h"

@implementation Log

+(void)loggerMessage:(NSString*)msg {
    
    if([Config getConfigJsonValueForKey:@"ShowDebugLog"]){
    
        NSLog(@"%@",msg);
    
    }
    
    if([Config getConfigJsonValueForKey:@"LogWriteToFile"]){
    
        NSString *logFileFolder = @"/log";
        
        if([FileManage createFolder:logFileFolder]){
        
            NSString *logFileName = [NSString stringWithFormat:@"%@%@",logFileFolder,@"/log.txt"];
            
            [FileManage saveFileFromString:logFileName withString:msg];
        }
    }
}

@end
