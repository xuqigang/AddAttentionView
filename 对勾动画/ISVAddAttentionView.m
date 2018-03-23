//
//  ISVAddAttentionView.m
//  对勾动画
//
//  Created by Hanxiaojie on 2017/12/20.
//  Copyright © 2017年 凤凰新媒体. All rights reserved.
//

#import "ISVAddAttentionView.h"
#import <Masonry.h>

@interface ISVAddAttentionView () <CAAnimationDelegate>
{
    id _target;
    SEL _action;
}
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CABasicAnimation *animation;

@end

@implementation ISVAddAttentionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView];
        self.imageView.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.imageView.center = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addAttentionViewClicked:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


- (CAShapeLayer*)shapeLayer {
    if (!_shapeLayer) {
        //对勾路径
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint:CGPointMake(self.frame.size.width/4.0, self.frame.size.height/2.0)];
        [linePath addLineToPoint:CGPointMake(self.frame.size.width * 0.4, self.frame.size.height/3.0 * 2)];
        [linePath addLineToPoint:CGPointMake(self.frame.size.width/4.0 * 3, self.frame.size.height/3.0)];
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.path = linePath.CGPath;
        _shapeLayer.strokeColor = [UIColor colorWithRed:255/255.0 green:144.0/255.0 blue:0 alpha:1].CGColor;//线条颜色
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色
        _shapeLayer.lineWidth = self.frame.size.width * 0.15;
        _shapeLayer.strokeStart = 0.0;
        _shapeLayer.strokeEnd = 0.0;
        _shapeLayer.frame = self.bounds;
        _shapeLayer.lineCap = @"round";
        _shapeLayer.lineJoin = @"round";
        _shapeLayer.cornerRadius = self.frame.size.width/2.0;
        _shapeLayer.backgroundColor = [UIColor whiteColor].CGColor;
//        _shapeLayer.shadowColor = [UIColor grayColor].CGColor;
//        _shapeLayer.shadowRadius = 1;
//        _shapeLayer.shadowOffset = CGSizeMake(0, 0);
//        _shapeLayer.shadowOpacity = 0.2;
    }
    return _shapeLayer;
}
- (UIImageView *) imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"jiaguanzhu"];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (CABasicAnimation*)animation {
    if (!_animation) {
        _animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        [_animation setFromValue:@0.0];
        [_animation setToValue:@1.0];
        [_animation setDuration:0.5];
        _animation.removedOnCompletion = NO;
        _animation.fillMode = kCAFillModeForwards;//当动画结束后,layer会一直保持着动画最后的状态
        _animation.delegate = self;
    }
    return _animation;
}

- (void)addAttentionViewClicked:(UITapGestureRecognizer*)tap
{
    if (_delegate && [_delegate respondsToSelector:@selector(addAttentionViewDidClicked:)]) {
        [self startAnimitaion];
        [_delegate addAttentionViewDidClicked:self];
    }
}
- (void)startAnimitaion {
    self.imageView.hidden = YES;
    [self.layer addSublayer:self.shapeLayer];
    [self.shapeLayer addAnimation:self.animation forKey:@"shapeLayerAnimation"];
}

- (void)resetAnimitaion {
    self.imageView.hidden = NO;
    [self.shapeLayer removeFromSuperlayer];
    [self.shapeLayer removeAnimationForKey:@"shapeLayerAnimation"];
}

@end
