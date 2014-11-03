//
//  EmployeeInputPasswordViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/3.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"

@interface EmployeeInputPasswordViewController : UIViewController<MainMenuViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *EmployeeImageView;

@property (strong, nonatomic) IBOutlet UILabel *EmployeeNameLabel;

@property (strong, nonatomic) IBOutlet UITextField *PasswordTextfield;

- (IBAction)clickButtonHandel:(id)sender;

-(void)setEmployeeData:(NSDictionary*)data;

@end
