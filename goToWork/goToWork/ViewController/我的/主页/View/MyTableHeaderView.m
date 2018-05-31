//
//  MyTableHeaderView.m
//  QianDouRepay
//
//  Created by <15>帝云科技 on 2018/4/10.
//  Copyright © 2018年 帝云科技<15>. All rights reserved.
//

#import "MyTableHeaderView.h"
#import "MyHeadView.h"


@implementation MyTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = APPMainColor;
        
        [self addSubview:self.headImg];
        [self addSubview:self.LogoLabel];
        [self addSubview:self.nameLabel];
        
        self.headImg.sd_layout.centerXEqualToView(self).topSpaceToView(self, 48).heightIs(54).widthIs(54);
        self.headImg.sd_cornerRadiusFromWidthRatio = @(0.5);
        
        self.LogoLabel.sd_layout.topSpaceToView(self.headImg, 8).leftEqualToView(self).rightEqualToView(self).heightIs(15);
        
        self.nameLabel.sd_layout.topSpaceToView(self.LogoLabel, 15).leftEqualToView(self).rightEqualToView(self).heightIs(15);
        MJWeakSelf;
        [self.headImg setTapActionWithBlock:^{
            [weakSelf tixianClick];
        }];
        
        
        
    }
    return self;
}


- (void)tixianClick{
    
    UIViewController *vc = [AppCommon getViewController:self];
    [BDImagePicker showImagePickerFromViewController:vc allowsEditing:YES finishAction:^(UIImage *image) {
        if (image) {
            
        }
    }];
}










#pragma mark - LazyLoad
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [AppUIKit labelWithTitle:@"爱心家政服务公司" titleFontSize:14 textColor:WhiteColor backgroundColor:nil alignment:NSTextAlignmentCenter];
    }
    return _nameLabel;
}


- (UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc]init];
        _headImg.backgroundColor = WhiteColor;
        _headImg.userInteractionEnabled = YES;
    }
    return _headImg;
}

- (UILabel *)LogoLabel{
    if (!_LogoLabel) {
        _LogoLabel = [AppUIKit labelWithTitle:@"LOGO上传" titleFontSize:15 textColor:WhiteColor backgroundColor:nil alignment:NSTextAlignmentCenter];
    }
    return _LogoLabel;
}



@end
