//
//  WLGrapOrderPoolViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLGrapOrderPoolViewController.h"
#import "WLGrapOrderCell.h"
#import "WLGrapOrderModel.h"

@interface WLGrapOrderPoolViewController ()

@end

@implementation WLGrapOrderPoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}


- (void)loadData{
    [self.listData removeAllObjects];
    for (int i = 0; i < 5; i++) {
        WLGrapOrderModel *model = [WLGrapOrderModel model];
        model.oneHour = @"一小时保洁";
        model.meetTime = @"预约时间：2018/06/01 10:30";
        model.name = @"崔先生";
        model.address = @"青岛市福州北路汤匙公寓签单员201户";
        model.singlePrice = @"￥300/小时";
        model.comeForm = @"订单来源：一键预约";
        [self.listData addObject:model];
    }
    
    [self.table reloadData];
    [self endRefresh];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 158;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLGrapOrderModel *model = [self.listData objectAtIndex:indexPath.row];
    static NSString *identifiyImg = @"NoreplyCell";
    WLGrapOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiyImg];
    if (!cell) {
        cell = [[WLGrapOrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiyImg];
    }
    [cell setGrapModel:model];
    return cell;
}







@end
