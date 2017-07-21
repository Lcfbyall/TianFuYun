//
//  ProductViewController.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductVCConfig.h"
#import "ProductListCell.h"

@interface ProductViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *productListTBView;

@property (nonatomic,strong)ProductVCConfig *vcConfig;

@end

@implementation ProductViewController

- (void)dealloc
{


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self vcConfig];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 10;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    ProductListCell *cell = [ProductListCell tjs_makeCellForNibTableView:tableView indexPath:indexPath];
    
    return cell;

}


#pragma mark - getters && setters
- (ProductVCConfig *)vcConfig{

    if(_vcConfig == nil){
     
        _vcConfig = [[ProductVCConfig alloc]init];
        
        self.navigationItem.leftBarButtonItems = [_vcConfig tjs_leftBarButtonItems];
        
        self.navigationItem.rightBarButtonItems = [_vcConfig tjs_rightBarButtonItems];
        
        self.navigationItem.titleView = [_vcConfig tjs_titleView];
    }
    
    return _vcConfig;
}

@end
