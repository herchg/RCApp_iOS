//
//  SettingMenuView.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingMenuViewDelegate

-(void)clickSettingMenuButtonDelegate:(id)sender;

@end

@interface SettingMenuView : UIView

@property (nonatomic, assign) id <SettingMenuViewDelegate> delegate;

-(void)setNowButton:(int)tag;

@end