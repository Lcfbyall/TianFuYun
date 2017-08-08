//
//  TJSPageControl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSPageControl.h"


@interface TJSPageControl ()

@end

@implementation TJSPageControl{

    NSMutableArray *_images;
    CGFloat currentWidth;
}

- (instancetype)init{
    self= [super init];
    if(self){
        
        [self initial];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
        [self initial];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    
}

- (void)initial{
    
    _indicatorMargin = 5;
    _indicatorDiameter = 7;
    _currentindicatorDiameter = 15;
    
    _pageIndicatorImage = [UIImage imageNamed:@"pageControlnormal"];
    _currentPageIndicatorImage = [UIImage imageNamed:@"pageControlbluewhite"];
}

- (void)createIndicators{
    
    if(_images == nil){
        _images = [NSMutableArray array];
    }else{
        [_images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj performSelector:@selector(removeFromSuperview)];
        }];
        [_images removeAllObjects];
    }
    
    for(NSInteger i =0;i < self.numberOfPages;i++){
        
        UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectZero];
        imgv.contentMode = UIViewContentModeScaleAspectFit;
        //imgv.backgroundColor = [UIColor greenColor];
        [self addSubview:imgv];
        [_images addObject:imgv];
    }
}


- (void)layoutSubviews
{    [super layoutSubviews];
    
    CGFloat fullWidth = _currentindicatorDiameter + (_numberOfPages - 1) * (_indicatorMargin + _indicatorDiameter);
    [_images enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIImageView *imgV = (UIImageView *)obj;
        CGFloat height = _indicatorDiameter;
        CGFloat width = idx == _currentPage? _currentindicatorDiameter:_indicatorDiameter;
        CGFloat X = (self.frame.size.width - fullWidth) / 2.0 + currentWidth;
        CGFloat Y = (self.frame.size.height - _indicatorDiameter) / 2.0;
        imgV.image = idx == _currentPage? _currentPageIndicatorImage:_pageIndicatorImage;
        imgV.frame = CGRectMake(X, Y, width, height);
        currentWidth +=  width + _indicatorMargin;
    }];
    currentWidth = 0;
}



#pragma mark settters
- (void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    [self setNeedsLayout];
}
- (void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    [self createIndicators];
}
- (void)setIndicatorDiameter:(CGFloat)indicatorDiameter{
    _indicatorDiameter = indicatorDiameter;
    [self setNeedsLayout];
}
- (void)setCurrentindicatorDiameter:(CGFloat)currentindicatorDiameter{
    _currentindicatorDiameter = currentindicatorDiameter;
    [self setNeedsLayout];
}
- (void)setIndicatorMargin:(CGFloat)indicatorMargin{
    _indicatorMargin = indicatorMargin;
    [self setNeedsLayout];
}

@end
