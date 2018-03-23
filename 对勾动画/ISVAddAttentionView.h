//
//  ISVAddAttentionView.h
//  对勾动画
//
//  Created by Hanxiaojie on 2017/12/20.
//  Copyright © 2017年 凤凰新媒体. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ISVAddAttentionView;

@protocol ISVAddAttentionViewDelegate <NSObject>

- (void)addAttentionViewDidClicked:(ISVAddAttentionView*)addAttentionView;

@end

@interface ISVAddAttentionView : UIView

@property (nonatomic, weak) id <ISVAddAttentionViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)resetAnimitaion;

@end
