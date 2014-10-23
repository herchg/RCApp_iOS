//
//  CollectionViewController.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/16.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

//實作UICollectionViewDataSource協定
@interface CollectionViewController : UIViewController <UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
