//
//  ProductFilterResultLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterResultLayoutImpl.h"

@interface ProductFilterResultLayoutImpl ()

@property (nonatomic,weak) id<ProductFilterResultLayoutDelegate> delegate;
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation ProductFilterResultLayoutImpl

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
    }
    return self;
}




#pragma mark - <ProductFilterResultLayout>

- (void)reloadTable{


}

- (void)beginRefresh{


}

- (void)endRefresh{



}


#pragma mark - Private

- (void)setupRefreshControl{
    
    
    WEAK_SELF(self);
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        STRONG_SELF(self);
        
        if(self){
            
            if ([self.delegate respondsToSelector:@selector(onRefresh)])
            {
                [self.delegate onRefresh];
            }
            
        }
        
    }];
}

@end
