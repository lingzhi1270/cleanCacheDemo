//
//  RequestTool.m
//  缓存清理Test
//
//  Created by lingzhi on 16/9/19.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "RequestTool.h"
#import "AFNetworking.h"

@implementation RequestTool

+ (void)getImageRequest:(SuccessBlock)success failed:(FailedBlock)failed
{
    // 发送POST请求
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager POST:HTTP_MARKETPAGE_Bus203101_URL parameters:nil progress:^(NSProgress * uploadProgress) {
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSDictionary  *dic = responseObject;
        
        NSLog(@"%@",responseObject);

        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        /*******失败返回处理逻辑**********/
        
        if (failed) {
            failed(error);
        }
        
        
    }];

}

@end
