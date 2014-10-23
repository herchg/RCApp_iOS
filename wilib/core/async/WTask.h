//
//  WTask.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/17.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WTask

@required

//開始執行task,實作的method需return成功or失敗
-(void)doTask;
//task後續處理
-(void)doCallback;
//callback是否返回到main thread 若需要對UI進行更新則return YES
-(BOOL)callbackToMainThread;

@end
