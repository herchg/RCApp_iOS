//
//  RootViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CrashReporter/CrashReporter.h>

@interface RootViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)clickButton:(id)sender;

- (IBAction)clickBtn2:(id)sender;

@end
