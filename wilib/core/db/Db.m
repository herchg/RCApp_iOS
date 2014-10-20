//
//  dbLib.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/13.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import "Db.h"
#import "FMDatabase.h"

NSString *m_dbName= @"";

FMDatabase *m_db;

@implementation Db

//set DB name. like rc.db
-(void)initWithDbName:(NSString*)dbName{
    m_dbName = dbName;
}

//connect DB
-(void)startConnectDB{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirctory = [path objectAtIndex:0];
    NSString *dbPath = [documentDirctory stringByAppendingPathComponent:m_dbName];
    m_db = [FMDatabase databaseWithPath:dbPath];
    if(![m_db open]){
        NSLog(@"db Error");
    }
}

//query table
-(NSDictionary*)queryTableData:(NSString*)queryString{
    NSDictionary *queryDict;
    FMResultSet *rs = [m_db executeQuery:queryString];
    while ([rs next]) {
        /*
        int sid = [rs stringForColumn:@"id"];
        NSString *sname = [rs stringForColumn:@"name"];
        NSLog(@"id=%d name=%@",sid,sname);
         */
    }
    [rs close];
    
    return queryDict;
}

@end
