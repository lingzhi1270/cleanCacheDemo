//
//  CustomCell.m
//  缓存清理Test
//
//  Created by lingzhi on 16/9/19.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "CustomCell.h"
#import "ImageModel.h"
#import "UIImageView+WebCache.h"
@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        CGRect rect = [UIScreen mainScreen].bounds;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(5, 5, 40, 40);
        imageView.backgroundColor = [UIColor lightGrayColor];
        self.ImgView = imageView;
        [self.contentView addSubview:self.ImgView];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(CGRectGetMaxX(self.ImgView.frame)+10, 5, 180, 30);
        label.backgroundColor = [UIColor redColor];
        self.label = label;
        [self.contentView addSubview:self.label];
     
        
    }
    return self;

}

#pragma mark- setter
- (void)setImgDic:(NSDictionary *)imgDic
{
    _imgDic = imgDic;
    
    ImageModel *model = [ImageModel modelWithDictionary:imgDic];
    NSString *name = model.name;
    NSString *imgUrl = model.imageUrl;
    
    self.label.text = name;
    [self.ImgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:nil];
    
    
}
@end
