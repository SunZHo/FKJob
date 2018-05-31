//
//  WLSystemSettingVC.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLSystemSettingVC.h"
#import "MyTableViewCell.h"
#import "WLChangePwdViewController.h"

@interface WLSystemSettingVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , copy) NSArray *cellLabelArray;
@property (nonatomic , copy) NSArray *cellIconArray;
@property (nonatomic , strong) BaseTableView *table;
@property (nonatomic , strong) UISwitch *swich;

@end

@implementation WLSystemSettingVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    self.title = @"系统设置";
    self.cellLabelArray = @[@"密码修改",@"消息推送"];
    
    self.cellIconArray = @[@"我的_tabNormal",@"我的_tabNormal"];
    
}


- (void)reloadTable{
    [self.table reloadData];
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
    cell.rightLabel.text = @"";
    if (indexPath.row == 1) {
        cell.row.hidden = YES;
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone == setting.types) {
            [self.swich setOn:NO];
        }else{
            [self.swich setOn:YES];
        }
        [cell.contentView addSubview:self.swich];
    }else{
        cell.row.hidden = NO;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        WLChangePwdViewController *changePwdVc = [[WLChangePwdViewController alloc]init];
        PUSHVC(changePwdVc);
    }else{
        
        [self cyl_popSelectTabBarChildViewControllerAtIndex:1];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [NotiCenter postNotificationName:OrderVCSelectIndexNOtiName object:nil userInfo:@{@"category":@"3"}];
        });
        
        
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}

- (void)switchAction:(id)sender{
    UISwitch *switchButton = (UISwitch*)sender;
    
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        
    }else {
         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"app-settings:"]];
    }
}


#pragma mark - LazyLoad

- (BaseTableView *)table{
    if (!_table) {
        _table = [[BaseTableView alloc] initWithFrame:CGRectMake(0, (64 + SafeAreaTopHeight), SCREEN_WIDTH, SCREEN_HEIGHT - 64 - SafeAreaTopHeight)];
        _table.delegate = self;
        _table.dataSource = self;
        
    }
    return _table;
}

- (UISwitch *)swich{
    if (!_swich) {
        _swich = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 5, 30, 15)];
        [_swich addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _swich;
}

@end
