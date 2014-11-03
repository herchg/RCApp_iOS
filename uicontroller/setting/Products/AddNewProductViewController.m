//
//  AddNewProductViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/2.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "AddNewProductViewController.h"
#import "UiTool.h"

@interface AddNewProductViewController ()

@end

@implementation AddNewProductViewController {

    //選擇商品類型用
    UIPickerView *mCategoriesPicker;
    NSArray *mCategoriesList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

/*----------------商品類型的功能----------------*/
//初始化選擇商品類型的功能
-(void)setPickCategoriesView {
    
    mCategoriesList = [[NSArray alloc] initWithObjects:@"A",@"B",@"", nil];
    
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
    switch ([sender tag]) {
            //確定
        case 10:
            
            break;
            //取消
        case 11:
            [self goTProductsetting];
            
            break;
        default:
            break;
    }

}

-(void)goTProductsetting {
    UIViewController *targerController = [[UiTool new] getUiViewControllerByStoryboardId:@"ProductsSettingViewController"];
    [self presentViewController:targerController animated:YES completion:nil];
}

//文字匡結束編輯時 鍵盤收起來
- (IBAction)textFieldDidEndOnExit:(id)sender {
    [sender resignFirstResponder];
}

//上下架按鈕
- (IBAction)clickProductStatusButton:(id)sender {
    NSLog(@"%@",[sender titleForSegmentAtIndex:[sender selectedSegmentIndex]]);
}




@end
