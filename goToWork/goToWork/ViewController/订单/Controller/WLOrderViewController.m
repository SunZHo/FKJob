//
//  WLOrderViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLOrderViewController.h"

@interface WLOrderViewController ()

@end

@implementation WLOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = @[@"已抢单",@"已预约",@"服务中",@"已完成",@"异常"];
    NSMutableArray *childVCs = [[NSMutableArray alloc]init];
    for (NSString *title in self.titleArray) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.title = title;
        vc.view.backgroundColor = randomColor;
        [childVCs addObject:vc];
    }
    self.subVcArray = childVCs;
    
    [super addchildViewControllers];
    
    // 点击回到主页后，直接展示该分类
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleViewSelectIndex:) name:OrderVCSelectIndexNOtiName object:nil];
}




-(void)titleViewSelectIndex:(NSNotification *)noti{
    NSInteger selectIndex = [[noti.userInfo objectForKey:@"category"] integerValue];
    self.pageContentView.contentViewCurrentIndex = selectIndex;
    self.titleView.selectIndex = selectIndex;
    self.navigationItem.title = self.titleArray[selectIndex];
    
}

- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
    self.navigationItem.title = self.titleArray[endIndex];
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.titleView.selectIndex = endIndex;
    self.navigationItem.title = self.titleArray[endIndex];
    
}

@end
