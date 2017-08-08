//
//  PNBar.h
//  PNChartDemo
//
//  Created by kevin on 11/7/13.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PNBar : UIView


- (void)rollBack;

@property (nonatomic) float grade;      //0~1
@property (nonatomic) float maxDivisor; 

@property (nonatomic) CAShapeLayer *chartLine;
@property (nonatomic) UIColor      *barColor;
@property (nonatomic) UIColor      *borderColor;
@property (nonatomic) UIColor      *barColorGradientStart;
@property (nonatomic) CGFloat       barRadius;
@property (nonatomic) CAShapeLayer *gradientMask;

@property (nonatomic) CAShapeLayer *gradeLayer;
@property (nonatomic) CATextLayer  *textLayer;

/** Text color for all bars in the chart. */
@property (nonatomic) UIColor      *labelTextColor;

@property (nonatomic, assign) BOOL isNegative;          //!< 是否是负数
@property (nonatomic, assign) BOOL isShowNumber;        //!< 是否显示numbers
@property (nonatomic, assign) BOOL isShowBorder;

/** Display the bar with or without animation. Default is YES. **/
@property (nonatomic) BOOL         displayAnimated;
@end
