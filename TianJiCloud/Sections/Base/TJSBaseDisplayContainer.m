//
//  TJSBaseDisplayContainer.m
//  TianJiCloud
//
//  Created by staff on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseDisplayContainer.h"

@interface TJSBaseDisplayContainer ()

@end

@implementation TJSBaseDisplayContainer


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self tjs_setupChildViewControllers];
    
    [self tz_addPopGestureToView:self.contentSroll];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    if(self.params[@"selectedIndex"])
    {
        self.selectIndex = [self.params[@"selectedIndex"] unsignedIntegerValue];
    }
}


#pragma mark - <TJSBaseDisplayContainerProtocol>

- (void)tjs_setupChildViewControllers{


}

- (UIScrollView *)titleScroll{
 
    return (UIScrollView *)self.titleScroll;
}

- (UIScrollView *)contentSroll{
  
    return (UIScrollView *)self.contentScrollView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


