//
//  WLLoginView.h
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/29.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate <NSObject>

- (void)didSelectButtonAtIndex:(NSInteger)index;

@end

@interface WLLoginView : UIView

@property (nonatomic , assign) id <LoginViewDelegate> delegate ;

@end
