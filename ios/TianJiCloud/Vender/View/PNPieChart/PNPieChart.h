//
//  PNPieChart.h
//  PNChartDemo
//
//  Created by Hang Zhang on 14-5-5.
//  Copyright (c) 2014年 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNColor.h"
#import "PNPieChartDataItem.h"
#import "PNGenericChart.h"
#import "PNChartDelegate.h"
#import "PNLineChart.h"

@interface PNPieChart : PNGenericChart


- (id)initWithFrame:(CGRect)frame items:(NSArray *)items;
- (void)strokeChart;
- (void)recompute;
/** Update chart items. Does not update chart itself. */
- (void)updateChartData:(NSArray *)data;
@property (nonatomic, readonly) NSArray	       *items;
@property (nonatomic, weak)id<PNChartDelegate> delegate;




/** Default is 18-point Avenir Medium. */
@property (nonatomic) UIFont         *descriptionTextFont;
/** Default is white. */
@property (nonatomic) UIColor        *descriptionTextColor;
/** Default is black, with an alpha of 0.4. */
@property (nonatomic) UIColor        *descriptionTextShadowColor;
/** Default is CGSizeMake(0, 1). */
@property (nonatomic) CGSize         descriptionTextShadowOffset;
/** Hide percentage labels less than cutoff value */
@property (nonatomic, assign)CGFloat labelPercentageCutoff;
@property (nonatomic,copy)NSString   *centerdesString;
@property (nonatomic,copy)NSAttributedString *centerdesAttString;

/** Current outer radius. Override recompute() to change this. **/
@property (nonatomic) CGFloat        outerCircleRadius;
/** Current inner radius. Override recompute() to change this. **/
@property (nonatomic) CGFloat        innerCircleRadius;
/** Animation duration Default is 1.0. */
@property (nonatomic) NSTimeInterval duration;
/** Show only values, this is useful when legend is present */
@property (nonatomic) BOOL           showOnlyValues;
/** Show absolute values not relative i.e. percentages */
@property (nonatomic) BOOL           showAbsoluteValues;
/** show only tiles, not values or percentage */
@property (nonatomic) BOOL           hideValues;
/** hidede des of ever pieview */
@property (nonatomic) BOOL           hidedescription;
/** showCenterdescription */
@property (nonatomic) BOOL           showCenterdescription;
/** Default YES. */
@property (nonatomic) BOOL           shouldHighlightSectorOnTouch;
/** Multiple selection */
@property (nonatomic, assign) BOOL   enableMultipleSelection;



@end
