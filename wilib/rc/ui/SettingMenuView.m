//
//  SettingMenuView.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "SettingMenuView.h"
#import "ProductsSettingViewController.h"

@implementation SettingMenuView {
    
    int mNowTag;
    
}

-(void)setNowButton:(int)tag {

    mNowTag = tag;
    
    UIButton *btn ;
    int i;
    for (i = 1 ; i < 7 ; i ++) {
        
        btn = (UIButton *)[self viewWithTag:i];
        
        [btn addTarget:self action:@selector(clickButtonHandel:) forControlEvents:UIControlEventTouchUpInside];
        
        if(i == mNowTag){
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
    }
}

-(void)clickButtonHandel:(id)sender {
    
    int tag = (int)[sender tag];
    
    if(tag != mNowTag){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *targetViewController;
        switch (tag) {
                //類別設定
            case 1:
                targetViewController = [storyboard instantiateViewControllerWithIdentifier:@"CategoriesSettingViewController"];
                break;
                //商品設定
            case 2:
                targetViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProductsSettingViewController"];
                break;
                //員工設定
            case 3:
                targetViewController = nil;
                break;
                //機台設定
            case 4:
                targetViewController = nil;
                break;
                //門店設定
            case 5:
                targetViewController = nil;
                break;
                //會員設定
            case 6:
                targetViewController = nil;
                break;
            default:
                targetViewController = nil;
                break;
        }
        
        [self.delegate clickSettingMenuButtonDelegate:targetViewController];
    }
}
@end
