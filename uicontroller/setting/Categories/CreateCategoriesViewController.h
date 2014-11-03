//
//  CreateCategoriesViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/2.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"
#import "SettingMenuView.h"

@interface CreateCategoriesViewController : UIViewController<MainMenuViewDelegate,SettingMenuViewDelegate>

- (IBAction)clickButtonHandel:(id)sender;
@end
