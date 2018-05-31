//
//  WLRegistView.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLRegistView.h"
#import "WLSetPassWordViewController.h"

@interface WLRegistView () <UITextFieldDelegate>{
    UIView *phoneBackV;
    UIView *pwdBackV;
    UITextField *phoneTF;
    UITextField *pwdTF;
    UIButton *countDownBtn;
}

@property (nonatomic , strong) UIImageView *headImg;


@end

@implementation WLRegistView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = WhiteColor;
        self.layer.cornerRadius = 8;
        
        [self makeUI];
    }
    return self;
}

- (void)makeUI{
    UIView *topV = [[UIView alloc]init];
    topV.backgroundColor = [UIColor clearColor];
    topV.layer.borderColor = WhiteColor.CGColor;
    topV.layer.cornerRadius = kScaleWidth(60);
    topV.layer.borderWidth = 2;
    [self addSubview:topV];
    
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(kScaleWidth(-40));
        make.height.width.mas_equalTo(kScaleWidth(120));
    }];
    
    [self addSubview:self.headImg];
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(kScaleWidth(-30));
        make.height.width.mas_equalTo(kScaleWidth(98));
    }];
    
    phoneBackV = [[UIView alloc]init];
    phoneBackV.layer.borderWidth = 1;
    phoneBackV.layer.borderColor = HEXACOLOR(0xcccccc).CGColor;
    phoneBackV.layer.cornerRadius = kScaleWidth(24);
    [self addSubview:phoneBackV];
    
    pwdBackV = [[UIView alloc]init];
    pwdBackV.layer.borderWidth = 1;
    pwdBackV.layer.borderColor = HEXACOLOR(0xcccccc).CGColor;
    pwdBackV.layer.cornerRadius = kScaleWidth(24);
    pwdBackV.clipsToBounds = YES;
    [self addSubview:pwdBackV];
    
    phoneTF = [[UITextField alloc]init];
    phoneTF.textColor = HEXACOLOR(0x666666);
    phoneTF.font = kFont(14);
    
    phoneTF.delegate = self;
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:@"请输入手机号" attributes:                                              @{NSForegroundColorAttributeName:PlaceHolderColor,                                                       NSFontAttributeName:[UIFont systemFontOfSize:11]}];
    phoneTF.attributedPlaceholder = attrStr;
    [phoneBackV addSubview:phoneTF];
    
    pwdTF = [[UITextField alloc]init];
    pwdTF.textColor = HEXACOLOR(0x666666);
    pwdTF.font = kFont(14);
    
    pwdTF.delegate = self;
    NSAttributedString *attrStr1 = [[NSAttributedString alloc]initWithString:@"请输入密码" attributes:                                              @{NSForegroundColorAttributeName:PlaceHolderColor,                                                       NSFontAttributeName:[UIFont systemFontOfSize:11]}];
    pwdTF.attributedPlaceholder = attrStr1;
    [pwdBackV addSubview:pwdTF];
    
    countDownBtn = [AppUIKit createBtnWithBackgroundColor:APPMainColor action:@selector(countDownClick) target:self title:@"获取验证码" image:nil font:9 textColor:WhiteColor];
    [pwdBackV addSubview:countDownBtn];
    
    [phoneBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topV.bottom).offset(kScaleWidth(22));
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(kScaleWidth(48));
        make.width.mas_equalTo(kScaleWidth(216));
    }];
    
    [phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->phoneBackV);
        make.left.mas_equalTo(self->phoneBackV).offset(kScaleWidth(10));
        make.right.mas_equalTo(self->phoneBackV).offset(kScaleWidth(-10));
        make.height.mas_equalTo(kScaleWidth(40));
    }];
    
    [pwdBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->phoneBackV.bottom).offset(kScaleWidth(19));
        make.centerX.mas_equalTo(self->phoneBackV);
        make.height.mas_equalTo(self->phoneBackV);
        make.width.mas_equalTo(self->phoneBackV);
    }];
    
    [pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->pwdBackV);
        make.left.mas_equalTo(self->pwdBackV).offset(kScaleWidth(10));
        make.right.mas_equalTo(self->pwdBackV).offset(kScaleWidth(-60));
        make.height.mas_equalTo(kScaleWidth(40));
    }];
    
    [countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->pwdBackV);
        make.width.mas_equalTo(60);
        make.right.mas_equalTo(self->pwdBackV);
        make.height.mas_equalTo(self->pwdBackV);
    }];
    
    UIButton *agreeBtn = [[UIButton alloc]init];
    [agreeBtn setBackgroundImage:IMG(@"") forState:UIControlStateNormal];
    [agreeBtn setBackgroundImage:IMG(@"") forState:UIControlStateSelected];
    agreeBtn.backgroundColor = randomColor;
    [self addSubview:agreeBtn];
    
    UIButton *forgetBtn = [AppUIKit createBtnWithBackgroundColor:WhiteColor action:@selector(buttonClick:) target:self title:@"我已阅读并接受" image:nil font:12 textColor:HEXACOLOR_a(0x666666,0.8)];
    forgetBtn.tag = 1;
    
    UIButton *registBtn = [AppUIKit createBtnWithBackgroundColor:WhiteColor action:@selector(buttonClick:) target:self title:@"《用户服务协议》" image:nil font:12 textColor:APPMainColor];
    registBtn.tag = 2;
    
    UIButton *loginBtn = [AppUIKit createBtnWithBackgroundColor:WhiteColor action:@selector(buttonClick:) target:self title:@"下一步" image:nil font:14 textColor:APPMainColor];
    loginBtn.tag = 3;
    loginBtn.layer.borderWidth = 1;
    loginBtn.layer.borderColor = APPMainColor.CGColor;
    loginBtn.layer.cornerRadius = kScaleWidth(24);
    
    [self sd_addSubviews:@[loginBtn,forgetBtn,registBtn]];
    
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->pwdBackV.bottom).offset(kScaleWidth(25));
        make.centerX.mas_equalTo(self->phoneBackV);
        make.height.mas_equalTo(self->phoneBackV);
        make.width.mas_equalTo(self->phoneBackV);
    }];
    
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginBtn.bottom).offset(kScaleWidth(50));
        make.left.mas_equalTo(self->pwdBackV).offset(-25);
        make.height.width.mas_equalTo(11);
    }];
    
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginBtn.bottom).offset(kScaleWidth(50));
        make.left.mas_equalTo(agreeBtn.right).offset(5);
        make.height.mas_equalTo(kScaleWidth(14));
        make.width.mas_equalTo(100);
    }];
    
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(forgetBtn);
        make.right.mas_equalTo(self->pwdBackV).offset(25);
        make.height.mas_equalTo(forgetBtn);
        make.width.mas_equalTo(forgetBtn);
    }];
    
    
}



- (void)buttonClick:(UIButton *)sender{
    UIViewController *vc = [AppCommon getViewController:self];
    WLSetPassWordViewController *setPwdVC = [[WLSetPassWordViewController alloc]init];
    setPwdVC.isReset = NO;
    [vc.navigationController pushViewController:setPwdVC animated:YES];
}



- (void)countDownClick{
    
}



- (UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc]init];
        //        _headImg.image = IMG(@"我的_tabNormal");
        _headImg.backgroundColor = randomColor;
        _headImg.layer.cornerRadius = kScaleWidth(49);
        _headImg.clipsToBounds = YES;
    }
    return _headImg;
}

@end
