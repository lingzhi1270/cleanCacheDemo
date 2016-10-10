//
//  RequestTool.h
//  缓存清理Test
//
//  Created by lingzhi on 16/9/19.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#define  HTTP_MARKETPAGE_Bus203101_URL   [NSString stringWithFormat:@"%@/Bus203101?encrypt=none", SERVER_URL]
#define  SERVER_URL                          @"http://mobile.600280.com/ccloud_soa"

typedef void(^SuccessBlock)(id success);
typedef void(^FailedBlock)(id failed);


@interface RequestTool : NSObject

+ (void)getImageRequest:(SuccessBlock)success failed:(FailedBlock)failed;

@end
