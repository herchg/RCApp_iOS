//
//  CreateCategoriesViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/2.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "CreateCategoriesViewController.h"
#import "UiTool.h"

@interface CreateCategoriesViewController ()

@end

@implementation CreateCategoriesViewController

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
    [settingBar setNowButton:1];
    
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
    switch ([sender tag]) {
            //確定
        case 10:
            
            break;
            //取消
        case 11:
            [self goToCategoriesSetting];
            
            break;
        default:
            break;
    }
}

-(void)goToCategoriesSetting {
    UIViewController *targerController = [[UiTool new] getUiViewControllerByStoryboardId:@"CategoriesSettingViewController"];
    [self presentViewController:targerController animated:YES completion:nil];
}

@end
