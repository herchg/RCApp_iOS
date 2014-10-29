//
//  ProductsIndexViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "ProductsIndexViewController.h"
#import "ProductViewItem.h"
#import "OrderListViewItem.h"
#import "Image.h"

@interface ProductsIndexViewController ()

@end

@implementation ProductsIndexViewController{

    NSArray *mCategoryArr;
    
    NSMutableArray *mProductsArr;
    
    int mNowCategory;
    
    NSMutableArray *mMyOrderList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startView];
}

-(void)startView {
    mNowCategory = 0;
    
    int i;
    int i2;
    //初始化商品
    mCategoryArr = [[NSArray alloc] initWithObjects:@"螢幕",@"相機",@"平板",@"卓機",@"筆電",@"手機",@"配件",@"音響", nil];
    
    mProductsArr = [[NSMutableArray alloc] init];
    
    for (i =0; i < [mCategoryArr count] ; i++)
    {
        NSMutableArray *pArr = [[NSMutableArray alloc] init];
        
        for (i2 =0; i2 < 53 ; i2++)
        {
            NSNumber *pid = [NSNumber numberWithInt:i2];
            
            NSDictionary *product = @{@"id":pid,@"name":[mCategoryArr objectAtIndex:i],@"price":@"399"};
            
            pArr[i2] = product;
        }
        
        mProductsArr[i] = pArr;
    }
    
    
    //類型
    int w = 80;
    int startW = 30;
    int maxW = startW + (w * [mCategoryArr count]);
    
    _categoryView.contentSize = CGSizeMake(maxW, 50);
    
    for (i =0; i < [mCategoryArr count] ; i++)
    {
        int sX = startW + (i * w);
        
        UIButton *catButton = [[UIButton alloc] initWithFrame:CGRectMake(sX,0,w,60)];
        
        [catButton setTitle:[mCategoryArr objectAtIndex:i] forState:UIControlStateNormal];

        [catButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [catButton setRestorationIdentifier:[NSString stringWithFormat:@"%d",i]];
        
        [catButton addTarget:self action:@selector(clickCategoryButton:) forControlEvents:UIControlEventTouchUpInside];

        [_categoryView addSubview:catButton];
    }
    
    //商品
    [self renewProductList];
    [self resetOrderList];
}

-(void)resetOrderList {

    mMyOrderList = [[NSMutableArray alloc] init];
}

-(void)clickCategoryButton:(id)sender {

    mNowCategory = [[sender restorationIdentifier] intValue];
    //商品
    [self renewProductList];
}

-(void)renewProductList{
    
    
    [_productView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSMutableArray *pArr = (NSMutableArray*)[mProductsArr objectAtIndex:mNowCategory];
    
    int i;
    int startX = 10;
    int w = 70;
    int h = 70;
    int limit = 5;
    
    int maxY = h * (ceil([pArr count] / limit) + 1);
    
    _productView.contentSize = CGSizeMake(350, maxY);
    
    for (i =0; i < [pArr count] ; i++)
    {
        int ct = i % limit;
        
        int x = startX + (ct * w);
        
        int yCt = (i > 0) ? ceil(i / limit) : 0;
        
        int y = yCt * h ;


        NSDictionary *product = (NSDictionary*)[pArr objectAtIndex:i];

        ProductViewItem *pItem = [[ProductViewItem alloc] init];
        
        NSDictionary *itemData = @{
                                   @"w":[NSNumber numberWithInt:w],
                                   @"h":[NSNumber numberWithInt:h],
                                   @"x":[NSNumber numberWithInt:x],
                                   @"y":[NSNumber numberWithInt:y],
                                   @"id":[product objectForKey:@"id"],
                                   @"image":[Image getImageFromName:@"p1.jpeg"],
                                   @"title":[product objectForKey:@"name"],
                                   @"price":[product objectForKey:@"price"]
                                   };

        [pItem setCallbackBlock:^(NSDictionary *sData) {
            [self clickProductButton:sData];
        }];
        
        [pItem setItem:itemData];
        
        [_productView addSubview:pItem];
    }
}

-(void)clickProductButton:(NSDictionary*)productData {
    
    _myOrderView.contentSize = CGSizeMake(150, 800);
    
    NSLog(@"productData=%@",productData);
    
    OrderListViewItem *orderItem = [[OrderListViewItem alloc] init];
    
    NSDictionary *itemData = @{
                               @"w":[NSNumber numberWithInt:150],
                               @"h":[NSNumber numberWithInt:50],
                               @"x":[NSNumber numberWithInt:0],
                               @"y":[NSNumber numberWithInt:0],
                               @"id":[productData objectForKey:@"id"],
                               @"title":[productData objectForKey:@"title"],
                               @"price":[productData objectForKey:@"price"]
                               };
    /*
    [itemData setCallbackBlock:^(NSDictionary *sData) {
        
    }];
    */
    [orderItem setItem:itemData];
    
    [_myOrderView addSubview:orderItem];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
