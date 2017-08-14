//
//  ContractListTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListTableAdapter.h"

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

    return [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellForRowAtIndexPath"];

}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}


@end
