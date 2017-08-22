//
//  CumulativeInvestLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestLayoutImpl.h"

@interface CumulativeInvestLayoutImpl ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,weak) id <CumulativeInvestLayoutDelegate> delegate;

@end

@implementation CumulativeInvestLayoutImpl

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        
        [self setupRefreshControl];
    }
    
    return self;
    
}

#pragma mark - <CumulativeInvestLayout>

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
    
    
    self.tableView.mj_header.ignoredScrollViewContentInsetTop = 16;
    
}


@end