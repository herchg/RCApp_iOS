//
//  MainMenuButtonView.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainMenuViewDelegate

-(void)clickMainMenuButtonDelegate:(id)sender;

@end

@interface MainMenuView : UIView

@property (nonatomic, assign) id <MainMenuViewDelegate> delegate;

-(void)setNowButton:(int)tag;

@end
