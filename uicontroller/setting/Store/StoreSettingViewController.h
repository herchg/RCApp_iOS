//
//  StoreSettingViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"
#import "SettingMenuView.h"

@interface StoreSettingViewController : UIViewController<MainMenuViewDelegate,SettingMenuViewDelegate>

- (IBAction)clickButtonHandel:(id)sender;
@end
