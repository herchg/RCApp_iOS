//
//  ProductsIndexViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductViewItem.h"
#import "OrderListViewItem.h"
#import "Image.h"
#import "WContext.h"
#import "MainMenuView.h"

@interface ProductsIndexViewController : UIViewController <MainMenuViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *categoryView;

@property (strong, nonatomic) IBOutlet UIScrollView *productView;

@property (strong, nonatomic) IBOutlet UIScrollView *myOrderView;

@property (strong, nonatomic) IBOutlet UILabel *amountLabel;

@property (strong, nonatomic) IBOutlet UILabel *subTotalLabel;

@property (strong, nonatomic) IBOutlet UILabel *disCountLabel;

@property (strong, nonatomic) IBOutlet UILabel *totalMoneyLabel;

- (IBAction)clickClearButton:(id)sender;

- (IBAction)clickPayButton:(id)sender;
@end
