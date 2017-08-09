//
//  ProductFilterController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterController.h"

@interface ProductFilterController ()
@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;

@end

@implementation ProductFilterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"产品筛选";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - setupConfig




#pragma mark - TJSBaseVCConfig
- (void)tjs_configBaseView{
    
    
    
}

- (UIView *)tjs_listView{
    
    return _filterCollectionView;
}




@end
