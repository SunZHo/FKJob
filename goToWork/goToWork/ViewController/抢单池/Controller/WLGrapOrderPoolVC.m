//
//  WLGrapOrderPoolVC.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLGrapOrderPoolVC.h"
#import "WLTestViewController.h"
#import "WLLoginViewController.h"

@interface WLGrapOrderPoolVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) NSMutableArray *listData;
@property (nonatomic , strong) BaseTableView *table;

@end

@implementation WLGrapOrderPoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [AppUIKit createBtnWithBackgroundColor:APPMainColor action:@selector(click) target:self title:@"aaaa" image:nil font:14 textColor:WhiteColor];
    btn.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:btn];
    
    
    
}


- (void)click{
    WLLoginViewController *vc = [[WLLoginViewController alloc]init];
    PUSHVC(vc);
}



- (void)loadData{
    [self.table endRefresh];
}












#pragma mark - LazyLoad

- (BaseTableView *)table{
    if (!_table) {
        _table = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _table.dataSource = self;
        _table.delegate = self;
        _table.backgroundColor = WhiteColor;
        __weak typeof(&*self)weakSelf = self;
        _table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf loadData];
        }];

//        _table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//            [weakSelf loadMoreData];
//        }];
    }
    return _table;
}

-(NSMutableArray *)listData{
    if (!_listData) {
        _listData = [[NSMutableArray alloc]init];
    }
    return _listData;
}


@end
