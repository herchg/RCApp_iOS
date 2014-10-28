//
//  UiTool.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/23.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "UiTool.h"
#import "Image.h"

@implementation UiTool

-(UIImageView*)createLoadingImageView {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [self getDeviceScreenSize].width, [self getDeviceScreenSize].height)];
    
    [imageView setBackgroundColor:[UIColor blackColor]];
    
    [imageView setAlpha:0.5];
    
    [imageView setImage:[Image getAnimatedImageFromName:@"loading-"]];
    
    return imageView;
}

-(CGSize)getDeviceScreenSize {

    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    /* 分解動作是這樣：
     CGRect screenBound = [[UIScreen mainScreen] bounds];
     CGSize screenSize = screenBound.size;
     
     CGFloat screenWidth = screenSize.width;
     CGFloat screenHeight = screenSize.height;
     */
    
    return screenSize;
}

@end
