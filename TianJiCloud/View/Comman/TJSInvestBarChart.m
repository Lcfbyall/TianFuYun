//
//  TJSInvestBarChart.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//
#import "TJSInvestBarChart.h"

@interface TJSInvestBarChart ()<UIScrollViewDelegate>
{
    NSMutableArray *_xChartLabels;
    NSMutableArray *_yChartLabels;
}
@property(nonatomic,weak) UIScrollView *bgscroll;
@end


@implementation TJSInvestBarChart


#pragma mark -
#pragma mark -
#pragma life circle
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setupDefaultValues];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setupDefaultValues];
    }
    return self;
}
- (void)setupDefaultValues
{
    [super setupDefaultValues];

    self.clipsToBounds   = YES;
    _xChartLabels        = [NSMutableArray array];
    _yChartLabels        = [NSMutableArray array];
    _bars                = [NSMutableArray array];
    
    _labelTextColor      = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    _labelFont           = [UIFont systemFontOfSize:12.0f];
    _yChartLabelLeftMagin= 2;
    _yChartLabelWidth    = 30;
    _yLabelPrefix        = @"";
    _yLabelSuffix        = @"";
    _xLabelMarginTop     = 0;
    _xLabelSkip          = 1;
    _xLabelvisiable      = @[];
    _xcoor_BarsSum       = 1;
    _xcoor_BarsWidthscale= 0.5;
    _maxbarWidth         = 25;
    _yLabelSum           = 6;
    _yLabelSumMax        = 0;
    _chartMarginLeft     = 25.0;
    _chartMarginRight    = 25.0;
    _chartMarginTop      = 25.0;
    _chartMarginBottom   = 25.0;
    
    _barRadius           = 2.0;
    
    _showLabel           = YES;
    _showxLabel          = YES;
    _showyLabel          = YES;
    _showChartBorder     = NO;
    _isShowNumbers       = NO;
    _isShowBarBorders    = NO;
    _chartBorderColor    = [UIColor redColor];
    
    _yLabelFormatter = ^(CGFloat yValue,NSInteger index){
        return [NSString stringWithFormat:@"%1.f",yValue]; //丢掉小数点后
    };
}

