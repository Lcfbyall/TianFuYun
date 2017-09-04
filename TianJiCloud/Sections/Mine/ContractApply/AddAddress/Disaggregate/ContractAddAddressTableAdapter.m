//
//  ContractAddAddressTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressTableAdapter.h"
#import "ContractAddAddressCellFactory.h"
#import "ContractAddAddressCellModel.h"
#import "ContractAddAddressBaseCell.h"

static NSString *const headerFooterIdentifier = @"ContractAddAddressListHeaderIdentifier";
@interface ContractAddAddressTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,strong)ContractAddAddressCellFactory *cellFactory;

@end


@implementation ContractAddAddressTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[ContractAddAddressCellFactory alloc]init];
    }
    
    return self;
}

- (void)setInteractor:(id<ContractAddAddressInteractor>)interactor{

    _interactor = interactor;
    
    [self setupTableView];
}

- (void)setupTableView{
    
    _tableView.backgroundColor = ThemeService.weak_color_00;

    _tableView.tableFooterView = [UIView new];
    
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
}

- (void)updateCommitBtn{


}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return[self.interactor.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContractAddAddressCellModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    ContractAddAddressBaseCell *cell =  (ContractAddAddressBaseCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
    [cell setDelegate:self.cellDelegate];
    
    [cell tjs_bindDataToCellWithValue:model];
    
    WEAK_SELF(self);
    cell.valueChangedBlock = ^(id sender) {
        STRONG_SELF(self);
        [self updateCommitBtn];
    };
    
    return cell;
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    ContractAddAddressCellModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ContractAddAddressCellModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    if(![model.leftValue isEqualToString:@"区域"]) return;

    TJSBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if([cell.delegate conformsToProtocol:@protocol(TJSBaseTableViewCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
        
        [tableView.tjs_viewController.view endEditing:YES];
        
        [cell.delegate onTapCell:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    header.contentView.backgroundColor = ThemeService.weak_color_00;
    
    return header;
}

@end


