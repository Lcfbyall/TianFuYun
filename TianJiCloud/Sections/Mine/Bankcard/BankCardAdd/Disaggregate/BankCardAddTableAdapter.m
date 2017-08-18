//
//  BankCardAddTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddTableAdapter.h"
#import "BankCardAddCellFactory.h"
#import "BankCardAddCellInfoModel.h"

#import "BankCardAddHeaderFooterView.h"

static NSString *const headerFooterIdentifier = @"BankCardAddHeaderFooterView";

@interface BankCardAddTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,strong)BankCardAddCellFactory *cellFactory;

@end

@implementation BankCardAddTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[BankCardAddCellFactory alloc]init];
        
        [self setupTableView];
    }
    
    return self;
}


- (void)setupTableView{
    
    _tableView.backgroundColor = ThemeService.weak_color_00;

    _tableView.tableFooterView = [UIView new];
    
    [_tableView registerClass:[BankCardAddHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.interactor.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [((NSArray *)[self.interactor.items objectAtIndex:section]) count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BankCardAddCellInfoModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    
    TJSBaseTableViewCell *cell = (TJSBaseTableViewCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
    
    return cell;
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    BankCardAddCellInfoModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BankCardAddCellInfoModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    
  
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    BankCardAddHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];

    
    [header tjs_bindDataToCellWithValue:@""];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 
    return section?40:0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
    BankCardAddHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
  
    
    [header tjs_bindDataToCellWithValue:@""];
    
    return header;
}

@end

