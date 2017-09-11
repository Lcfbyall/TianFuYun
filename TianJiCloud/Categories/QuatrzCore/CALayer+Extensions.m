//
//  CALayer+Extensions.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CALayer+Extensions.h"

@implementation CALayer (Extensions)


- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

/*
 *  摇动
 */
-(void)shake{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 16;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = .1f;
    
    //重复
    kfa.repeatCount =2;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self addAnimation:kfa forKey:@"shake"];
}


//暂停layer上面的动画
- (void)pauseAnimation
{
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
}

//继续layer上面的动画
- (void)resumeAnimation
{
    CFTimeInterval pausedTime = [self timeOffset];
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.beginTime = timeSincePause;
}

//自己旋转不停
- (void)addRotate
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue           = @0;
    animation.toValue             = @(M_PI*2);
    animation.duration            = 5.0f;
    animation.beginTime           = CACurrentMediaTime()+.35;//.35秒后执行
    animation.repeatCount         = HUGE_VALF;
    //动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self addAnimation:animation forKey:@"rotate-layer-360"];
}


//波纹动画
- (void)addWaveAfter:(CFTimeInterval)after
{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue   = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2,2,1)];

    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue      = @1;
    alphaAnimation.toValue        = @0;

    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.beginTime           = CACurrentMediaTime() + after;
    animation.animations          = @[scaleAnimation, alphaAnimation];
    animation.duration            = 2.0f;
    animation.repeatCount         = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode            = kCAFillModeForwards;
    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
     [self addAnimation:animation forKey:@"wave"];
}
@end
