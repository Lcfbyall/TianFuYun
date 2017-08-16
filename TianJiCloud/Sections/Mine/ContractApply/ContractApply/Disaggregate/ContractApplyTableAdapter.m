//
//  ContractApplyTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractApplyTableAdapter.h"
#import "ContractApplyCellFactory.h"

#import "ContractInfoApplyModel.h"


static NSString *const headerFooterIdentifier = @"ContractListHeaderIdentifier";

@interface ContractApplyTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,strong)ContractApplyCellFactory *cellFactory;

@end

@implementation ContractApplyTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[ContractApplyCellFactory alloc]init];
        
        [self setupTableView];
    }
    
    return self;
}


- (void)setupTableView{
    
    _tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
    
    _tableView.backgroundColor = ThemeService.weak_color_00;

    WEAK_SELF(self);
    _tableView.tableFooterView = [UIButton tjs_commitBtnForTBFooter:@"提交" blockForControl:^(id sender) {
        
        STRONG_SELF(self);
        [self.interactor applyContractWithParams:nil callback:NULL];
    }];
                                
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.interactor.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [((NSArray *)[self.interactor.items objectAtIndex:section]) count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContractInfoApplyModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    return (UITableViewCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    ContractInfoApplyModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
    return 10;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

     UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    header.contentView.backgroundColor = ThemeService.weak_color_00;
    
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

@end


