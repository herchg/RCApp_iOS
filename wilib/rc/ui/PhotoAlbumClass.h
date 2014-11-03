//
//  ListPhotoAlbumView.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/27.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoAlbumClass : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

-(UIViewController*)createPhotoAlbumViewController;

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;


@end
