//
//  ProductsIndexViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "ProductsIndexViewController.h"
#import "ProductsSettingViewController.h"

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
    
    [self setMenuBar];
}

-(void)setMenuBar {
    //取得右方menuButton
    MainMenuView *menuBar = (MainMenuView*)[self.view viewWithTag:100];
    menuBar.delegate = self;
    [menuBar setNowButton:1];
}

-(void)clickMainMenuButtonDelegate:(id)sender {
 
    UIViewController *target = (UIViewController *)sender;
    
    if(target != nil){
        
        [self presentViewController:target animated:YES completion:nil];
    }

    
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
            
            
            NSString *pid = [NSString stringWithFormat:@"%d%d",i,i2];
            
            NSDictionary *product = @{@"id":pid,@"title":[mCategoryArr objectAtIndex:i],@"price":[NSNumber numberWithInt:399]};
            
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

    mMyOrderList = nil;
    mMyOrderList = [[NSMutableArray alloc] init];
    [self renewUserOrderList];
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
    int limit = 5;
    
    int w = _productView.frame.size.width / limit;
    int h = w;
 
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
                                   @"title":[product objectForKey:@"title"],
                                   @"price":[product objectForKey:@"price"]
                                   };

        [pItem setCallbackBlock:^(NSDictionary *sData) {
            [self clickProductButton:@{@"id":[sData objectForKey:@"id"] , @"title":[sData objectForKey:@"title"] , @"price":[sData objectForKey:@"price"]}];
        }];
        
        [pItem setItem:itemData];
        
        [_productView addSubview:pItem];
    }
}

-(NSMutableDictionary *)checkUserOrderList {
    
    NSMutableDictionary *orderDict = [[NSMutableDictionary alloc] init];
    
    int i;
    for(i = 0 ; i < [mMyOrderList count] ; i ++){
        NSDictionary *sItem = [mMyOrderList objectAtIndex:i];
        
        NSString *itemID = [sItem objectForKey:@"id"];
        NSString *itemTitle = [sItem objectForKey:@"title"];
        NSNumber *itemPrice = [sItem objectForKey:@"price"];
        
        //不重複資料計算
        int amount;
        if([orderDict objectForKey:itemID] == nil){
            amount = 1;
        }else{
            NSDictionary *oldItem = [orderDict objectForKey:itemID];
            amount = [(NSNumber*)[oldItem objectForKey:@"amount"] intValue];
            amount ++;
            
        }
        NSDictionary *addDict = @{@"id":itemID , @"title":itemTitle , @"price":itemPrice , @"amount":[NSNumber numberWithInt:amount]};
        [orderDict setObject:addDict forKey:itemID];
    }

    return orderDict;
}

-(void)clickProductButton:(NSDictionary*)productData {
    
    //塞入mMyOrderList
    [mMyOrderList addObject:productData];

    //更新清單
    [self renewUserOrderList];
}


