//
//  WLLoginViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLLoginViewController.h"
#import "WLLoginView.h"
#import "WLThirdPartLoginView.h"
#import "WLRegistViewController.h"
#import "WLChangePwdViewController.h"

@interface WLLoginViewController ()<LoginViewDelegate>

@property (nonatomic , strong) UIScrollView *backScrollView;
@property (nonatomic , strong) WLLoginView *loginView;
@property (nonatomic , strong) WLThirdPartLoginView *thirdLoginView;

@end

@implementation WLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APPMainColor;
    [self.view addSubview:self.backScrollView];
    [self.view addSubview:self.thirdLoginView];
    [self.backScrollView addSubview:self.loginView];
    
}







- (void)didSelectButtonAtIndex:(NSInteger)index{
    if (index == 1) {
        WLChangePwdViewController *changePwdVC = [[WLChangePwdViewController alloc]init];
        PUSHVC(changePwdVC);
    }else if (index == 2){
        WLRegistViewController *regVC = [[WLRegistViewController alloc]init];
        PUSHVC(regVC);
        
    }else if (index == 3){
        
    }
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



- (WLLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[WLLoginView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - kScaleWidth(302))/2, kScaleWidth(66), kScaleWidth(302), kScaleWidth(392))];
        _loginView.delegate = self;
    }
    return _loginView;
}

- (WLThirdPartLoginView *)thirdLoginView{
    if (!_thirdLoginView) {
        _thirdLoginView = [[WLThirdPartLoginView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight - 100 , SCREEN_WIDTH, 100)];
    }
    return _thirdLoginView;
}








@end
