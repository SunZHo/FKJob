//
//  WLMyViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLMyViewController.h"
#import "MyTableHeaderView.h"
#import "MyTableViewCell.h"
#import "WLSystemSettingVC.h"

@interface WLMyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , copy) NSArray *cellLabelArray;
@property (nonatomic , copy) NSArray *cellIconArray;
@property (nonatomic , strong) BaseTableView *table;
@property (nonatomic , strong) MyTableHeaderView *tableHeadView;

@end

@implementation WLMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavAlphaZero];
    [self.view addSubview:self.table];
    self.table.tableHeaderView = self.tableHeadView;
    self.cellLabelArray = @[@"系统设置",@"关于我们",@"绑定手机",@"清除缓存"];
    
    self.cellIconArray = @[@"我的_tabNormal",@"我的_tabNormal",@"我的_tabNormal",@"我的_tabNormal"];
}


- (void)loadData{
    [self.table endRefresh];
}




#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellLabelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifiy = @"myCell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiy];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiy];
    }
    cell.leftLabel.text = [self.cellLabelArray objectAtIndex:indexPath.row];
    cell.iconImg.image = IMG([self.cellIconArray objectAtIndex:indexPath.row]);
    if (indexPath.row == 3) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        NSString *cachesize = [WLClearCacheTool getCacheSizeWithFilePath:path];
        cell.rightLabel.text  = cachesize;
    }else{
        cell.rightLabel.text = @"";
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        WLSystemSettingVC *sysSetVC = [[WLSystemSettingVC alloc]init];
        PUSHVC(sysSetVC);
    }
    if (indexPath.row == 3) {
        MyTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        BOOL sucess = [WLClearCacheTool clearCacheWithFilePath:path];
        if (sucess) {
            [self showSuccessText:@"清除缓存成功"];
            NSString *cachesizeqq = [WLClearCacheTool getCacheSizeWithFilePath:path];
            cell.rightLabel.text = cachesizeqq;
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}




#pragma mark - LazyLoad

- (BaseTableView *)table{
    MJWeakSelf;
    if (!_table) {
        _table = [[BaseTableView alloc] initWithFrame:CGRectMake(0, -(64 + SafeAreaTopHeight), SCREEN_WIDTH, SCREEN_HEIGHT + 64 + SafeAreaTopHeight)];
        _table.delegate = self;
        _table.dataSource = self;
        
        _table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf loadData];
        }];
    }
    return _table;
}

- (MyTableHeaderView *)tableHeadView{
    if (!_tableHeadView) {
        _tableHeadView = [[MyTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    }
    return _tableHeadView;
}



@end
