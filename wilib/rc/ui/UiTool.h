//
//  UiTool.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UiTool : NSObject

//產生loading的動畫UIImageView
-(UIImageView*)createLoadingImageView;

//取得目前裝置的size
-(CGSize)getDeviceScreenSize;

-(UIViewController*)getUiViewControllerByStoryboardId:(NSString*)sid;

@end
