//
//  WLBaseTableViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLBaseTableViewController.h"

@interface WLBaseTableViewController ()

@end

@implementation WLBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.table];
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}



#pragma mark - emptyDataSet
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSAttributedString *attribute = [[NSAttributedString alloc]initWithString:@"— 无数据 —"
                                                                   attributes:@{
                                                                                NSForegroundColorAttributeName: [UIColor blackColor],
                                                                                NSFontAttributeName: kFont(14)
                                                                                }];
    return attribute;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    BOOL res = self.table.backgroundColor == Default_BackgroundGray;
    return res ? [UIImage imageNamed:@"img_default"] : [UIImage imageNamed:@"img_wujh"];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    return [[NSAttributedString alloc]initWithString:@""
                                          attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.table.backgroundColor;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -100.f;
}

- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView {
    scrollView.contentOffset = CGPointZero;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (void)loadData{
    
}

- (void)loadMoreData{
    
}

- (void)endRefresh{
    [self.table.mj_header endRefreshing];
    [self.table.mj_footer endRefreshing];
}

- (void)setIsLoadMore:(BOOL)isLoadMore{
    _isLoadMore = isLoadMore;
}

- (UITableView *)table{
    MJWeakSelf;
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - SafeAreaTopHeight - SafeAreaBottomHeight)];
        _table.delegate = self;
        _table.dataSource = self;
        _table.emptyDataSetSource = self;
        _table.emptyDataSetDelegate = self;
        _table.tableFooterView = [UIView new];
        _table.backgroundColor = Default_BackgroundGray;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.estimatedSectionHeaderHeight = 0;
        _table.estimatedSectionFooterHeight = 0;
        _table.estimatedRowHeight = 0;
        _table.showsVerticalScrollIndicator = NO;
        _table.showsHorizontalScrollIndicator = NO;
        _table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf loadData];
        }];
        
        if (self.isLoadMore) {
            _table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                [weakSelf loadMoreData];
            }];
        }
       
        
    }
    return _table;
}


- (NSMutableArray *)listData{
    if (!_listData) {
        _listData = [[NSMutableArray alloc]init];
    }
    return _listData;
}



@end
