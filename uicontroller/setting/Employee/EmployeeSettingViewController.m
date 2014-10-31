//
//  EmployeeSettingViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "EmployeeSettingViewController.h"
#import "Image.h"
#import "UiTool.h"

@interface EmployeeSettingViewController ()

@end

@implementation EmployeeSettingViewController{
    
    NSMutableArray *mEmployeeList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mEmployeeList = [[NSMutableArray alloc] init];
    [mEmployeeList addObject:@"Lucas Lee"];
    [mEmployeeList addObject:@"Arthur Hu"];
    [mEmployeeList addObject:@"Alvin"];
    [mEmployeeList addObject:@"Samuel"];
    [mEmployeeList addObject:@"Simon"];
    [mEmployeeList addObject:@"Eric"];
    [mEmployeeList addObject:@"Lopsa"];
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

/*--------------UITableViewDelegate,UITableViewDataSource-----------------*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mEmployeeList count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    cell.textLabel.text = [mEmployeeList objectAtIndex:[indexPath row]];
    cell.imageView.image = [Image getImageFromName:@"p1.jpeg"];
    
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickButtonHandel:(id)sender {
    UIViewController *targerController = [[UiTool new] getUiViewControllerByStoryboardId:@"CreateEmployeeViewController"];
    
    [self presentViewController:targerController animated:YES completion:nil];
}
@end
