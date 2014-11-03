//
//  ListPhotoAlbumView.m
//  RCApp_IOS
//
//  Created by Samuel on 2014/10/27.
//  Copyright (c) 2014年 T3RetailCloud. All rights reserved.
//

#import "PhotoAlbumClass.h"

@implementation PhotoAlbumClass {
    //外部設定的callback block
    void (^mCallbackBlock)(NSDictionary* resultData);
}

-(void)setCallbackBlock:(void(^)(NSDictionary*))callbackBlock {
    
    mCallbackBlock = callbackBlock;
}

-(UIViewController*)createPhotoAlbumViewController {

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    return picker;
}


-(void)selectImageComplite:(UIImagePickerController *)picker withInfo:(NSDictionary *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSDictionary *data;
    if(info != nil){
        data = @{@"image": [info objectForKey:UIImagePickerControllerOriginalImage]};
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
