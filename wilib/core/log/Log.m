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
    
    //是否顯示ＬＯＧ
    if([Config getConfigJsonValueForKey:@"ShowDebugLog"]){
    
        NSLog(@"%@",msg);
    
    }
    
    //是否把ＬＯＧ寫入檔案
    if([Config getConfigJsonValueForKey:@"LogWriteToFile"]){
        
        NSString *logFileFolder = [Config getConfigJsonValueForKey:@"LogFileFolder"];
    
        NSString *logFileName = [Config getConfigJsonValueForKey:@"LogFileName"];

        if([FileManage createFolder:logFileFolder]){
        
            NSString *logFilePath = [NSString stringWithFormat:@"%@/%@",logFileFolder,logFileName];
            
            [FileManage saveFileFromString:logFilePath withString:msg];
        }
    }
    
    //是否把ＬＯＧ傳到server
    if([Config getConfigJsonValueForKey:@"LogSendToServer"]){
        
        Api *logApi = [[Api alloc] init];
        
        [logApi sendLogToServer:@{@"log":msg}];
    }
}

@end
