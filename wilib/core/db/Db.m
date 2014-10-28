//
//  dbLib.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/13.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import "Db.h"
#import "FMDatabase.h"
#import "Log.h"
#import "RCConfig.h"

@implementation Db


//connect DB
-(FMDatabase*)startConnectDB {
    
    RCConfig *myConfig = [[RCConfig alloc] init];
    
    NSString *dbName = [myConfig getConfigJsonValueForKey:@"SqliteDatabaseName"];
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirctory = [path objectAtIndex:0];
    
    NSString *dbPath = [documentDirctory stringByAppendingPathComponent:dbName];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];

    if(![db open]){
        [Log loggerMessage:@"Database can't open"];
        db = nil;
    }
    
    return db;
}

//query table
-(NSDictionary*)doQuery:(NSString*)queryString {
    
    FMDatabase *db = [self startConnectDB];
    
    NSDictionary *queryResultDict;
    
    if(db != nil){
        FMResultSet *rs = [db executeQuery:queryString];
        while ([rs next]) {
            queryResultDict = [rs resultDictionary];
            break;
        }

        [rs close];

        [db close];
    }
    
    return queryResultDict;
}

@end
