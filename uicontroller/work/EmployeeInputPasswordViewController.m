//
//  EmployeeInputPasswordViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/11/3.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "EmployeeInputPasswordViewController.h"
#import "UiTool.h"
#import "ImageLoder.h"

@interface EmployeeInputPasswordViewController ()

@end

@implementation EmployeeInputPasswordViewController {

    NSDictionary *mEmployeeData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setEmployeeData:(NSDictionary*)data {
    mEmployeeData = data;
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self setMenuBar];
    
    //設定職員名稱與圖
    if(mEmployeeData != nil){
        ImageLoder *imgLoader = [[ImageLoder alloc] init];
        [imgLoader setTargetImageView:self.EmployeeImageView withDefaultImage:@"p1.jpeg"];
        [imgLoader setImageUrl:[mEmployeeData objectForKey:@"image"]];
        [imgLoader startLoadingImage];
        
        self.EmployeeNameLabel.text = [mEmployeeData objectForKey:@"name"];
    }
}

-(void)setMenuBar {
    //取得右方menuButton
    MainMenuView *menuBar = (MainMenuView*)[self.view viewWithTag:100];
    menuBar.delegate = self;
    [menuBar setNowButton:3];
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
            [self goToEmployeeWork];
            
            break;
        default:
            break;
    }
}

-(void)goToEmployeeWork {
    UIViewController *targerController = [[UiTool new] getUiViewControllerByStoryboardId:@"EmployeeWorkViewController"];
    [self presentViewController:targerController animated:YES completion:nil];
}

@end
