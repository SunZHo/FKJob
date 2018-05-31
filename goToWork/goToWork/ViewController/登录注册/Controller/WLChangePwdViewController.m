//
//  WLChangePwdViewController.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLChangePwdViewController.h"

@interface WLChangePwdViewController (){
    UITextField *oldPwdTF;
    UITextField *newPwdTF;
    UITextField *surePwdTF;
}

@end

@implementation WLChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    self.title = @"修改密码";
    [self makeUI];
    
}

- (void)makeUI{
    
    NSArray *titleA = @[@"旧 密 码:",@"新 密 码:",@"确认密码:"];
    NSArray *placeHoldA = @[@"请输入旧密码",@"请输入新密码",@"请再输入确认密码"];
    for (int i = 0; i < titleA.count; i ++) {
        UILabel *sureLabel = [AppUIKit labelWithTitle:titleA[i] titleFontSize:15 textColor:defaultTextColor backgroundColor:nil alignment:0];
        
        UITextField *tf = [[UITextField alloc]init];
        tf.textColor = defaultTextColor;
        tf.secureTextEntry = YES;
        tf.borderStyle = UITextBorderStyleRoundedRect;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        tf.font = kFont(13);
        tf.tag = 1+i;
        tf.placeholder = placeHoldA[i];
        
        [self.view addSubview:sureLabel];
        [self.view addSubview:tf];
        sureLabel.sd_layout.topSpaceToView(self.view, 114 + SafeAreaTopHeight + 50 * i)
        .leftSpaceToView(self.view, 44).widthIs(70).heightIs(33);
        
        tf.sd_layout.topEqualToView(sureLabel)
        .leftSpaceToView(sureLabel, 9).rightSpaceToView(self.view, 46).heightRatioToView(sureLabel, 1);
    }
    
    oldPwdTF = [self.view viewWithTag:1];
    newPwdTF = [self.view viewWithTag:2];
    surePwdTF = [self.view viewWithTag:3];
    
    UIButton *sureBtn = [AppUIKit createBtnWithBackgroundColor:APPMainColor action:@selector(sureClick) target:self title:@"确定修改" image:nil font:18 textColor:WhiteColor];
    [self.view addSubview:sureBtn];
    sureBtn.sd_layout.topSpaceToView(self.view, 114 + SafeAreaTopHeight + 50 * 4).leftSpaceToView(self.view, 45).rightSpaceToView(self.view, 45).heightIs(36);
    
    
    
}


- (void)sureClick{
    NSLog(@"old = %@",oldPwdTF.text);
    NSLog(@"new = %@",newPwdTF.text);
    NSLog(@"sure = %@",surePwdTF.text);
    
}











@end