#pragma mark -
#pragma mark -
#pragma setters && getters
- (UIScrollView *)bgscroll
{
    if(_bgscroll == nil)
    {
        UIScrollView *bgscrol = [[UIScrollView alloc]initWithFrame:self.bounds];
        bgscrol.delegate = self;
        bgscrol.bounces = YES;
        bgscrol.contentSize = CGSizeMake(self.bounds.size.width , self.bounds.size.height);
        bgscrol.alwaysBounceHorizontal = YES;
        
        /*
        有时候一个scrollview中放置 几个按钮用来操作，但是会发现 按钮 点击反应很慢 活着点击后highlight图片不显示 长按后才会显示。。。这种情况说明 UIScrollView截获button touch事件
        设置UIScrollView的属性：
         */
        //bgscrol.canCancelContentTouches = NO;//是否可以中断touches
        //bgscrol.delaysContentTouches    = NO;//是否延迟touches事件
        ////bgscrol.zp_deliver = YES;
        [self addSubview:(_bgscroll = bgscrol)];
    }
    return _bgscroll;
}
- (void)setAxisXLabels:(NSArray *)axisXLabels
{
    _axisXLabels = axisXLabels;
    
    if(_xChartLabels)
    {
        [self viewCleanupForCollection:_xChartLabels];
    }
    else
    {
        _xChartLabels = [NSMutableArray new];
    }
    
    
    _xLabelWidth = (self.frame.size.width - _chartMarginLeft - _chartMarginRight) / [axisXLabels count];
    if(_showxLabel)
    {
         int labelAddCount = 0;
         for (int index = 0; index < _axisXLabels.count; index++)
         {
               labelAddCount += 1;
              if (labelAddCount == _xLabelSkip)
              {
                  
                  NSString *labelText    = [_axisXLabels[index] description];
                  UILabel * label        = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _xLabelWidth, kXLabelHeight)];
                  label.textAlignment             = NSTextAlignmentCenter;
                  label.userInteractionEnabled    = YES;
                  label.numberOfLines             = 1;
                  //label.minimumScaleFactor        = 0.833;
                  label.font                      = _labelFont;
                  label.textColor                 = _labelTextColor;
                  [label setTextAlignment:NSTextAlignmentCenter];
                  label.text                      = labelText;
            
                  CGFloat X     = (index*_xLabelWidth+_chartMarginLeft+_xLabelWidth /2.0);
                  CGFloat Y     = self.frame.size.height-(_chartMarginBottom-_xLabelMarginTop);
                  label.frame   = CGRectMake(0,Y,_xLabelWidth,kXLabelHeight);
                  
                  label.backgroundColor = self.xLabelColor?self.xLabelColor(index):[UIColor clearColor];
                  labelAddCount = 0;
                  
                  [_xChartLabels addObject:label];
                  [self.bgscroll addSubview:label];
                  
                  if(_xLabelvisiable.count)
                  {
                      if([_xLabelvisiable containsObject:@(index)])
                      {
                        label.hidden = NO;
                        [label sizeToFit];
                      }
                      else
                      {
                        label.adjustsFontSizeToFitWidth = YES;
                        label.hidden = YES;
                      }
                  }
                  else
                  {
                        label.adjustsFontSizeToFitWidth = NO;
                        label.hidden = NO;
                  }
                  
                  label.center  = CGPointMake(X,label.center.y);
              }
         }
    }
}
- (void)setAxisYValues:(NSArray *)axisYValues
{
    if(_showxLabel)
    {
        NSAssert(axisYValues.count == _axisXLabels.count * _xcoor_BarsSum ,@"count not the same");
        NSParameterAssert(axisYValues.count == _axisXLabels.count * _xcoor_BarsSum);
    }
    
    _axisYValues = axisYValues;
    if(_showyLabel)
    {
        [self __addYCoordinateLabelsValues];
    }
    
    else{
    
        [self processYMaxValue];
    }
}
- (void)processYMaxValue
{
    NSArray *yAxisValues = _axisYLabels ? _axisYLabels : _axisYValues;
    
    if(!_yLabelSumMax)
       _yLabelSum = _axisYLabels ? _axisYLabels.count - 1 :_yLabelSum;
    else
      _yLabelSum  = _yLabelSumMax;
    
    if (_yMaxValue)
    {
        _yValueMax = _yMaxValue;
    }
    else
    {
        [self getYValueMax:yAxisValues];
    }
    
    
    if (_yLabelSum==4)
    {
        _yLabelSum = yAxisValues.count;
        
        (_yLabelSum % 2 == 0) ? _yLabelSum : _yLabelSum++;
    }
    
}
- (void)getYValueMax:(NSArray *)yLabels
{
    CGFloat max;
    
    if(yLabels.count && [[yLabels firstObject] isKindOfClass:[NSNumber class]])
    {
       max  = [[yLabels valueForKeyPath:@"@max.floatValue"] floatValue];
    }
    if(yLabels.count && [[yLabels firstObject] isKindOfClass:[NSArray class]])
    {
        NSMutableArray *maxs = [NSMutableArray array];
        for(NSArray *arr in yLabels)
        {
            [maxs addObject:[arr valueForKeyPath:@"@max.floatValue"]];
        }
        max  = [[maxs valueForKeyPath:@"@max.floatValue"] floatValue];
    }
    
    //ensure max is even
    _yValueMax = max;
    
    if (_yValueMax == 0)
    {
        _yValueMax = _yMinValue;
    }
}
- (void)__addYCoordinateLabelsValues
{
    [self viewCleanupForCollection:_yChartLabels];
    
    [self processYMaxValue];
    
    float sectionHeight = (self.frame.size.height - (_chartMarginTop + _chartMarginBottom)) / _yLabelSum;
    
    for (int i = 0;i<= _yLabelSum;i++)
    {
        NSString *labelText;
        if (_axisYLabels)
        {
            float yAsixValue = [_axisYLabels[i] floatValue];
            labelText= _yLabelFormatter(yAsixValue,i);
        }
        else
        {
            labelText = _yLabelFormatter((float)_yValueMax * ( (i) / (float)_yLabelSum),i);
        }
        
        
        UILabel *label  = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor           = [UIColor greenColor];
        label.userInteractionEnabled    = YES;
        label.adjustsFontSizeToFitWidth = YES;
        label.adjustsLetterSpacingToFitWidth = YES;
        label.numberOfLines             = 1;
        label.minimumScaleFactor        = 0.8;
        label.font                      = _labelFont;
        label.textColor                 = _labelTextColor;
        [label setTextAlignment:NSTextAlignmentRight];

        label.text                      = [NSString stringWithFormat:@"%@%@%@", _yLabelPrefix, labelText, _yLabelSuffix];
        if(_yValueMax == 0)
        {
            label.text                  = [NSString stringWithFormat:@"%@%d%@", _yLabelPrefix,i * 1000 , _yLabelSuffix];
        }
        
        label.frame                     =
        (CGRect)
        {
            2,
            self.frame.size.height- (sectionHeight * i + kYLabelHeight/2.0 + _chartMarginBottom),
            _yChartLabelWidth,
            kYLabelHeight
        };
        
        label.backgroundColor = self.yLabelColor?self.yLabelColor(i):[UIColor clearColor];
        
        [_yChartLabels addObject:label];
        
        [self insertSubview:label atIndex:0];
    }
}


