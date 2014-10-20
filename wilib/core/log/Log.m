//
//  logLib.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//
#import "Log.h"
#import "FileManage.h"

BOOL M_SHOW_DEBUG_LOG = YES;
BOOL M_WRITE_LOG_TO_FILE = YES;


@implementation Log

+(void)loggerMessage:(NSString*)msg{
    if(M_SHOW_DEBUG_LOG){
        NSLog(@"%@",msg);
    }
    
    if(M_WRITE_LOG_TO_FILE){
        NSString *logFileFolder = @"/log";
        if([FileManage createFolder:logFileFolder]){
            NSString *logFileName = [NSString stringWithFormat:@"%@%@",logFileFolder,@"/log.txt"];
            
            [FileManage saveFileFromString:logFileName withString:msg];
        }
    }
}

@end
