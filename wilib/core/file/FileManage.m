//
//  fileManage.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import "FileManage.h"

@implementation FileManage

+(NSString*)getDocumentDir{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    return docDir;
}

+(NSFileManager*)getFileManager{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return fileManager;
}

+(BOOL)createFolder:(NSString*)folderPath{
    NSString *rootDir = [self getDocumentDir];
    
    NSFileManager *fileManager = [self getFileManager];
    
    //check folder
    NSString *fPath = [NSString stringWithFormat:@"%@%@",rootDir,folderPath];
    
    BOOL result = NO;
    if(![fileManager fileExistsAtPath:fPath]){
        result = [fileManager createDirectoryAtPath:fPath withIntermediateDirectories:YES attributes:nil error:nil];
    }else{
        result = YES;
    }
    
    return result;
}


+(BOOL)saveFileFromData:(NSString*)filePath withData:(NSData*)fileData{
    NSString *rootDir = [self getDocumentDir];
    
    NSString *savePath = [NSString stringWithFormat:@"%@%@",rootDir,filePath];
    
    BOOL result = [fileData writeToFile:savePath atomically:YES];
    
    return result;
}

+(BOOL)saveFileFromString:(NSString*)filePath withString:(NSString*)logMsg{
    NSString *rootDir = [self getDocumentDir];
    
    NSString *savePath = [NSString stringWithFormat:@"%@%@",rootDir,filePath];
    
    NSFileManager *fileManager = [self getFileManager];
    
    NSString *writeStr;
    if([fileManager fileExistsAtPath:savePath]){
        NSString *oldString = [NSString stringWithContentsOfFile:savePath encoding:NSUTF8StringEncoding error:nil];
        writeStr = [NSString stringWithFormat:@"%@\n%@ %@",oldString,[NSDate date],logMsg];
    }else{
        writeStr = [NSString stringWithFormat:@"%@ %@",[NSDate date],logMsg];
    }
    
    BOOL result = [writeStr writeToFile:savePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    return result;
}

@end
