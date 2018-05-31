//
//  WLBaseTableViewController.h
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLBaseViewController.h"

@interface WLBaseTableViewController : WLBaseViewController
<UITableViewDelegate,
UITableViewDataSource,
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *table;

@property (nonatomic , strong) NSMutableArray *listData;

/** 是否有加载更多 */
@property (nonatomic , assign) BOOL isLoadMore ;

- (void)loadData;

- (void)loadMoreData;

- (void)endRefresh;

@end
