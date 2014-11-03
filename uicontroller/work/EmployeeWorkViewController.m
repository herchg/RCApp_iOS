//
//  EmployeeWorkViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/3.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "EmployeeWorkViewController.h"
#import "ImageLoder.h"
#import "UiTool.h"
#import "EmployeeInputPasswordViewController.h"

@interface EmployeeWorkViewController ()

@end

@implementation EmployeeWorkViewController {

    NSMutableArray *mEmployeeList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mEmployeeList = [[NSMutableArray alloc] init];
    [mEmployeeList addObject:@{@"name":@"Lucas Lee",@"image":@"http://cf-attach.i-sogi.com/tw/product/img/InFocus_M330_1008070808607_360x270.jpg"}];
    [mEmployeeList addObject:@{@"name":@"Arthur Hu",@"image":@"http://sogi-image.sogi.com.tw/www/Product/10697/main_image/big/HTC_One%EF%BC%88M8%EF%BC%8916GB20140326112203uid6567.jpg"}];
    [mEmployeeList addObject:@{@"name":@"Alvin Chen",@"image":@"http://cf-attach.i-sogi.com/tw/product/img/Sony_Xperia_Z3_0904040904548_360x270.jpg"}];
    
    //註冊collectionView點擊cell的手勢
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.EmployeeListView addGestureRecognizer:tapRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self setMenuBar];
}

-(void)setMenuBar {
    //取得右方menuButton
    MainMenuView *menuBar = (MainMenuView*)[self.view viewWithTag:100];
    menuBar.delegate = self;
    [menuBar setNowButton:3];
}

/*--------------UICollectionViewDataSource-----------------*/
//用以表示有多少資料，
//在此回傳_contacts陣列的個數
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [mEmployeeList count];
}

//回傳UICollectionView顯示每格資料用的UICollectionViewCell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //透過dequeueReusableCellWithReuseIdentifier:forIndexPath:訊息，
    //將預先設計的cell樣本拿出來使用，
    //其Identifier為cell1的樣本
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    
    NSDictionary *employeeData = [mEmployeeList objectAtIndex:[indexPath row]];
    
    //圖片
    UIImageView *photoView = (UIImageView*)[cell viewWithTag:100];
    ImageLoder *imgLoader = [[ImageLoder alloc] init];
    [imgLoader setTargetImageView:photoView withDefaultImage:@"p1.jpeg"];
    [imgLoader setImageUrl:[employeeData objectForKey:@"image"]];
    [imgLoader startLoadingImage];
    
    //透過viewWithTag:訊息，
    //找出Tag為100的view，
    //此100的view即是在cell樣本上的Label，
    //並自_contacts陣列取出對應位置的連絡人姓名，
    //設定為label上的文字
    UILabel * label = (UILabel*)[cell viewWithTag:101];
    [label setText:[employeeData objectForKey:@"name"]];

    //回傳cell
    return cell;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
        
    {
        CGPoint initialPinchPoint = [sender locationInView:self.EmployeeListView];
        
        NSIndexPath* tappedCellPath = [self.EmployeeListView indexPathForItemAtPoint:initialPinchPoint];
        
        if( tappedCellPath != nil){
            NSDictionary *employeeData = [mEmployeeList objectAtIndex:[tappedCellPath row]];
            
            if(employeeData != nil){
                EmployeeInputPasswordViewController *targerController = (EmployeeInputPasswordViewController*)[[UiTool new] getUiViewControllerByStoryboardId:@"EmployeeInputPasswordViewController"];
                
                [targerController setEmployeeData:employeeData];
                
                [self presentViewController:targerController animated:YES completion:nil];
            }
            
        }
        
    }
    
}


/*--------------MainMenuButtonDelegate-----------------*/
-(void)clickMainMenuButtonDelegate:(id)sender {
    
    UIViewController *target = (UIViewController *)sender;
    
    if(target != nil){
        [self presentViewController:target animated:YES completion:nil];
    }
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
