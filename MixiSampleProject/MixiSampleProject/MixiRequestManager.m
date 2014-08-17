//
//  MixiRequestManager.m
//  MixiSampleProject
//
//  Created by 金子修一郎 on 2014/08/17.
//  Copyright (c) 2014年 武田 祐一. All rights reserved.
//

#import "MixiRequestManager.h"

@implementation MixiRequestManager

+(void)sendAsynchronousRequest:(NSURLRequest *)request completionHandler:(completeBlock_t)cBlock errorHandler:(errorBlock_t)eBlock
{
    // バックグランドでAPIを実行
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSURLResponse *response;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        // メインスレッドで処理
        dispatch_async(dispatch_get_main_queue(), ^{
            if(error) {
                eBlock(response, error);
            }else{
                cBlock(response, data);
            }
        });

    });
}

@end
