//
//  MyOrderContainerController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyOrderContainerController.h"
#import "MyOrderListViewController.h"

@interface MyOrderContainerController ()

@end

@implementation MyOrderContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的订单";
    
    
    [self p_setupChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    if(self.params[@"selectedIndex"])
    {
        self.selectIndex = [self.params[@"selectedIndex"] unsignedIntegerValue];
    }
}


#pragma mark - setup ChildViewControllers
- (void)p_setupChildViewControllers{
     
     self.isfullScreen = NO;
     
     [self setUpContentViewFrame:^(UIView *contentView) {
     
        contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
     }];
     
     
     [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
     
         *norColor = [UIColor darkTextColor];
         *selColor = [UIColor iOS7darkBlueColor];
         //titleFont =
         *titleWidth = 80;
         *titleHeight = 50.0;
     }];
    
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor, BOOL *isUnderLineEqualTitleWidth) {
        
        *underLineH = 1.0;
        *underLineColor = [UIColor iOS7darkBlueColor];
        *isUnderLineEqualTitleWidth = YES;
        
    }];
     
     
     NSArray *listNameArray = @[@"预约中",@"待报单",@"审核中",@"待结算",@"已结算",@"失败"];
     
     [listNameArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
     
     MyOrderListViewController *vc = LOAD_Storyboard(MineSB, MyOrderListVC);
   
     vc.title = obj;
     
     [self addChildViewController:vc];
     
     }];
}


@end
