//
//  WLSetPassWordViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLSetPassWordViewController.h"

@interface WLSetPassWordViewController ()<UITextFieldDelegate>{
    UIView *newPwdV;
    UIView *repeatPwdV;
    UITextField *newPwdTF;
    UITextField *repeatPwdTF;
}

@end

@implementation WLSetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isReset) {
        self.title = @"重置密码";
    }else{
        self.title = @"设置密码";
    }
    
    [self makeUI];
}




- (void)buttonClick{
    if (self.isReset) {
        
    }else{
        
    }
}


- (void)makeUI{
    
    newPwdV = [[UIView alloc]init];
    newPwdV.layer.borderWidth = 1;
    newPwdV.layer.borderColor = HEXACOLOR(0xcccccc).CGColor;
    newPwdV.layer.cornerRadius = kScaleWidth(24);
    [self.view addSubview:newPwdV];
    
    repeatPwdV = [[UIView alloc]init];
    repeatPwdV.layer.borderWidth = 1;
    repeatPwdV.layer.borderColor = HEXACOLOR(0xcccccc).CGColor;
    repeatPwdV.layer.cornerRadius = kScaleWidth(24);
    [self.view addSubview:repeatPwdV];
    
    newPwdTF = [[UITextField alloc]init];
    newPwdTF.textColor = HEXACOLOR(0x666666);
    newPwdTF.font = kFont(14);
    newPwdTF.delegate = self;
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:@"请输入新密码" attributes:                                              @{NSForegroundColorAttributeName:PlaceHolderColor,                                                       NSFontAttributeName:[UIFont systemFontOfSize:11]}];
    newPwdTF.attributedPlaceholder = attrStr;
    [newPwdV addSubview:newPwdTF];
    
    repeatPwdTF = [[UITextField alloc]init];
    repeatPwdTF.textColor = HEXACOLOR(0x666666);
    repeatPwdTF.font = kFont(14);
    repeatPwdTF.delegate = self;
    NSAttributedString *attrStr1 = [[NSAttributedString alloc]initWithString:@"请重复新密码" attributes:                                              @{NSForegroundColorAttributeName:PlaceHolderColor,                                                       NSFontAttributeName:[UIFont systemFontOfSize:11]}];
    repeatPwdTF.attributedPlaceholder = attrStr1;
    [repeatPwdV addSubview:repeatPwdTF];
    
    
    [newPwdV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(SafeAreaTopHeight + 64 + 38);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(kScaleWidth(48));
        make.width.mas_equalTo(kScaleWidth(275));
    }];
    
    [newPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->newPwdV);
        make.left.mas_equalTo(self->newPwdV).offset(kScaleWidth(20));
        make.right.mas_equalTo(self->newPwdV).offset(kScaleWidth(-40));
        make.height.mas_equalTo(kScaleWidth(40));
    }];
    
    [repeatPwdV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->newPwdV.bottom).offset(kScaleWidth(19));
        make.centerX.mas_equalTo(self->newPwdV);
        make.height.mas_equalTo(self->newPwdV);
        make.width.mas_equalTo(self->newPwdV);
    }];
    
    [repeatPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->repeatPwdV);
        make.left.mas_equalTo(self->repeatPwdV).offset(kScaleWidth(20));
        make.right.mas_equalTo(self->repeatPwdV).offset(kScaleWidth(-40));
        make.height.mas_equalTo(kScaleWidth(40));
    }];
    
    UIButton *sureBtn = [AppUIKit createBtnWithBackgroundColor:APPMainColor action:@selector(buttonClick) target:self title:@"重置密码" image:nil font:14 textColor:WhiteColor];
    if (self.isReset) {
        [sureBtn setTitle:@"重置密码" forState:UIControlStateNormal];
    }else{
        [sureBtn setTitle:@"设置密码" forState:UIControlStateNormal];
    }
    sureBtn.layer.borderWidth = 1;
    sureBtn.layer.borderColor = APPMainColor.CGColor;
    sureBtn.layer.cornerRadius = kScaleWidth(24);
    [self.view addSubview:sureBtn];
    
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->repeatPwdV.bottom).offset(kScaleWidth(19));
        make.centerX.mas_equalTo(self->newPwdV);
        make.height.mas_equalTo(self->newPwdV);
        make.width.mas_equalTo(self->newPwdV);
    }];
}

















@end
