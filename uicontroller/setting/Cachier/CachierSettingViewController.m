//
//  CachierSettingViewController.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "CachierSettingViewController.h"
#import "Image.h"

@interface CachierSettingViewController ()

@end

@implementation CachierSettingViewController {
    
    NSMutableArray *mCachierList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mCachierList = [[NSMutableArray alloc] init];
    [mCachierList addObject:@{@"name":@"機台一號",@"image":@"p1.png"}];
    [mCachierList addObject:@{@"name":@"機台二號",@"image":@"p2.png"}];
    [mCachierList addObject:@{@"name":@"機台三號",@"image":@"p3.png"}];
    
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
    [settingBar setNowButton:4];
    
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


/*--------------UITableViewDelegate,UITableViewDataSource-----------------*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mCachierList count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    NSDictionary *cachierData = [mCachierList objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = [cachierData objectForKey:@"name"];
    cell.imageView.image = [Image getImageFromName:[cachierData objectForKey:@"image"]];
    
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
        
        [mCachierList removeObjectAtIndex:indexPath.row];
        
        // Delete the row from the data source.
        [self.CachierListView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"indexPath:%@",indexPath);
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
