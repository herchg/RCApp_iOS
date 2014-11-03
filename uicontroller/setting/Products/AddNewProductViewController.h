//
//  AddNewProductViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/2.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"
#import "SettingMenuView.h"

@interface AddNewProductViewController : UIViewController<MainMenuViewDelegate,SettingMenuViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *ProductCategoriesTextField;

- (IBAction)clickButtonHandel:(id)sender;

- (IBAction)textFieldDidEndOnExit:(id)sender;

- (IBAction)clickProductStatusButton:(id)sender;

@end
