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
#import "BankCardAddDefaultCell.h"

@interface BankCardAddTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,weak)UIButton *commitBtn;

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
    
    WEAK_SELF(self);
    UIControlState state = ![self.interactor canCommit]?UIControlStateNormal:UIControlStateDisabled;
    UIView *tableFooterView = [UIButton tjs_commitBtnForTBFooter:@"提交保存" state: state blockForControl:^(id sender) {
        STRONG_SELF(self);
        [self.interactor addBankCard:^(id result, NSError * error) {

        }];
    }];
    
    _commitBtn = [tableFooterView viewWithTag:1111];
    _tableView.backgroundColor = ThemeService.weak_color_00;
    _tableView.tableFooterView = tableFooterView;
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
    
    BankCardAddCellInfoModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    TJSBaseTableViewCell *cell = (TJSBaseTableViewCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
    cell.delegate = self.cellDelegate;
    
    WEAK_SELF(self);
    ((BankCardAddDefaultCell *)cell).valueChangedBlock = ^(id sender) {
        
        STRONG_SELF(self);
        [self updateCommitBtn];
    };
    
    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
}


#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

     [scrollView.tjs_viewController.view endEditing:YES];
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
    if(model.canInput) return;
    
    TJSBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if([cell.delegate conformsToProtocol:@protocol(TJSBaseTableViewCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
    
        [tableView.tjs_viewController.view endEditing:YES];
        
        [cell.delegate onTapCell:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    BankCardAddHeaderFooterView *header = [_cellFactory headerFooterViewIntable:tableView forSection:section];
 
    BankCardAddCellInfoModel *model = [((NSArray *)[self.interactor.items objectAtIndex:section]) objectAtIndex:0];
    
    [header tjs_bindDataToCellWithValue:[model.headFooterTitles firstObject]];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 
    return section?40:0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
    BankCardAddHeaderFooterView *header = [_cellFactory headerFooterViewIntable:tableView forSection:section];
  
    BankCardAddCellInfoModel *model = [((NSArray *)[self.interactor.items objectAtIndex:section]) objectAtIndex:0];
    
    [header tjs_bindDataToCellWithValue:[model.headFooterTitles lastObject]];
    
    return header;
}

@end


