//
//  MyFavListLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyFavListLayoutImpl.h"

@interface MyFavListLayoutImpl ()

@property (nonatomic,weak)  UITableView *tableView;

@property (nonatomic,weak) id <MyFavListLayoutDelegate> delegate;

@end

@implementation MyFavListLayoutImpl

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        
        [self setupRefreshControl];
    }
    
    return self;
    
}


#pragma mark - <MyFavListLayout>

- (void)reloadTable{
    
    [self.tableView reloadData];
}

- (void)beginRefresh{
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)endRefresh{
    
    [self.tableView.mj_header endRefreshing];
}

- (void)remove:(NSArray <NSIndexPath *>*)indexPaths{
    
    [self.tableView beginUpdates];
    
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
    [self.tableView endUpdates];
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
