//
//  CreateEmployeeViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/31.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"
#import "SettingMenuView.h"

@interface CreateEmployeeViewController : UIViewController<MainMenuViewDelegate,SettingMenuViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UITextField *identifyCodeTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) IBOutlet UITextField *onBoardDateTextField;

@property (strong, nonatomic) IBOutlet UITextField *employeeTypeTextField;

@property (strong, nonatomic) IBOutlet UITextField *sexTextField;

- (IBAction)textFieldDidEndOnExit:(id)sender;

- (IBAction)clickSexButtonHAndel:(id)sender;

- (IBAction)clickButtonHandel:(id)sender;

@end
