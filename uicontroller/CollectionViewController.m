//
//  CollectionViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/16.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController (){

    NSArray * _contacts;
}

@end

@implementation CollectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //建立一個連絡人陣列物件，並存放於_contacts變數中
    _contacts = [[NSArray alloc] initWithObjects:
                 @"p1.png"
                 , @"p2.png"
                 , @"p3.png"
                 , @"p4.png"
                 , @"p5.png"
                 , @"p6.png"
                 , nil];
    
    
    //將實作UICollectionViewDataSource的ViewController(self),
    //指派給UICollectionView的dataSource屬性中,
    //好將UICollectionView取得資料的工作,
    //委派給ViewController(self)物件。
    self.collectionView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UICollectionViewDataSource上的方法，
//用以表示有多少資料，
//在此回傳_contacts陣列的個數
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_contacts count];
}

//UICollectionViewDataSource上的方法，
//回傳UICollectionView顯示每格資料用的UICollectionViewCell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //透過dequeueReusableCellWithReuseIdentifier:forIndexPath:訊息，
    //將預先設計的cell樣本拿出來使用，
    //其Identifier為cell1的樣本
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //透過viewWithTag:訊息，
    //找出Tag為100的view，
    //此100的view即是在cell樣本上的Label，
    //並自_contacts陣列取出對應位置的連絡人姓名，
    //設定為label上的文字
    NSString *indexString = [_contacts objectAtIndex:[indexPath row]];
    
    UILabel * label = (UILabel*)[cell viewWithTag:100];
    [label setText:indexString];
    
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:101];
    [imageView setImage:[UIImage imageNamed:indexString]];
    
    //設cell的背景色為blue
    //[cell setBackgroundColor:[UIColor blueColor]];
    
    //回傳cell
    return cell;
}

@end
