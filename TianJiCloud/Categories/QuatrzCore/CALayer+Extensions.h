//
//  CALayer+Extensions.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/6.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Extensions)

//xib上设置border颜色
- (void)setBorderColorFromUIColor:(UIColor *)color;

/*
 *  摇动
 */
-(void)shake;

//暂停layer上面的动画
- (void)pauseAnimation;

//继续layer上面的动画
- (void)resumeAnimation;

//自己旋转不停
- (void)addRotate;

//波纹动画
- (void)addWaveAfter:(CFTimeInterval)after;

@end
