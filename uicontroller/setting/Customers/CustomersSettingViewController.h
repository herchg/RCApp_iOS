//
//  CustomersSettingViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"
#import "SettingMenuView.h"

@interface CustomersSettingViewController : UIViewController<MainMenuViewDelegate,SettingMenuViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *CustomerListView;

- (IBAction)clickAddButtonHandel:(id)sender;

@end
