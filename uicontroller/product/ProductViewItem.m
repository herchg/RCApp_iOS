//
//  ProductViewItem.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "ProductViewItem.h"
#import "Image.h"

@implementation ProductViewItem {

    NSDictionary *mItemData;
    
    UIButton *mTitleButton;
    
    UILabel *mPriceLabel;
    
    UIImageView *mImageView;
    
    //外部設定的callback block
    void (^mCallbackBlock)(NSDictionary* resultData);
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock {
    
    mCallbackBlock = callbackBlock;
}


-(void)setItem:(NSDictionary*)data {
    
    mItemData = data;

    int itemW = [(NSNumber*)[data objectForKey:@"w"] intValue];
    
    int itemH = [(NSNumber*)[data objectForKey:@"h"] intValue];
    
    int itemX = [(NSNumber*)[data objectForKey:@"x"] intValue];
    
    int itemY = [(NSNumber*)[data objectForKey:@"y"] intValue];
    
    CGRect itemRect = CGRectMake(itemX,itemY,itemW,itemH);
    //寬高
    [self setFrame:itemRect];
    
    //背景圖片
    int imageW = itemW;
    int imageH = itemH;
    mImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,imageW,imageH)];
    [mImageView setImage:(UIImage*)[data objectForKey:@"image"]];
    

    //title
    int titleW = itemW;
    int titleH = (itemH / 4 ) * 3;
    mTitleButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,titleW,titleH)];
    [mTitleButton setTitle:[data objectForKey:@"title"] forState:UIControlStateNormal];
    [mTitleButton addTarget:self action:@selector(clickButtonHandel) forControlEvents:UIControlEventTouchUpInside];
    
    int priceW = itemW;
    int priceH = itemH - titleH;
    int priceY = titleH;
    mPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,priceY,priceW,priceH)];
    [mPriceLabel setText:[data objectForKey:@"price"]];

    [self addSubview:mImageView];
    [self addSubview:mPriceLabel];
    [self addSubview:mTitleButton];
    
}

-(void)clickButtonHandel {

    NSDictionary *productData = @{@"id":[mItemData objectForKey:@"id"],@"title":[mItemData objectForKey:@"title"],@"price":[mItemData objectForKey:@"price"]};
    
    if(mCallbackBlock){
        mCallbackBlock(productData);
    }
}

-(void)willRemoveSubview:(UIView *)subview {
    [mTitleButton removeTarget:self action:@selector(clickButtonHandel) forControlEvents:UIControlEventTouchUpInside];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
