//
//  ContractListTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListTableAdapter.h"

#import "ContractListCellFactory.h"
#import "ContractListCell.h"
#import "ContractListHeader.h"
#import "ContractInfoModel.h"

@interface ContractListTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;


@end

@implementation ContractListTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        
        [self setupTableView];
    }
    
    return self;
}


- (void)setupTableView{
    
    _tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
    
    _tableView.backgroundColor = ThemeService.weak_color_00;

    _tableView.tableHeaderView = [ContractListHeader header];
    
    _tableView.tableFooterView = [UIView new];
    
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.interactor.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ContractInfoModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    return [ContractListCellFactory cellInTable:tableView forMineInfoModel:model];
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

@end


