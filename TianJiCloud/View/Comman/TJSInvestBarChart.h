//
//  TJSInvestBarChart.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "PNGenericChart.h"

#import "PNColor.h"
#import "PNBar.h"
#import "PNChartDelegate.h"

#define kXLabelMargin 15
#define kYLabelMargin 15
#define kYLabelHeight 15
#define kXLabelHeight 15

typedef NSString *(^DietEXELabelFormatter)(CGFloat yLabelValue,NSInteger index);


@interface TJSInvestBarChart : PNGenericChart


/** Update Values. */
- (void)updateChartData:(NSArray *)data;
/**
 * Draws the chart in an animated fashion.
 */
- (void)strokeChart;


@property (nonatomic, weak) id<PNChartDelegate> delegate;
@property(nonatomic)NSArray<NSString *>         *axisXLabels;
@property(nonatomic)NSArray<NSNumber *>         *axisYLabels;
@property(nonatomic)NSArray<NSNumber *>         *axisYValues;

@property(nonatomic,copy) void (^swipeblock)(BOOL left);

@property (nonatomic)float           yValueMax;
@property (nonatomic) NSMutableArray *bars;
/** The maximum for the range of values to display on the y-axis. */
@property (nonatomic) CGFloat        yMaxValue;
/** The minimum for the range of values to display on the y-axis. */
@property (nonatomic) CGFloat        yMinValue;


/** Text color for all bars in the chart. */
@property (nonatomic) UIColor   *labelTextColor;
/** Font for all bars in the chart. */
@property (nonatomic) UIFont    *labelFont;

@property (nonatomic) CGFloat   yChartLabelLeftMagin;
/** Changes chart margin. */
@property (nonatomic) CGFloat   yChartLabelWidth;
/** Prefix to y label values, none if unset. */
@property (nonatomic) NSString  *yLabelPrefix;
/** Suffix to y label values, none if unset. */
@property (nonatomic) NSString  *yLabelSuffix;
/** How many labels on the y-axis default is 6 */
@property (nonatomic) NSInteger yLabelSum;
/** set Max labels on the y-axis  default is 0 */
@property (nonatomic) NSInteger yLabelSumMax;
@property (nonatomic,copy)UIColor *(^yLabelColor)(NSInteger index);


@property (nonatomic,copy)UIColor *(^xLabelColor)(NSInteger index);
@property (nonatomic) CGFloat   xLabelWidth;
@property (nonatomic) CGFloat   xLabelMarginTop;
/** How many labels on the x-axis to skip in between displaying labels. */
@property (nonatomic) NSInteger xLabelSkip;
/** visiable labels on the x-axis default is @[] */
@property (nonatomic) NSArray<NSNumber *> *xLabelvisiable;
/** How many bars on  every x－coordinate */
@property (nonatomic) NSInteger xcoor_BarsSum;
/** xcoor_Bars width scale  */
@property (nonatomic) float     xcoor_BarsWidthscale;


/** Corner radius for all bars in the chart. */
@property (nonatomic) CGFloat   barRadius;
/** Width of all bars in the chart. */
@property (nonatomic) CGFloat   barWidth;
/** allow max Width of every bar . */
@property (nonatomic) CGFloat   maxbarWidth;


/** Background color of all bars in the chart. */
@property (nonatomic) UIColor             *barBackgroundColor;
@property (nonatomic) NSArray<UIColor *>  *barBackgroundColors;
@property (nonatomic) UIColor             *strokeColor;
@property (nonatomic) NSArray<UIColor *>  *strokeColors;
/** barAlignment -1:center ,barIndex 第几个和xLabel居中对齐  **/
@property (nonatomic,copy)NSInteger(^barAlignment)(NSInteger index);


/** Formats the ylabel text. */
@property (nonatomic,copy)DietEXELabelFormatter yLabelFormatter;
@property (nonatomic) CGFloat  chartMarginLeft;
@property (nonatomic) CGFloat  chartMarginRight;
@property (nonatomic) CGFloat  chartMarginTop;
@property (nonatomic) CGFloat  chartMarginBottom;


/** Controls whether labels should be displayed. */
@property (nonatomic) BOOL          showLabel;
@property (nonatomic) BOOL          showxLabel;
@property (nonatomic) BOOL          showyLabel;
/** Controls whether the chart border line should be displayed. */
@property (nonatomic) BOOL          showChartBorder;  //衡纵坐标轴线
@property (nonatomic) UIColor       *chartBorderColor;
/** whether show numbers*/
@property (nonatomic, assign) BOOL  isShowNumbers;
/** settting every bar whether show numbers**/
@property(nonatomic,copy) BOOL(^showBarNumber)(NSInteger barIndex);
@property (nonatomic, assign) BOOL  isShowBarBorders;
@property(nonatomic,copy) BOOL(^showBarBorder)(NSInteger barIndex);
@property(nonatomic,assign)BOOL isOnlyBarClick;


@property(nonatomic,copy) UIView *(^descripView)(void);

/** Chart bottom border, co-linear with the x-axis. */
@property (nonatomic) CAShapeLayer  *chartBottomLine;
/** Chart left border, co-linear with the y-axis. */
@property (nonatomic) CAShapeLayer  *chartLeftLine;

@end
