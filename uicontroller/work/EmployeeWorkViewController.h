//
//  EmployeeWorkViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/3.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuView.h"



@interface EmployeeWorkViewController : UIViewController<MainMenuViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *EmployeeListView;


@end
