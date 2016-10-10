//
//  MainViewController.m
//  缓存清理Test
//
//  Created by lingzhi on 16/9/20.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCell.h"
#import "RequestTool.h"
#import "XHNetworkCache.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;

@property (nonatomic,strong)NSDictionary *dataDic;

@property (nonatomic, copy) NSString *URLString;
@end

@implementation MainViewController

#pragma mark- getter
- (UITableView *)myTable
{
    if (_myTable == nil) {
        _myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTable.showsVerticalScrollIndicator = NO;
        _myTable.showsHorizontalScrollIndicator = NO;
        
        
        [_myTable registerClass:[CustomCell class] forCellReuseIdentifier:@"CELL"];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.title = @"加载数据";
    
    self.URLString = @"http://www.returnoc.com";
    self.dataDic = @{@"imageUrl":@"http://tp4.sinaimg.cn/1728484287/180/5736236738/1",
                     @"name":@"这是一只狗",
                     @"prodId":@"123456",
                     @"skuId":@"abcde"};
    
    
    
    [self.view addSubview:self.myTable];
    
    //异步缓存(存入沙盒指定文件夹下)
    
    [XHNetworkCache save_asyncJsonResponseToCacheFile:self.dataDic andURL:self.URLString completed:^(BOOL result) {
       
        if (result) {
            NSLog(@"(同步)写入/更新缓存数据 成功");
        }
        else
        {
            NSLog(@"(同步)写入/更新缓存数据 失败");
        }
    }];
    
    
    
    //发请求(未使用该类)
//    [RequestTool getImageRequest:^(id success) {
//        
//        NSLog(@"%@",success);
//        
//    } failed:^(id failed) {
//        
//    }];
    
}

#pragma mark- UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
//    cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.imgDic = self.dataDic;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
