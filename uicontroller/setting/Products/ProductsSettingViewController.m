//
//  ProductsSettingViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "ProductsSettingViewController.h"
#import "ImageLoder.h"
#import "UiTool.h"

@interface ProductsSettingViewController ()

@end

@implementation ProductsSettingViewController {
    
    NSMutableArray *mProductsList;
    
    int mNowCategories;
    
    //選擇商品類型用
    UIPickerView *mCategoriesPicker;
    NSArray *mCategoriesList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mNowCategories = 0;
    
    mProductsList = [[NSMutableArray alloc] init];
    
    NSMutableArray *pData = [[NSMutableArray alloc] init];
    [pData addObject:@{@"name":@"Infocus M330",@"image":@"http://cf-attach.i-sogi.com/tw/product/img/InFocus_M330_1008070808607_360x270.jpg"}];
    [pData addObject:@{@"name":@"HTC One M8 16GB",@"image":@"http://sogi-image.sogi.com.tw/www/Product/10697/main_image/big/HTC_One%EF%BC%88M8%EF%BC%8916GB20140326112203uid6567.jpg"}];
    [pData addObject:@{@"name":@"Sony Xperia Z3",@"image":@"http://cf-attach.i-sogi.com/tw/product/img/Sony_Xperia_Z3_0904040904548_360x270.jpg"}];
    [mProductsList addObject:pData];
    
    NSMutableArray *pData2 = [[NSMutableArray alloc] init];
    [pData2 addObject:@{@"name":@"HTC One M8 16GB",@"image":@"http://sogi-image.sogi.com.tw/www/Product/10697/main_image/big/HTC_One%EF%BC%88M8%EF%BC%8916GB20140326112203uid6567.jpg"}];
    [pData2 addObject:@{@"name":@"Sony Xperia Z3",@"image":@"http://cf-attach.i-sogi.com/tw/product/img/Sony_Xperia_Z3_0904040904548_360x270.jpg"}];
    [pData2 addObject:@{@"name":@"Infocus M330",@"image":@"http://cf-attach.i-sogi.com/tw/product/img/InFocus_M330_1008070808607_360x270.jpg"}];
    [mProductsList addObject:pData2];
    
    //初始化選擇商品類型的功能
    [self setPickCategoriesView];
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
    [menuBar setNowButton:4];
    
    //左方MenuBar
    SettingMenuView *settingBar = (SettingMenuView*)[self.view viewWithTag:101];
    settingBar.delegate = self;
    [settingBar setNowButton:2];

}

/*--------------UITableViewDelegate,UITableViewDataSource-----------------*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *nowProductList = [mProductsList objectAtIndex:mNowCategories];
    
    return [nowProductList count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    NSMutableArray *nowProductList = [mProductsList objectAtIndex:mNowCategories];
    
    NSDictionary *productData = [nowProductList objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = [productData objectForKey:@"name"];
    
    ImageLoder *imgLoader = [[ImageLoder alloc] init];
    [imgLoader setTargetImageView:cell.imageView withDefaultImage:@"p1.jpeg"];
    [imgLoader setImageUrl:[productData objectForKey:@"image"]];
    [imgLoader startLoadingImage];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"刪除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSLog(@"按下刪除 目標行數：%ld",(long)indexPath.row);
        
        NSMutableArray *nowProductList = [mProductsList objectAtIndex:mNowCategories];
        
        [nowProductList removeObjectAtIndex:indexPath.row];
        
        // Delete the row from the data source.
        [self.ProductsListView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"indexPath:%@",indexPath);
}

/*--------------SettingMenuButtonDelegate-----------------*/
-(void)clickSettingMenuButtonDelegate:(id)sender {
    
    UIViewController *target = (UIViewController *)sender;
    
    if(target != nil){
        [self presentViewController:target animated:YES completion:nil];
    }
}


/*--------------MainMenuButtonDelegate-----------------*/
-(void)clickMainMenuButtonDelegate:(id)sender {
    
    UIViewController *target = (UIViewController *)sender;
    
    if(target != nil){
        [self presentViewController:target animated:YES completion:nil];
    }
}

/*----------------商品類型----------------*/
//初始化選擇商品類型的功能
-(void)setPickCategoriesView {
    
    mCategoriesList = [[NSArray alloc] initWithObjects:@"ALL",@"3C", nil];
    
    mCategoriesPicker = [[UIPickerView alloc] init];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    // 選取日期完成鈕 並給他一個 selector
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                          action:@selector(donePickCategoriesView:)];
    // 把按鈕加進 UIToolbar
    toolBar.items = [NSArray arrayWithObject:right];
    
    self.ProductCategoriesTextField.inputView = mCategoriesPicker;
    self.ProductCategoriesTextField.inputAccessoryView = toolBar;
    self.ProductCategoriesTextField.delegate = self;
    mCategoriesPicker.delegate = self;
    mCategoriesPicker.dataSource = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [mCategoriesList count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [mCategoriesList objectAtIndex:row];
}

-(void)donePickCategoriesView:(id)sender {
    [self.ProductCategoriesTextField endEditing:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger row = [mCategoriesPicker selectedRowInComponent:0];
    self.ProductCategoriesTextField.text = [mCategoriesList objectAtIndex:row];
    
    mNowCategories = row;
    
    //reload
    [self.ProductsListView reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickButtonHandel:(id)sender {
    UIViewController *targerController = [[UiTool new] getUiViewControllerByStoryboardId:@"AddNewProductViewController"];
    
    [self presentViewController:targerController animated:YES completion:nil];
}
@end
