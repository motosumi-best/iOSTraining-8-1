//
//  MixiRequestManager.h
//  MixiSampleProject
//
//  Created by 金子修一郎 on 2014/08/17.
//  Copyright (c) 2014年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^completeBlock_t)(NSURLResponse *response, NSData *data);
typedef void (^errorBlock_t)(NSURLResponse *response, NSError *error);


@interface MixiRequestManager : NSObject

+(void)sendAsynchronousRequest:(NSURLRequest *)request completionHandler:(completeBlock_t)cBlock errorHandler:(errorBlock_t)eBlock;

@end