-(void)renewUserOrderList {
    //清除_myOrderView
    [_myOrderView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //計算清單
    NSMutableDictionary *orderDict = [self checkUserOrderList];

    //開始顯示在view上
    int itemW = 150;
    int itemH = 50;
    int itemX = 0;
    int itemY;
    
    //view的高
    int ttlH = itemH * ([orderDict count] + 1);
    _myOrderView.contentSize = CGSizeMake(itemW, ttlH);

    //統計
    int ttlAmount = 0;
    int subTotalMoney = 0;
    int disCountMoney = 0;
    
    //計數器
    int ct = 0;
    for (id key in [orderDict keyEnumerator]) {
        //算出Ｙ以及要多高
        itemY = itemH * ct;
        
        OrderListViewItem *orderItem = [[OrderListViewItem alloc] init];
        
        NSDictionary *pItem = [orderDict objectForKey:key];
        
        NSDictionary *itemData = @{
                                   @"w":[NSNumber numberWithInt:itemW],
                                   @"h":[NSNumber numberWithInt:itemH],
                                   @"x":[NSNumber numberWithInt:itemX],
                                   @"y":[NSNumber numberWithInt:itemY],
                                   @"id":[pItem objectForKey:@"id"],
                                   @"title":[pItem objectForKey:@"title"],
                                   @"price":[pItem objectForKey:@"price"],
                                   @"amount":[pItem objectForKey:@"amount"]
                                   };
        
        [orderItem setCallbackBlock:^(NSDictionary *sData) {
            [self deleteOrderData:sData];
        }];
        
        [orderItem setItem:itemData];
        
        [_myOrderView addSubview:orderItem];
        
        //統計
        ttlAmount += [(NSNumber*)[pItem objectForKey:@"amount"] intValue];
        
        subTotalMoney += [(NSNumber*)[pItem objectForKey:@"price"] intValue] * [(NSNumber*)[pItem objectForKey:@"amount"] intValue];
        
        ct ++;
    }
    
    //總計
    int totalMoney = subTotalMoney - disCountMoney;
    
    //顯示
    [self.amountLabel setTextColor:[UIColor blackColor]];
    [self.amountLabel setText:[NSString stringWithFormat:@"%d",ttlAmount]];
    
    [self.subTotalLabel setTextColor:[UIColor blackColor]];
    [self.subTotalLabel setText:[NSString stringWithFormat:@"%d",subTotalMoney]];

    [self.disCountLabel setTextColor:[UIColor blackColor]];
    [self.disCountLabel setText:[NSString stringWithFormat:@"%d",disCountMoney]];

    [self.totalMoneyLabel setTextColor:[UIColor blackColor]];
    [self.totalMoneyLabel setText:[NSString stringWithFormat:@"%d",totalMoney]];
}

//點擊購物車內的商品進行刪除
-(void)deleteOrderData:(NSDictionary*)data {
    
    NSString *pid = [data objectForKey:@"id"];
    
    //查找mMyOrderList內相同的商品 移除
    int i;
    for(i = 0 ; i < [mMyOrderList count] ; i ++){
        NSDictionary *sItem = [mMyOrderList objectAtIndex:i];
        
        NSString *itemID = [sItem objectForKey:@"id"];
       
        if([pid isEqualToString:itemID]){
            [mMyOrderList removeObjectAtIndex:i];
            break;
        }
    }
    
    //更新清單
    [self renewUserOrderList];
}


-(BOOL)shouldAutorotate
{
    [self renewProductList];
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickClearButton:(id)sender {
    [self resetOrderList];
}

- (IBAction)clickPayButton:(id)sender {

    //建立新訂單
    NSMutableDictionary *newOrderData = [[NSMutableDictionary alloc] init];
    int newOrderID = 17;//訂單號
    
    //檢查商品資料
    NSDictionary *orderData = [self checkUserOrderList];
    
    NSMutableArray *newOrderDetailArray = [[NSMutableArray alloc] init];
    
    int ttlAmount = 0;
    int subTotalMoney = 0;
    for (id key in [orderData keyEnumerator]) {

        NSDictionary *pItem = [orderData objectForKey:key];
        
        NSNumber *amount = (NSNumber*)[pItem objectForKey:@"amount"];
        
        NSNumber *price = (NSNumber*)[pItem objectForKey:@"price"];
        
        NSNumber *pid = [NSNumber numberWithInt:[(NSString*)[pItem objectForKey:@"id"] intValue]];
        
        //統計
        ttlAmount += [amount intValue];
        
        subTotalMoney += [price intValue] * [amount intValue];
 
        //塞入detail陣列
        NSDictionary *detailInfo = @{@"order_id":[NSNumber numberWithInt:newOrderID],@"product_id":pid,@"price":price,@"amount":amount,@"total_amount":amount};
        [newOrderDetailArray addObject:detailInfo];
        
    }

    //目前時間
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];\
    NSString *nowDateTime = [DateFormatter stringFromDate:[NSDate date]];
    
    [newOrderData setObject:[NSNumber numberWithInt:newOrderID] forKey:@"order_id"];
    [newOrderData setObject:[NSNumber numberWithInt:31] forKey:@"customer_id"];
    [newOrderData setObject:[NSNumber numberWithInt:22] forKey:@"company_id"];
    [newOrderData setObject:[NSNumber numberWithInt:78] forKey:@"store_id"];
    [newOrderData setObject:[NSNumber numberWithInt:109] forKey:@"employee_id"];
    [newOrderData setObject:@"901" forKey:@"ncode"];
    [newOrderData setObject:[NSNumber numberWithInt:ttlAmount] forKey:@"total_amount"];
    [newOrderData setObject:nowDateTime forKey:@"order_datetime"];
    [newOrderData setObject:nowDateTime forKey:@"log_datetime"];
    [newOrderData setObject:@"A" forKey:@"status"];
    [newOrderData setObject:[NSNumber numberWithInt:11] forKey:@"pos_order_id"];
    //塞素商品詳細資料
    [newOrderData setObject:newOrderDetailArray forKey:@"orderDetail"];
    
    
    DataService *dataService = [WContext getDataServiceClass];
    
    [dataService setCallbackBlock:^(NSDictionary *result) {
        
        NSString *res = [[NSString alloc] initWithData:[result objectForKey:@"data"] encoding:NSUTF8StringEncoding];
        
        NSLog(@"result:%@",res);
    }];
    //送出資料
    [dataService createNewOrder:newOrderData];
    
    //清除資料
    [self clickClearButton:nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OK"
                                                    message:@"付費成功"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
