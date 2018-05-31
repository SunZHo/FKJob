//
//  WLGrapOrderModel.h
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "BaseModel.h"

@interface WLGrapOrderModel : BaseModel

/** 一小时保洁 */
@property (nonatomic , copy) NSString *oneHour;
/** 预约时间：2018/06/01 10：30 */
@property (nonatomic , copy) NSString *meetTime;
/** 崔先生 */
@property (nonatomic , copy) NSString *name;
/** 青岛市福州北路汤匙公寓签单员201户 */
@property (nonatomic , copy) NSString *address;
/** ￥300/小时 */
@property (nonatomic , copy) NSString *singlePrice;
/** 订单来源：一键预约 */
@property (nonatomic , copy) NSString *comeForm;



@end
