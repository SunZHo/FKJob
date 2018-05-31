//
//  WLGrapOrderCell.h
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLGrapOrderModel.h"

@interface WLGrapOrderCell : UITableViewCell

@property (nonatomic , strong) UILabel *oneHourLabel;
@property (nonatomic , strong) UILabel *timeLabel;
@property (nonatomic , strong) UIView *lineV_T;
@property (nonatomic , strong) UILabel *nameLabel;
@property (nonatomic , strong) UILabel *addressLabel;
@property (nonatomic , strong) UIButton *grapButton;
@property (nonatomic , strong) UIView *lineV_B;
@property (nonatomic , strong) UILabel *singlePriceLabel;
@property (nonatomic , strong) UILabel *comeFromLabel;
@property (nonatomic , strong) UIView *lineV_B_10;

@property (nonatomic , strong) WLGrapOrderModel *grapModel;



@end
