//
//  WImageTask.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "WImageTask.h"

@implementation WImageTask{

    NSString *m_ImageIndex;
    NSString *m_ImageUrl;
    UIImageView *m_TargetImageView;
    UIImage *m_ContentImage;
}

-(void)setTargetImageView:(UIImageView*)target{
    m_TargetImageView = target;
}

-(void)setImageUrl:(NSString*)url{
    m_ImageUrl = url;
}

-(void)startLoadingImage{
    [AsyncTaskManager executeTask:self];
}

/*-----------以下為WTaskprotocal必須實做的method-----------------*/
-(BOOL)callbackToMainThread{
    return YES;
}

-(BOOL)doTask{
    NSLog(@"image doTask");
    m_ContentImage = [Image getImageFromUrl:m_ImageUrl];
    
    if(m_ContentImage != nil){
        return YES;
    }else{
        return NO;
    }
}

-(void)onSuccess{
    [m_TargetImageView setImage:m_ContentImage];
}

-(void)onFail{

}

@end
