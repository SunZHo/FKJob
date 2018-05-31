//
//  WLRegistViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLRegistViewController.h"
#import "WLRegistView.h"
#import "WLSetPassWordViewController.h"

@interface WLRegistViewController ()

@property (nonatomic , strong) UIScrollView *backScrollView;

@property (nonatomic , strong) WLRegistView *registView;

@end

@implementation WLRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APPMainColor;
    [self.view addSubview:self.backScrollView];
    
    [self.backScrollView addSubview:self.registView];
}










- (UIScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 + SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - SafeAreaTopHeight - SafeAreaBottomHeight - 100)];
        _backScrollView.backgroundColor = Default_BackgroundGray;
        _backScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, kScaleWidth(400));
        _backScrollView.showsVerticalScrollIndicator = NO;
        _backScrollView.showsHorizontalScrollIndicator = NO;
        _backScrollView.backgroundColor = [UIColor clearColor];
    }
    return _backScrollView;
}


- (WLRegistView *)registView{
    if (!_registView) {
        _registView = [[WLRegistView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - kScaleWidth(302))/2, kScaleWidth(66), kScaleWidth(302), kScaleWidth(392))];
    }
    return _registView;
}






@end
