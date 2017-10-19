//
//  EmptyDataSetAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "EmptyDataSetAdapter.h"
#import "UIScrollView+EmptyDataSet.h"

@interface EmptyDataSetAdapter ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic,strong) UIImage *emptyImage;


@end

@implementation EmptyDataSetAdapter

- (instancetype)init{

    self = [super init];
    if(self){
        
    }
    
    return self;
}

+ (instancetype)adapterWithScrollView:(UIScrollView *)scrollView{

    EmptyDataSetAdapter *adapter = [[self alloc]init];
    
    adapter.scrollView = scrollView;
    
    adapter.emptyImage = IMAGE(@"no_data");

    return adapter;
}


#pragma mark - <DZNEmptyDataSetSource>

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    
    return  self.emptyImage;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    
    NSString *text = @"没有数据";
    NSDictionary *attributes =
    @{NSFontAttributeName: [ThemeService pingFangSCMediumWithSize:16.0f],
      NSForegroundColorAttributeName: UIColorHex(0x999999)};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{
    
    return  ThemeService.origin_color_00;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView{
    
    return 26;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return  -34.f;
}

#pragma mark - <DZNEmptyDataSetDelegate>

- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView{
    
    return  YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    
    return YES;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    
    [self.scrollView.mj_header beginRefreshing];
}

//lifecircle
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView{
    
    
}

- (void)emptyDataSetDidAppear:(UIScrollView *)scrollView{
    
    
}

- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView{
    
    
}

- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView{
    
    
}

@end


