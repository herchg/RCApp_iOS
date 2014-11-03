//
//  CameraView.h
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraClass : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

-(UIViewController*)createCameraViewController;

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock;

@end
