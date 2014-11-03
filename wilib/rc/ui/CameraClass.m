//
//  CameraView.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/28.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "CameraClass.h"

@implementation CameraClass {
    //外部設定的callback block
    void (^mCallbackBlock)(NSDictionary* resultData);
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock {
    
    mCallbackBlock = callbackBlock;
}

-(UIViewController*)createCameraViewController {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //開啟錄影功能
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    
    picker.mediaTypes = mediaTypes;
    
    //影片品質
    [picker setVideoQuality:UIImagePickerControllerQualityTypeMedium];
    
    //錄影時間
    [picker setVideoMaximumDuration:960];
    
    return picker;
}



-(void)selectImageComplite:(UIImagePickerController *)picker withInfo:(NSDictionary *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    NSDictionary *data;
    
    if(info != nil){
        //影片
        if([mediaType isEqualToString:@"public.movie"]){
            
            NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
            
            NSData *videoData = [NSData dataWithContentsOfURL:videoUrl];
            
            //截取影片的示意圖
            AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:videoUrl options:nil];
            
            AVAssetImageGenerator *generateImg = [[AVAssetImageGenerator alloc] initWithAsset:asset];
            
            NSError *error = NULL;
            
            CMTime time = CMTimeMake(1, 65);
            
            CGImageRef refImg = [generateImg copyCGImageAtTime:time actualTime:NULL error:&error];
            
            UIImage *videoImage = [[UIImage alloc] initWithCGImage:refImg];
            
            //塞入data
            data = @{@"videoUrl":videoUrl , @"videoData":videoData , @"videoImage":videoImage};
            
        }else if([mediaType isEqualToString:@"public.image"]){
            //圖片
            UIImage *photoImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            
            data = @{@"photo":photoImage};
        }
    }
    
    
    if(mCallbackBlock){
        
        mCallbackBlock(data);
    }
    
    picker = nil;
}


/*---------代理實做-------------*/

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self selectImageComplite:picker withInfo:info];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self selectImageComplite:picker withInfo:nil];
}

@end
