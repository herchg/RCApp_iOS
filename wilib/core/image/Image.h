//
//  imageLib.h
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Image : NSObject

+(UIImage*)getImageFromUrl:(NSString*)url;

+(UIImage*)getImageFromName:(NSString*)imgName;

+(NSString*)getImageTypeFromData:(NSData*)imgData;

+(UIImage*)getAnimatedImageFromName:(NSString*)imgName;

+(void)saveImageToPhotoAlbum:(UIImage*)image;

+(void)saveVideoToPhotoAlbum:(NSURL*)videoUrl;

@end