#pragma mark -
#pragma mark -
#pragma mark - strokeChart
- (void)strokeChart
{
    //Add Labels
    [self viewCleanupForCollection:_bars];

    //Update Bar
    [self updateBar];

    [self strokeChartBorder];
}
-(void)updateChartData:(NSArray *)data
{
    self.axisYValues = data;
    [self updateBar];
    [self strokeChartBorder];
}
- (void)updateBar
{
    
    if(self.descripView)
    {
       [self insertSubview:self.descripView() atIndex:0];
    }
    
    
    //Add bars
    CGFloat chartCavanHeight = self.frame.size.height - _chartMarginTop - _chartMarginBottom;
    if(!_showxLabel)
    {
        int count = _axisYValues.count / _xcoor_BarsSum;
        _xLabelWidth = (self.frame.size.width - _chartMarginLeft - _chartMarginRight) / count;
    }
    
    NSInteger index = 0;
    
    for (id valueString in _axisYValues)
    {
        PNBar *bar;
        
        CGFloat barHeight;
        
        if (_bars.count == _axisYValues.count)
        {
            bar = [_bars objectAtIndex:index];

            if([valueString isKindOfClass:[NSNumber class]])
            {
                barHeight    = chartCavanHeight * ([valueString floatValue] / (float)_yValueMax);
                if (isnan(barHeight)) barHeight = 0;
            }
            
            if([valueString isKindOfClass:[NSArray class]])
            {
                NSArray *valueArr = (NSArray *)valueString;
                float maxvalue    = [[valueArr lastObject]  floatValue];
                barHeight         = chartCavanHeight * (maxvalue / (float)_yValueMax);
                if (isnan(barHeight)) barHeight = 0;
            }
            
            CGFloat X = bar.frame.origin.x;
            CGFloat Y = self.frame.size.height - barHeight - _chartMarginBottom;
            CGFloat W =  bar.frame.size.width;
            CGFloat H =  !barHeight?0.1:barHeight;
            CGRect barframe = CGRectMake(X,Y,W,H);
            bar.frame = barframe;
        }
        
        else
        {
            CGFloat barWidth;
            CGFloat barXPosition;
            CGFloat barHeight;
            
            //_barWidth固定
            if (_barWidth)
            {
                if([valueString isKindOfClass:[NSNumber class]])
                {
                    barWidth     = _barWidth;
                    barXPosition = index *  _xLabelWidth + _chartMarginLeft + (_xLabelWidth - _barWidth) * 0.5;
                    
                    barHeight    = chartCavanHeight * ([valueString floatValue] / (float)_yValueMax);
                    if (isnan(barHeight)) barHeight = 0;
                }
                
                if([valueString isKindOfClass:[NSArray class]])
                {
                
                    barWidth          = _barWidth;
                    barXPosition      = (index / _xcoor_BarsSum) * _xLabelWidth + _chartMarginLeft + (_xLabelWidth - barWidth * _xcoor_BarsSum) * 0.5+ barWidth * (index % _xcoor_BarsSum);
                    
                    NSArray *valueArr = (NSArray *)valueString;
                    float maxvalue    = [[valueArr lastObject]  floatValue];
                    barHeight         = chartCavanHeight * (maxvalue / (float)_yValueMax);
                    if (isnan(barHeight)) barHeight = 0;
                }
            }
            else
            {
                if([valueString isKindOfClass:[NSNumber class]])
                {
                    //barWidth占_xLabelWidth的比例
                    barWidth     = (_xLabelWidth * _xcoor_BarsWidthscale);
                    if(barWidth > _maxbarWidth)
                    {
                        barWidth = _maxbarWidth;
                        barXPosition = index * _xLabelWidth + _chartMarginLeft+ (_xLabelWidth -_maxbarWidth) * 0.5;
                    }
                    else
                    {
                        barXPosition = index * _xLabelWidth + _chartMarginLeft + _xLabelWidth * (1- _xcoor_BarsWidthscale) * 0.5;
                    }
                    
                    barHeight    = chartCavanHeight * ([valueString floatValue] / (float)_yValueMax);
                    if (isnan(barHeight)) barHeight = 0;
                }
                
                 if([valueString isKindOfClass:[NSArray class]])
                {
                   
                  barWidth    = (_xLabelWidth * _xcoor_BarsWidthscale) / (float)_xcoor_BarsSum;
                    
                  if(barWidth > _maxbarWidth)
                  {
                      barWidth = _maxbarWidth;
                      if(self.barAlignment && self.barAlignment(index/2) != -1)
                      {
                          //第几个和xLabel居中对齐
                          NSInteger idx = self.barAlignment(index/2);
                          
                          barXPosition  = (index / _xcoor_BarsSum)  * _xLabelWidth + _chartMarginLeft + _xLabelWidth * 0.5 - barWidth * (0.5 + idx) + barWidth * (index % _xcoor_BarsSum);
                      }else{
                      
                          barXPosition  = (index / _xcoor_BarsSum) * _xLabelWidth + _chartMarginLeft +(_xLabelWidth - barWidth * _xcoor_BarsSum) * 0.5 + barWidth * (index % _xcoor_BarsSum);
                      }
                  }
                  else
                  {
                      if(self.barAlignment && self.barAlignment(index/2) != -1)
                      {
                          //第几个和xLabel居中对齐
                          NSInteger idx = self.barAlignment(index/2);
                          barXPosition  = (index / _xcoor_BarsSum)  * _xLabelWidth + _chartMarginLeft
                          
                          //+ (_xLabelWidth - barWidth * _xcoor_BarsSum) * 0.5
                          + _xLabelWidth * 0.5 - barWidth * (0.5 + idx)

                          
                          + barWidth * (index % _xcoor_BarsSum);
                      }
                      else
                      {
                          barXPosition  = (index / _xcoor_BarsSum) * _xLabelWidth + _chartMarginLeft + _xLabelWidth * (1 -_xcoor_BarsWidthscale) * 0.5 + barWidth * (index % _xcoor_BarsSum);
                      }
                  }
                    
                  NSArray *valueArr = (NSArray *)valueString;
                  float maxvalue    = [[valueArr lastObject]  floatValue];
                  barHeight         = chartCavanHeight * (maxvalue / (float)_yValueMax);
                  if (isnan(barHeight)) barHeight = 0;
                }
            }
            
    
            CGFloat X = barXPosition;
            CGFloat Y = self.frame.size.height - barHeight - _chartMarginBottom;
            CGFloat W =  barWidth;
            CGFloat H =  !barHeight?0.1:barHeight;
            CGRect barframe = CGRectMake(X,Y,W,H);
            
            bar = [[PNBar alloc] initWithFrame:barframe];
            //Change Bar Radius
            bar.barRadius   = _barRadius;
            //Set Bar Animation
            bar.displayAnimated    = self.displayAnimated;

            
            //Change Bar Background color
            if(self.barBackgroundColor)
            {
                bar.backgroundColor =  self.barBackgroundColor;
            }
            else
            {
                bar.backgroundColor =  [self barBackgroundColorAtIndex:index];
            }
    
            //Bar StrokColor First
            if (self.strokeColor)
            {
                bar.barColor = self.strokeColor;
            }
            else
            {
                bar.barColor = [self barColorAtIndex:index];
            }
            if (self.labelTextColor)
            {
                bar.labelTextColor = self.labelTextColor;
            }
            
            
            //For Click Index
            bar.tag = index;
            [_bars addObject:bar];
            [self.bgscroll addSubview:bar];
        }
        
        
        //Height Of Bar
        if([valueString isKindOfClass:[NSNumber class]])
        {
            float value = [valueString floatValue];
            float grade = fabsf((float)value / (float)value);
            
            if (isnan(grade))
            {
                grade   = 0;
            }
            //bar.maxDivisor   = (float)value;
            //bar.grade        = grade;
            bar.isShowNumber = self.showBarNumber?self.showBarNumber(index):self.isShowNumbers;
            bar.isShowBorder = self.showBarBorder?self.showBarBorder(index):self.isShowBarBorders;
        }
        
        if([valueString isKindOfClass:[NSArray class]])
        {
            NSArray *valueArr = (NSArray *)valueString;
            float value       = [[valueArr firstObject] floatValue];
            float maxvalue    = [[valueArr lastObject]  floatValue];
            
            float grade       = fabsf((float)value / (float)maxvalue);
            if (isnan(grade))
            {
                grade = 0;
            }
            bar.maxDivisor   = maxvalue;
            bar.grade        = grade;
            bar.isShowNumber = self.showBarNumber?self.showBarNumber(index):self.isShowNumbers;
            bar.isShowBorder = self.showBarBorder?self.showBarBorder(index):self.isShowBarBorders;
        }
        
        index += 1;
    }
}
- (void)strokeChartBorder
{
    //Add chart border lines
    if (_showChartBorder)
    {
        _chartBottomLine              = [CAShapeLayer layer];
        _chartBottomLine.lineCap      = kCALineCapButt;
        _chartBottomLine.fillColor    = [[UIColor whiteColor] CGColor];
        _chartBottomLine.lineWidth    = 1.0;
        _chartBottomLine.strokeEnd    = 0.0;
        
        
        CGFloat bottom      = self.frame.size.height - _chartMarginBottom;
        
        CGFloat right       = self.frame.size.width - _chartMarginRight;
        CGFloat left        = _chartMarginLeft;
        CGFloat top         = _chartMarginTop;
        
        CGPoint lefttopP    = CGPointMake(left,   top);
        CGPoint leftbottomP = CGPointMake(left,   bottom);
        CGPoint rightbottom = CGPointMake(right,  bottom);
        
        UIBezierPath *progressline = [UIBezierPath bezierPath];
        
        [progressline moveToPoint:leftbottomP];
        [progressline addLineToPoint:rightbottom];
        
        [progressline setLineWidth:1.0];
        [progressline setLineCapStyle:kCGLineCapSquare];
        _chartBottomLine.path        = progressline.CGPath;
        _chartBottomLine.strokeColor = [_chartBorderColor CGColor];;
        _chartBottomLine.strokeEnd   = 1.0;
        [self.layer addSublayer:_chartBottomLine];
        
        
        //Add left Chart Line
        _chartLeftLine = [CAShapeLayer layer];
        _chartLeftLine.lineCap      = kCALineCapButt;
        _chartLeftLine.fillColor    = [[UIColor whiteColor] CGColor];
        _chartLeftLine.lineWidth    = 1.0;
        _chartLeftLine.strokeEnd    = 0.0;
        UIBezierPath *progressLeftline = [UIBezierPath bezierPath];
        
        [progressLeftline moveToPoint:leftbottomP];
        [progressLeftline addLineToPoint:lefttopP];
        
        [progressLeftline setLineWidth:1.0];
        [progressLeftline setLineCapStyle:kCGLineCapSquare];
        _chartLeftLine.path        = progressLeftline.CGPath;
        _chartLeftLine.strokeColor = [_chartBorderColor CGColor];
        _chartLeftLine.strokeEnd   = 1.0;
        
        [self addBorderAnimationIfNeeded];
        [self.layer addSublayer:_chartLeftLine];
    }
}
- (void)addBorderAnimationIfNeeded
{
    if (self.displayAnimated)
    {
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 0.5;
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pathAnimation.fromValue = @0.0f;
        pathAnimation.toValue = @1.0f;
        [_chartBottomLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
        
        CABasicAnimation *pathLeftAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathLeftAnimation.duration = 0.5;
        pathLeftAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pathLeftAnimation.fromValue = @0.0f;
        pathLeftAnimation.toValue = @1.0f;
        [_chartLeftLine addAnimation:pathLeftAnimation forKey:@"strokeEndAnimation"];
    }
}


#pragma mark -
#pragma mark -
#pragma mark tools
- (void)viewCleanupForCollection:(NSMutableArray *)array
{
    if (array.count)
    {
        [array makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [array removeAllObjects];
    }
}
- (UIColor *)barColorAtIndex:(NSUInteger)index
{
    if ([self.strokeColors count] == [self.axisYValues count])
    {
        return self.strokeColors[index];
    }
    else
    {
        return self.strokeColor;
    }
}
- (UIColor *)barBackgroundColorAtIndex:(NSUInteger)index
{
    if ([self.barBackgroundColors count] == [self.axisYValues count])
    {
        return self.barBackgroundColors[index];
    }
    else
    {
        return self.barBackgroundColor;
    }
}



#pragma mark -
#pragma mark -
#pragma mark - Touch detection
//结束拖动，手指放开
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if(scrollView.contentOffset.x < -10)
    {
        if(self.swipeblock)
            self.swipeblock(YES);
    }
    if(scrollView.contentOffset.x > scrollView.contentSize.width + 10 - scrollView.frame.size.width)
    {
        if(self.swipeblock)
            self.swipeblock(NO);
    }
}


#pragma mark -
#pragma mark -
#pragma mark - touchesBegan
//在这里点击实际上是点击的UIScrollView，这里不会调用，但是在这把UIScrollView的touches截获向上传递了,所以可以走这里
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchPoint:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchPoint:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Get the point user touched
    UITouch *touch     = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    if(self.isOnlyBarClick)
    {
        UIView *subview    = [self hitTest:touchPoint withEvent:nil];
        if ([subview isKindOfClass:[PNBar class]] &&
            [self.delegate respondsToSelector:@selector(userClickedOnBarAtIndex:)])
        {
            [self addclickBarAnimationIfNeeded:subview.tag];
            [self.delegate userClickedOnBarAtIndex:subview.tag];
        }
    }
    
    else
    {
    //因为很多bar，点击到周边  _xLabelWidth看在那个范围之间
      if([self.delegate respondsToSelector:@selector(userClickedOnBarAtIndex:)])
        {
            CGFloat x       = touchPoint.x - _chartMarginLeft;
            NSInteger index = x / _xLabelWidth;
            index = (index < 0)?0:index;
            index = (index >= _axisXLabels.count)?(_axisXLabels.count -1):index;
        
            //[self addclickBarAnimationIfNeeded:subview.tag];
            [self.delegate userClickedOnBarAtIndex:index];
        }
    }
}
- (void)addclickBarAnimationIfNeeded:(NSInteger)barIndex
{
    PNBar * bar = [self.bars objectAtIndex:barIndex];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @1.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.toValue = @1.1;
    animation.duration = 0.2;
    animation.repeatCount = 0;
    animation.autoreverses = YES;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    [bar.layer addAnimation:animation forKey:@"Float"];
}

@end
