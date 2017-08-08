//
//  CapitalRecordController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CapitalRecordContainer.h"
#import "CapitalRecordListController.h"


@interface CapitalRecordContainer ()

@end

@implementation CapitalRecordContainer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"资金记录";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - <TJSBaseDisplayContainerProtocol>

- (void)tjs_setupChildViewControllers{
    
    self.isfullScreen = NO;
    
    [self setUpContentViewFrame:^(UIView *contentView) {
        
        contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    }];
    
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        
        *norColor = ThemeService.text_color_01;
        *selColor = ThemeService.main_color_01;
        //titleFont =
        *titleWidth = 80;
        *titleHeight = 50.0;
    }];
    
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor, BOOL *isUnderLineEqualTitleWidth) {
        
        *underLineH = 1.0;
        *underLineColor = ThemeService.main_color_01;
        *isUnderLineEqualTitleWidth = YES;
        
    }];
    
    
    NSArray *listNameArray = @[@"全部",@"返佣",@"奖励",@"提现",@"已结算",@"充值"];
    
    [listNameArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CapitalRecordListController *vc = LOAD_Storyboard(MineSB, CapitalRecordListVC);
        
        vc.title = obj;
        
        [self addChildViewController:vc];
        
    }];
}

@end
