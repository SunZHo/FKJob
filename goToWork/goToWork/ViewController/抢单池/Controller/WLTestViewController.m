//
//  WLTestViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLTestViewController.h"

@interface WLTestViewController ()
{
    int i;
}
@end

@implementation WLTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    i = 0;
    [self loadData];
}

- (void)loadData{
    i++;
    if (i % 2 != 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.listData addObject:@"asdasd"];
            [self.table reloadData];
            [self endRefresh];
        });
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.listData removeAllObjects];
            [self.table reloadData];
            [self endRefresh];
        });
    }
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = self.listData[indexPath.row];
    }
    return cell;
}







@end
