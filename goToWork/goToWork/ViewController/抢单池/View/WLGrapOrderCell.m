//
//  WLGrapOrderCell.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLGrapOrderCell.h"

@implementation WLGrapOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.oneHourLabel = [AppUIKit labelWithTitle:@"" titleFontSize:15 textColor:defaultTextColor backgroundColor:nil alignment:0];
        self.timeLabel = [AppUIKit labelWithTitle:@"" titleFontSize:13 textColor:HEXACOLOR_a(0x333333, 0.7) backgroundColor:nil alignment:NSTextAlignmentRight];
        self.lineV_T = [AppUIKit viewWithBackGroundColor:Default_BackgroundGray];
        self.nameLabel = [AppUIKit labelWithTitle:@"" titleFontSize:15 textColor:WhiteColor backgroundColor:randomColor alignment:NSTextAlignmentCenter];
        self.addressLabel = [AppUIKit labelWithTitle:@"" titleFontSize:14 textColor:defaultTextColor backgroundColor:nil alignment:0];
        self.addressLabel.numberOfLines = 0;
        self.grapButton = [AppUIKit createBtnWithBackgroundColor:HEXACOLOR(0xff6559) action:@selector(grapClick) target:self title:@"抢" image:nil font:14 textColor:WhiteColor];
        self.lineV_B = [AppUIKit viewWithBackGroundColor:Default_BackgroundGray];
        self.singlePriceLabel = [AppUIKit labelWithTitle:@"" titleFontSize:13 textColor:HEXACOLOR(0xf44336) backgroundColor:nil alignment:0];
        self.comeFromLabel = [AppUIKit labelWithTitle:@"" titleFontSize:13 textColor:defaultTextColor backgroundColor:nil alignment:NSTextAlignmentRight];
        self.lineV_B_10 = [AppUIKit viewWithBackGroundColor:Default_BackgroundGray];
        
        [self.contentView sd_addSubviews:@[self.oneHourLabel,self.timeLabel,self.lineV_T,self.nameLabel,self.addressLabel,self.grapButton,self.lineV_B,self.singlePriceLabel,self.comeFromLabel,self.lineV_B_10]];
        
        
        
    }
    return self;
}

- (void)layoutSubviews{
    self.oneHourLabel.sd_layout.topSpaceToView(self.contentView, 11).leftSpaceToView(self.contentView, 12).widthIs(100).heightIs(15);
    
    self.timeLabel.sd_layout.topEqualToView(self.oneHourLabel).rightSpaceToView(self.contentView, 16).heightRatioToView(self.oneHourLabel, 1).leftSpaceToView(self.oneHourLabel, 0);
    
    self.lineV_T.sd_layout.topSpaceToView(self.oneHourLabel, 11).leftEqualToView(self.contentView).rightEqualToView(self.contentView).heightIs(2);
    
    self.nameLabel.sd_layout.topSpaceToView(self.lineV_T, 4).leftEqualToView(self.oneHourLabel).widthIs(65).heightIs(65);
    self.nameLabel.sd_cornerRadius = @8;
    
    self.addressLabel.sd_layout.topEqualToView(self.nameLabel).leftSpaceToView(self.nameLabel, 10).heightRatioToView(self.nameLabel, 1).rightSpaceToView(self.contentView, 100);
    
    self.grapButton.sd_layout.centerYEqualToView(self.nameLabel).rightEqualToView(self.timeLabel).heightIs(32).widthIs(32);
    self.grapButton.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    self.lineV_B.sd_layout.topSpaceToView(self.nameLabel, 4).leftEqualToView(self.contentView).rightEqualToView(self.contentView).heightIs(2);
    
    self.singlePriceLabel.sd_layout.leftEqualToView(self.oneHourLabel).heightIs(14).widthRatioToView(self.oneHourLabel, 1).topSpaceToView(self.lineV_B, 12);
    
    self.comeFromLabel.sd_layout.topEqualToView(self.singlePriceLabel).heightRatioToView(self.singlePriceLabel, 1).widthRatioToView(self.timeLabel, 1).rightEqualToView(self.timeLabel);
    
    self.lineV_B_10.sd_layout
    .bottomEqualToView(self.contentView).leftEqualToView(self.contentView).rightEqualToView(self.contentView).heightIs(10);
    
    
}





- (void)grapClick{
    
}



- (void)setGrapModel:(WLGrapOrderModel *)grapModel{
    self.oneHourLabel.text = grapModel.oneHour;
    self.timeLabel.text = grapModel.meetTime;
    self.nameLabel.text = grapModel.name;
    self.addressLabel.text = grapModel.address;
    self.singlePriceLabel.text = grapModel.singlePrice;
    self.comeFromLabel.text = grapModel.comeForm;
}









@end
