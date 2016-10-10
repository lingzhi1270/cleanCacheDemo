//
//  ImageModel.m
//  Clean缓存Test
//
//  Created by lingzhi on 16/9/20.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        self.imageUrl = [dic objectForKey:@"imageUrl"];
        self.name = [dic objectForKey:@"name"];
        self.prodId = [dic objectForKey:@"prodId"];
        self.skuId = [dic objectForKey:@"skuId"];
        
    }
    return self;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc] initWithDictionary:dic];
}


@end
