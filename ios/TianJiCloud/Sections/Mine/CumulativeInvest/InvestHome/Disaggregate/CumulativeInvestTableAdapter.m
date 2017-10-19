//
//  CumulativeInvestTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulativeInvestTableAdapter.h"
#import "CumulativeInvestCellFactory.h"
#import "CumulateInvestHeader.h"
#import "CumulateInvestInfoModel.h"

static NSString *const headerFooterIdentifier = @"CumulativeInvestListHeaderIdentifier";
@interface CumulativeInvestTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,weak)CumulateInvestHeader *header;

@property (nonatomic,strong)CumulativeInvestCellFactory *cellFactory;

@end

@implementation CumulativeInvestTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[CumulativeInvestCellFactory alloc]init];
    }
    
    return self;
}

- (void)setInteractor:(id<CumulativeInvestInteractor>)interactor{

    _interactor = interactor;
    
    [self setupTableView];
}

- (void)setupTableView{
    
    WEAK_SELF(self);
    _header = [CumulateInvestHeader header];
    _header.interactor = _interactor;
    [_tableView tjs_headerWithRefreshingBlock:^(UITableView *tableView) {
        STRONG_SELF(self);
        [self.header tjs_reloadTableHeader];
    }];
    
    _tableView.tableHeaderView = _header;
    _tableView.backgroundColor = ThemeService.weak_color_00;
    _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [UIView new];
    _tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.interactor.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CumulateInvestInfoModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    TJSBaseTableViewCell *cell = (TJSBaseTableViewCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CumulateInvestInfoModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CumulateInvestInfoModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    if(model.cellOperation) model.cellOperation(nil, nil);
    
}


@end


