//
//  logLib.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//
#import "Log.h"
#import "RCConfig.h"
#import "FileManage.h"

@implementation Log

+(void)loggerMessage:(NSString*)msg {
    
    RCConfig *myConfig = [[RCConfig alloc] init];
    
    //是否顯示ＬＯＧ
    if([myConfig getConfigJsonValueForKey:@"ShowDebugLog"]){
    
        NSLog(@"%@",msg);
    
    }
    
    //是否把ＬＯＧ寫入檔案
    if([myConfig getConfigJsonValueForKey:@"LogWriteToFile"]){
        
        FileManage *myFilemanager = [[FileManage alloc] init];
        
        NSString *logFileFolder = [myConfig getConfigJsonValueForKey:@"LogFileFolder"];
    
        NSString *logFileName = [myConfig getConfigJsonValueForKey:@"LogFileName"];

        if([myFilemanager createFolder:logFileFolder]){
        
            NSString *logFilePath = [NSString stringWithFormat:@"%@/%@",logFileFolder,logFileName];
            
            [myFilemanager saveFileFromString:logFilePath withString:msg];
        }
    }
    
    //是否把ＬＯＧ傳到server
    if([myConfig getConfigJsonValueForKey:@"LogSendToServer"]){
 
    }
}

@end
