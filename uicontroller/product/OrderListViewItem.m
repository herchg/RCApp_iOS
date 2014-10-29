//
//  OrderListViewItem.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "OrderListViewItem.h"
#import "Image.h"

@implementation OrderListViewItem { 
    
    NSDictionary *mItemData;
    
    NSNumber *mAmount;
    
    UILabel *mAmountLabel;
    
    UIButton *mTitleButton;
    
    UILabel *mPriceLabel;
    
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
    
    //amount
    int amountW = itemW / 5;
    int amountH = itemH;
    mAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,amountW,amountH)];
    [mAmountLabel setText:[data objectForKey:@"price"]];
    
    
    //title
    int titleW = (itemW / 5) * 3;
    int titleH = itemH;
    int titleX = amountW;
    mTitleButton = [[UIButton alloc] initWithFrame:CGRectMake(titleX,0,titleW,titleH)];
    [mTitleButton setTitle:[data objectForKey:@"title"] forState:UIControlStateNormal];
    [mTitleButton addTarget:self action:@selector(clickButtonHandel) forControlEvents:UIControlEventTouchUpInside];
    
    //price
    int priceW = itemW / 5;
    int priceH = itemH;
    int priceX = titleX + titleW;
    mPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(priceX,0,priceW,priceH)];
    [mPriceLabel setText:[data objectForKey:@"price"]];

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
