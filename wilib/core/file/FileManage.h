//
//  fileManage.h
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManage : NSObject

+(NSString*)getDocumentDir;

+(NSFileManager*)getFileManager;

+(BOOL)createFolder:(NSString*)folderPath;

+(BOOL)saveFileFromData:(NSString*)filePath withData:(NSData*)fileData;

+(BOOL)saveFileFromString:(NSString*)filePath withString:(NSString*)logMsg;
    
@end
