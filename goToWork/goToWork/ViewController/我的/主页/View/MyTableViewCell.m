//
//  MyTableViewCell.m
//  QianDouRepay
//
//  Created by <15>帝云科技 on 2018/4/10.
//  Copyright © 2018年 帝云科技<15>. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.iconImg];
        [self.contentView addSubview:self.leftLabel];
        self.rightLabel = [AppUIKit labelWithTitle:@"" titleFontSize:12 textColor:defaultTextColor backgroundColor:nil alignment:NSTextAlignmentRight];
        self.row = [[UIImageView alloc]initWithImage:IMG(@"")];
        [self.contentView addSubview:self.row];
        [self.contentView addSubview:self.rightLabel];
        UIView *lineV = [[UIView alloc]init];
        lineV.backgroundColor = Default_BackgroundGray;
        [self.contentView addSubview:lineV];
        
        self.iconImg.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 13).heightIs(20).widthIs(20);
        
        self.leftLabel.sd_layout.centerYEqualToView(self.iconImg).leftSpaceToView(self.iconImg, 12).widthRatioToView(self.contentView, 0.5).heightIs(20);
        
        self.rightLabel.sd_layout.centerYEqualToView(self.iconImg).rightSpaceToView(self.contentView, 37).widthIs(100).heightIs(20);
        
        self.row.sd_layout.centerYEqualToView(self.iconImg).rightSpaceToView(self.contentView, 22).widthIs(5).heightIs(8);
        
        lineV.sd_layout.leftSpaceToView(self.contentView, 0).rightEqualToView(self.contentView).heightIs(6).bottomEqualToView(self.contentView);
    }
    return self;
}



- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.font = kFont(12);
        _leftLabel.textColor = defaultTextColor;
    }
    return _leftLabel;
}

- (UIImageView *)iconImg{
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc]init];
        _iconImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImg;
}



@end
