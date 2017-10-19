//
//  WithDrawDepositTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositTableAdapter.h"
#import "WithDrawDepositCellFactory.h"
#import "WithDrawDepositCellModel.h"
#import "WithDrawDepositHeaderFooterView.h"
#import "WithDrawDepositBaseCell.h"
#import "WithDrawDepositHomeHeader.h"

@interface WithDrawDepositTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,weak)UIButton *commitBtn;
@property (nonatomic,weak)WithDrawDepositHomeHeader *header;
@property (nonatomic,strong)WithDrawDepositCellFactory *cellFactory;

@end

@implementation WithDrawDepositTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[WithDrawDepositCellFactory alloc]init];
    }
    
    return self;
}


- (void)setInteractor:(id<WithDrawDepositInteractor>)interactor{
  
    _interactor = interactor;

    [self setupTableView];
}

- (void)setupTableView{
    
    WEAK_SELF(self);
    BOOL valid = [self.interactor canCommit];
    UIControlState state = valid? UIControlStateNormal:UIControlStateDisabled;
    UIView *tableFooterView = [UIButton tjs_commitBtnForTBFooter:@"提交保存" state: state blockForControl:^(id sender) {
        STRONG_SELF(self);
        [self.interactor withDrawForFree:^(id result, NSError * error) {}];
    }];
    _commitBtn = [tableFooterView viewWithTag:1111];
    _tableView.backgroundColor = ThemeService.weak_color_00;
    _tableView.tableFooterView = tableFooterView;
    
    //
    _header = [WithDrawDepositHomeHeader header];
    _tableView.tableHeaderView = _header;
    [_header tjs_bindDataToCellWithValue:@"10000"];
    
    _tableView.bounces = NO;
}


#pragma mark - Private

- (void)updateCommitBtn{
 
    _commitBtn.enabled = [self.interactor canCommit];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.interactor.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [((NSArray *)[self.interactor.items objectAtIndex:section]) count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WithDrawDepositCellModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    WithDrawDepositBaseCell *cell = (WithDrawDepositBaseCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
    cell.delegate = self.cellDelegate;
    
    WEAK_SELF(self);
    model.itemOperation = ^(id obj1, id obj2) {
        
        STRONG_SELF(self);
        [self updateCommitBtn];
    };
    
    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
}


#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self.interactor scrollViewDidScroll:scrollView];
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    WithDrawDepositCellModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WithDrawDepositCellModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];

    TJSBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(model.cellOperation){
     
        model.cellOperation(nil, nil);
    
        if([cell.delegate conformsToProtocol:@protocol(TJSBaseTableViewCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){

            [tableView.tjs_viewController.view endEditing:YES];
            
            [cell.delegate onTapCell:nil];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WithDrawDepositHeaderFooterView *header = [_cellFactory headerFooterViewIntable:tableView forSection:section];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 
    return section?40:0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
    WithDrawDepositHeaderFooterView *footer = [_cellFactory headerFooterViewIntable:tableView forSection:section];
    WithDrawDepositCellModel *model = [((NSArray *)[self.interactor.items objectAtIndex:section]) firstObject];
    [footer tjs_bindDataToCellWithValue:[model.headerFooterTitles lastObject]];
    
    return footer;
}

@end


