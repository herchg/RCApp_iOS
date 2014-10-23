//
//  WImageTask.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WTask.h"
#import "Image.h"
#import "AsyncTaskManager.h"

@interface WImageTask : NSObject <WTask>


-(void)setTargetImageView:(UIImageView*)target;

-(void)setImageUrl:(NSString*)url;

-(void)startLoadingImage;

@end
