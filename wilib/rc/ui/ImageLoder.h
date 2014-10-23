//
//  WImageTask.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Task.h"
#import "Image.h"
#import "TaskManager.h"

@interface ImageLoder : NSObject <Task>

//設定要裝載UIImage的UIimageView 若需要設定預設圖案 則填入imageName
-(void)setTargetImageView:(UIImageView*)target withDefaultImage:(NSString*)imageName;

//設定要遠端圖片位置
-(void)setImageUrl:(NSString*)url;

//開始讀取圖片 若成功撈取會替換成新的圖檔
-(void)startLoadingImage;

@end
