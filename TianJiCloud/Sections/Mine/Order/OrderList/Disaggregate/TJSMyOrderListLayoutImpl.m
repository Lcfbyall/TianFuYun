//
//  TJSMyOrderListLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListLayoutImpl.h"

@interface TJSMyOrderListLayoutImpl ()

@property (nonatomic,strong)  UITableView *tableView;

@property (nonatomic,weak)    id<TJSMyOrderListLayoutDelegate> delegate;

@end

@implementation TJSMyOrderListLayoutImpl

- (instancetype)initWithTableView:(UITableView *)tableView{
   
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        
        [self setupRefreshControl];
    }
    
    return self;
  
}


#pragma mark - <TJSMyOrderListLayout>

- (void)remove:(NSArray <NSIndexPath *> *)indexPaths{
  
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)reloadTable{
  
    [self.tableView reloadData];
}

- (void)beginRefresh{

    [self.tableView.mj_header beginRefreshing];
}

- (void)endRefresh{

    [self.tableView.mj_header endRefreshing];
}


#pragma mark - private

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
