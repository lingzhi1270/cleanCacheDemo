//
//  ImageModel.h
//  Clean缓存Test
//
//  Created by lingzhi on 16/9/20.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

@property (nonatomic,strong)NSString *imageUrl;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *prodId;
@property (nonatomic,strong)NSString *skuId;

+ (instancetype)modelWithDictionary:(NSDictionary *)dic;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
