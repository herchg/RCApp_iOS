//
//  PayUserOrderViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/3.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PayUserOrderViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *MyOrderView;

@property (strong, nonatomic) IBOutlet UILabel *amountLabel;

@property (strong, nonatomic) IBOutlet UILabel *subTotalLabel;

@property (strong, nonatomic) IBOutlet UILabel *disCountLabel;

@property (strong, nonatomic) IBOutlet UILabel *totalMoneyLabel;

@end
