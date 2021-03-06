//
//  imageLib.m
//  LucasApp1
//
//  Created by Samuel on 2014/10/14.
//  Copyright (c) 2014年 User. All rights reserved.
//

#import "Image.h"

@implementation Image

+(UIImage*)getImageFromUrl:(NSString*)url {
    
    NSURL *imgUrl = [NSURL URLWithString:url];
    
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    
    UIImage *img = [[UIImage alloc] initWithData:imgData];
    
    return img;
}

+(UIImage*)getAnimatedImageFromName:(NSString*)imgName {
    
    UIImage *img = [UIImage animatedImageNamed:imgName duration:1.0f];
    
    return img;
}



+(UIImage*)getImageFromName:(NSString*)imgName {
    
    UIImage *img = [UIImage imageNamed:imgName];
    
    return img;
}

+(NSString*)getImageTypeFromData:(NSData*)imgData {
    
    uint8_t code;
    
    [imgData getBytes:&code length:1];
    
    NSString *imageType;
    switch (code) {
        case 0xFF:
            return @"jpeg";
            break;
        case 0x89:
            return @"png";
            break;
        case 0x47:
            return @"gif";
            break;
        case 0x49:
        case 0x4D:
            return @"tiff";
            break;
        default:
            imageType = nil;
            break;
    }
    
    return imageType;
}


+(void)saveImageToPhotoAlbum:(UIImage*)image {
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(checkSaveImageResult:withError:withContextInfo:), nil);
}

+(void)checkSaveImageResult:(UIImage*)image withError:(NSError*)error withContextInfo:(void *)contextInfo {

    UIAlertView *alert;
    
    if(error){
        alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                           message:[error description]
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
        
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"OK"
                                           message:@"Save Success"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
    
    }
    
    [alert show];
}

/*------------------video use----------------------*/

+(void)saveVideoToPhotoAlbum:(NSURL*)videoUrl {
    UISaveVideoAtPathToSavedPhotosAlbum(videoUrl.path, self, @selector(checkSaveVideoResult:withError:withContextInfo:), nil);
}

+(void)checkSaveVideoResult:(NSData*)video withError:(NSError*)error withContextInfo:(void *)contextInfo {
    
    UIAlertView *alert;
    
    if(error){
        alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                           message:[error description]
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
        
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"OK"
                                           message:@"Save Success"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
        
    }
    
    [alert show];
}


@end
