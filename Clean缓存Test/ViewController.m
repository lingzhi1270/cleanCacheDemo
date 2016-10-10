//
//  ViewController.m
//  Clean缓存Test
//
//  Created by lingzhi on 16/9/20.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "XHNetworkCache.h"

@interface ViewController ()


@property (nonatomic,strong) UILabel *chacheLabel;
@property (nonatomic,strong) UIButton *goButton;
@property (nonatomic,strong) UIButton *cleanButton;
@property (nonatomic,strong) UIButton *sizeBtn;

@end

@implementation ViewController

- (UILabel *)chacheLabel
{
    if (_chacheLabel == nil) {
        _chacheLabel = [[UILabel alloc] init];
        _chacheLabel.frame = CGRectMake(100, 100, 200, 60);
        _chacheLabel.backgroundColor = [UIColor lightGrayColor];
        _chacheLabel.font = [UIFont systemFontOfSize:10];
        _chacheLabel.textColor = [UIColor redColor];
        
    }
    return _chacheLabel;
}

- (UIButton *)goButton
{
    if (_goButton == nil) {
        _goButton = [[UIButton alloc] init];
        _goButton.frame = CGRectMake(200, 300, 80, 60);
        [_goButton setTitle:@"下一页" forState: UIControlStateNormal];
        _goButton.backgroundColor = [UIColor redColor];
        [_goButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return _goButton;
}


- (UIButton *)cleanButton
{
    if (_cleanButton == nil) {
        _cleanButton = [[UIButton alloc] init];
        _cleanButton.frame = CGRectMake(10, 300, 100, 50);
        _cleanButton.backgroundColor = [UIColor redColor];
        [_cleanButton setTitle:@"清理缓存" forState:UIControlStateNormal];
    }
    return _cleanButton;
}

- (UIButton *)sizeBtn
{
    if (_sizeBtn == nil) {
        _sizeBtn = [[UIButton alloc] init];
        [_sizeBtn setTitle:@"计算缓存" forState:UIControlStateNormal];
        [_sizeBtn setBackgroundColor:[UIColor redColor]];
        [_sizeBtn setFrame:CGRectMake(10, 200, 100, 60)];
    }
    return _sizeBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.chacheLabel];
    [self.view addSubview:self.goButton];
    [self.view addSubview:self.cleanButton];
    [self.view addSubview:self.sizeBtn];
    
    [self.goButton addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    
    [self.sizeBtn addTarget:self action:@selector(chachesSizeAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.cleanButton addTarget:self action:@selector(cleanAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)goNext
{
    MainViewController *mainVc = [[MainViewController alloc] init];
    [self.navigationController pushViewController:mainVc animated:YES];
    
}

- (void)chachesSizeAction
{
 
    NSString *cachesPath = [XHNetworkCache cachePath];
    NSLog(@"cachesPath= %@",cachesPath);
  
    NSString *cachesSize = [XHNetworkCache cacheSizeFormat];
    self.chacheLabel.text = cachesSize;
    
}

- (void)cleanAction
{
    [XHNetworkCache clearCache];
    NSString *cachesSize = [XHNetworkCache cacheSizeFormat];
    self.chacheLabel.text = cachesSize;
}
@end
