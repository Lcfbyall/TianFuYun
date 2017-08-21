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

@interface WithDrawDepositTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,weak)UIButton *commitBtn;

@property (nonatomic,strong)WithDrawDepositCellFactory *cellFactory;

@end

@implementation WithDrawDepositTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[WithDrawDepositCellFactory alloc]init];
        
        [self setupTableView];
    }
    
    return self;
}


- (void)setupTableView{
    
    WEAK_SELF(self);
    UIControlState state = UIControlStateNormal;

    UIView *tableFooterView = [UIButton tjs_commitBtnForTBFooter:@"提交保存" state: state blockForControl:^(id sender) {
        STRONG_SELF(self);
        [self.interactor withDrawForFree:^(id result, NSError * error) {

        }];
    }];
    
    _commitBtn = [tableFooterView viewWithTag:1111];
    _tableView.backgroundColor = ThemeService.weak_color_00;
    _tableView.tableFooterView = tableFooterView;
}


#pragma mark - Private

- (void)updateCommitBtn{
 
    _commitBtn.enabled = YES;
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
    ((WithDrawDepositBaseCell *)cell).valueChangedBlock = ^(id sender) {
        
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

    WithDrawDepositCellModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //WithDrawDepositCellModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];


    /*
    TJSBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if([cell.delegate conformsToProtocol:@protocol(TJSBaseTableViewCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
    
        [tableView.tjs_viewController.view endEditing:YES];
        
        [cell.delegate onTapCell:nil];
    }
     */
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
 
    WithDrawDepositHeaderFooterView *header = [_cellFactory headerFooterViewIntable:tableView forSection:section];
    
    return header;
}

@end


