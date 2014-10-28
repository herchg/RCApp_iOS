//
//  WImageTask.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/22.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "ImageLoder.h"
#import "Image.h"
#import "TaskManager.h"


@implementation ImageLoder{

    NSString *m_ImageIndex;
    NSString *m_ImageUrl;
    UIImageView *m_TargetImageView;
    UIImage *m_ContentImage;
}

-(void)setTargetImageView:(UIImageView*)target withDefaultImage:(NSString*)imageName{
    m_TargetImageView = target;
    
    //預設圖檔
    if(imageName && ![imageName isEqualToString:@""]){
        [m_TargetImageView setImage:[Image getImageFromName:imageName]];
    }
}

-(void)setImageUrl:(NSString*)url{
    m_ImageUrl = url;
}

-(void)startLoadingImage{
    [TaskManager executeTask:self];
}

/*-----------以下為WTaskprotocal必須實做的method-----------------*/
-(BOOL)callbackToMainThread{
    return YES;
}

-(void)doTask{

    m_ContentImage = [Image getImageFromUrl:m_ImageUrl];
}

-(void)doCallback{
    //圖檔ＯＫ更新
    if(m_ContentImage != nil){
    
        [m_TargetImageView setImage:m_ContentImage];
    }
}


@end
