//
//  DiscoveryViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryViewController.h"



@interface DiscoveryViewController ()

@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TJSBaseControllerContainerProtocol

- (void)tjs_setupChildViewControllers{
  
    UIViewController *news  = LOAD_Storyboard(MainSB, DiscoryNewsListVC);
    [self addChildViewController:news];
    
    UIViewController *shows = LOAD_Storyboard(MainSB, DiscoryRoadShowListVC);
    [self addChildViewController:shows];
}




@end





