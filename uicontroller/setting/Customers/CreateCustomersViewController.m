//
//  CreateCustomersViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/31.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "CreateCustomersViewController.h"
#import "CustomersSettingViewController.h"
#import "UiTool.h"

@interface CreateCustomersViewController ()

@end

@implementation CreateCustomersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    [settingBar setNowButton:6];
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

- (IBAction)clickButtonHandel:(id)sender {
    
    //確定
    if([sender tag] == 10 ){
    
    }else{
        //取消
        UIViewController *targerController = [[UiTool new] getUiViewControllerByStoryboardId:@"CustomersSettingViewController"];
        
        [self presentViewController:targerController animated:YES completion:nil];
    }
}
@end
