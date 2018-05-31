//
//  WLThirdPartLoginView.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLThirdPartLoginView.h"

@interface WLThirdPartLoginView ()

@property (strong , nonatomic) NSMutableArray *loginMethodArr;

@end


@implementation WLThirdPartLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        
        [self makeUI];
    }
    return self;
}

- (void)makeUI{
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]){
        [self.loginMethodArr addObject:@"Login_QQ"];
    }
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]){
        [self.loginMethodArr addObject:@"Login_Wechat"];
    }
    if (![[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina]) {
        [self.loginMethodArr addObject:@"Login_Sina"];
    }
    if (self.loginMethodArr.count > 0) {
        UIView *lineV = [[UIView alloc]init];
        lineV.backgroundColor = WhiteColor;
        [self addSubview:lineV];
        
        UILabel *label = [AppUIKit labelWithTitle:@"第三方登录" titleFontSize:12 textColor:WhiteColor backgroundColor:APPMainColor alignment:NSTextAlignmentCenter];
        [self addSubview:label];
        lineV.sd_layout.topSpaceToView(self, 6).leftSpaceToView(self, 38).rightSpaceToView(self, 38).heightIs(1);
        label.sd_layout.centerYEqualToView(lineV).widthIs(70).heightIs(12).centerXEqualToView(self);
        
        NSInteger columnNum = self.loginMethodArr.count;
        CGFloat btnW = 46;
        CGFloat btnH = 46;
        CGFloat margin = (self.frame.size.width - columnNum * btnW) / (columnNum + 1);
        
        for (int i = 0; i < self.loginMethodArr.count; i ++) {
//            int row = i/columnNum;//行号
            //     1/3=0,  2/3=0,  3/3=1;
            int loc = i%columnNum;//列号
            CGFloat btnX = margin + (margin + btnW) * loc;
//            CGFloat btnY = margin + (margin + btnH) * row - 10;
            UIButton *bottomView = [[UIButton alloc]init];
            bottomView.tag = 10 + i;
            [bottomView setBackgroundImage:IMG(@"Login_Wechat") forState:UIControlStateNormal];
            [bottomView addTarget:self action:@selector(functionClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:bottomView];
            bottomView.sd_layout.leftSpaceToView(self, btnX).centerYEqualToView(self).widthIs(btnW).heightIs(btnH);
        }
    }
    
}

- (void)functionClick:(UIButton *)sender{
    //根据按钮的tag值，找到对应的登录类型
    NSString *typeName = [self.loginMethodArr objectAtIndex:sender.tag - 10];
    UIViewController *vc = [AppCommon getViewController:self];
    if ([typeName isEqualToString:@"Login_QQ"]){
        [[AppDelegate new] getAuthInfoFromQQWithCurrentViewController:vc CallBack:^(BOOL success, id responseObject, NSError *error) {
            if (success) {
                
            }else{
                [self showErrorText:@"QQ登录失败"];
                NSLog(@"%@",error);
            }
        }];
    }else if ([typeName isEqualToString:@"Login_Wechat"]){
        [[AppDelegate new] getAuthInfoFromWechatWithCurrentViewController:vc CallBack:^(BOOL success, id responseObject, NSError *error) {
            if (success) {
                
            }else{
                [self showErrorText:@"微信登录失败"];
                NSLog(@"%@",error);
            }
        }];
    }else if ([typeName isEqualToString:@"Login_Sina"]){
        [[AppDelegate new] getAuthInfoFromSinaWithCurrentViewController:vc CallBack:^(BOOL success, id responseObject, NSError *error) {
            if (success) {
                
            }else{
                [self showErrorText:@"微博登录失败"];
                NSLog(@"%@",error);
            }
        }];
    }
}





- (NSMutableArray *)loginMethodArr{
    if (!_loginMethodArr) {
        _loginMethodArr = [[NSMutableArray alloc]init];
    }
    return _loginMethodArr;
}


@end
