//
//  MainMenuButtonView.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/30.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//


#import "MainMenuView.h"

@implementation MainMenuView {
    
    int mNowTag;

}

-(void)setNowButton:(int)tag {

    mNowTag = tag;
    
    UIButton *btn ;
    int i;
    for (i = 1 ; i < 5 ; i ++) {
        
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
            //結賬
            case 1:
                targetViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProductsIndexViewController"];
                break;
            //設定
            case 4:
                targetViewController = [storyboard instantiateViewControllerWithIdentifier:@"CategoriesSettingViewController"];
                break;
            default:
                targetViewController = nil;
                break;
        }
        
        [self.delegate clickMainMenuButtonDelegate:targetViewController];
    }
}

@end
