//
//  TJSPageControl.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/4.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJSPageControl : UIView

@property (nonatomic) NSInteger numberOfPages;
@property (nonatomic) NSInteger currentPage;
//deafult is 5
@property (nonatomic) CGFloat indicatorMargin;
//deafult is 10  15
@property (nonatomic) CGFloat indicatorDiameter;
@property (nonatomic) CGFloat currentindicatorDiameter;

@property (nonatomic, strong) UIImage *pageIndicatorImage;
@property (nonatomic, strong) UIImage *currentPageIndicatorImage;


@end
