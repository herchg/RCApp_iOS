//
//  CreateEmployeeViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/31.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "CreateEmployeeViewController.h"
#import "UiTool.h"
#import "PhotoAlbumClass.h"
#import "CameraClass.h"

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController {

    //照相機Class
    CameraClass *mCameraClass;
    
    //相本class
    PhotoAlbumClass *mPhotoAlbum;
    
    //選擇日期用
    UIDatePicker *mDatePicker;
    NSLocale *mDatelocale;

    //選擇員工類型用
    UIPickerView *mEmployeePicker;
    NSArray *mEmployeeType;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //初始化選擇日期的功能
    [self setPickDateView];
 
    //初始化選擇員工類型的功能
    [self setPickEmployeeView];
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
    [settingBar setNowButton:3];
    
}

/*----------------擇員工類型的功能----------------*/
//初始化選擇員工類型的功能
-(void)setPickEmployeeView {
    
    mEmployeeType = [[NSArray alloc] initWithObjects:@"A",@"B",@"", nil];
    
    mEmployeePicker = [[UIPickerView alloc] init];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    // 選取日期完成鈕 並給他一個 selector
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                          action:@selector(donePickEmployeeView:)];
    // 把按鈕加進 UIToolbar
    toolBar.items = [NSArray arrayWithObject:right];
    
    self.employeeTypeTextField.inputView = mEmployeePicker;
    self.employeeTypeTextField.inputAccessoryView = toolBar;
    self.employeeTypeTextField.delegate = self;
    mEmployeePicker.delegate = self;
    mEmployeePicker.dataSource = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [mEmployeeType count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [mEmployeeType objectAtIndex:row];
}

-(void)donePickEmployeeView:(id)sender {
    [self.employeeTypeTextField endEditing:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger row = [mEmployeePicker selectedRowInComponent:0];
    self.employeeTypeTextField.text = [mEmployeeType objectAtIndex:row];
}


/*----------------選擇日期的功能----------------*/
//初始化選擇日期的功能
-(void)setPickDateView {
    
    self.onBoardDateTextField.delegate = self;
    
    mDatePicker = [[UIDatePicker alloc]init];
    
    mDatelocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    mDatePicker.locale = mDatelocale;
    mDatePicker.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    mDatePicker.datePickerMode = UIDatePickerModeDate;
    
    self.onBoardDateTextField.inputView = mDatePicker;
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    // 選取日期完成鈕 並給他一個 selector
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                          action:@selector(cancelPickDateView)];
    // 把按鈕加進 UIToolbar
    toolBar.items = [NSArray arrayWithObject:right];
    // 以下這行也是重點 (螢光筆畫兩行)
    // 原本應該是鍵盤上方附帶內容的區塊 改成一個 UIToolbar 並加上完成鈕
    self.onBoardDateTextField.inputAccessoryView = toolBar;
}

// 按下完成鈕後的 method
-(void) cancelPickDateView {
    // endEditing: 是結束編輯狀態的 method
    if ([self.view endEditing:NO]) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:mDatelocale];
        [formatter setDateFormat:dateFormat];
        [formatter setLocale:mDatelocale];
        
        // 將選取後的日期 填入 UITextField
        self.onBoardDateTextField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:mDatePicker.date]];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)textFieldDidEndOnExit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)clickSexButtonHAndel:(id)sender {
    NSLog(@"%@",[sender titleForSegmentAtIndex:[sender selectedSegmentIndex]]);
}

- (IBAction)clickButtonHandel:(id)sender {

    switch ([sender tag]) {
        //確定
        case 10:
            
            break;
        //取消
        case 11:
            [self goToEmploySetting];
            
            break;
        //照相
        case 20:
            [self goToCameraController];
            break;
        //相簿
        case 21:
            [self goToPhotoAlbum];
            break;
        default:
            break;
    }
}

-(void)goToEmploySetting {
    UIViewController *targerController = [[UiTool new] getUiViewControllerByStoryboardId:@"EmployeeSettingViewController"];
    [self presentViewController:targerController animated:YES completion:nil];
}

-(void)goToCameraController {
    if(mCameraClass == nil){
        mCameraClass = [[CameraClass alloc] init];
    }
    
    
    __weak UIImageView *tmpView = self.userPhotoImage;
    
    [mCameraClass setCallbackBlock:^(NSDictionary *data) {

        UIImage *img = [data objectForKey:@"photo"];
        
        if(img != nil){
            [tmpView setImage:img];
        }
    }];
    
    UIViewController *targerController = [mCameraClass createCameraViewController];
    
    [self presentViewController:targerController animated:YES completion:nil];
}

-(void)goToPhotoAlbum {
    if(mPhotoAlbum == nil){
        mPhotoAlbum = [[PhotoAlbumClass alloc] init];
    }

    __weak UIImageView *tmpView = self.userPhotoImage;
    
    [mPhotoAlbum setCallbackBlock:^(NSDictionary *data) {
        
        UIImage *img = [data objectForKey:@"image"];
        
        if(img != nil){
            [tmpView setImage:img];
        }
    }];
    
    UIViewController *targerController = [mPhotoAlbum createPhotoAlbumViewController];
    
    [self presentViewController:targerController animated:YES completion:nil];
}


@end
