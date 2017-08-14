//
//  TJSHomeListTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSHomeListTableAdapter.h"

#import "HomeHeaderContainer.h"
#import "HomeFooterContainer.h"

#import "TJSProductInfoModel.h"
#import "ProductListCell.h"
#import "ProductListCellHeaderView.h"

//cell的配置就是产品的，不再是home的了
#import "TJSProductListCellFactory.h"
#import "TJSProductListCellLayoutConfig.h"

@interface TJSHomeListTableAdapter ()

@property (nonatomic,strong) TJSProductListCellFactory *cellFactory;

@property (nonatomic,weak)  UITableView *tableView;

@property (nonatomic,strong)HomeHeaderContainer *headerContainer;

@property (nonatomic,strong)HomeFooterContainer *footerContainer;

@end

@implementation TJSHomeListTableAdapter


- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
      
        _cellFactory = [[TJSProductListCellFactory alloc]init];
        
        _tableView   = tableView;
        
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView{
  
    _headerContainer = [HomeHeaderContainer headerContainer];
    _footerContainer = [HomeFooterContainer footerContainer];
    _tableView.tableHeaderView = _headerContainer;
    _tableView.tableFooterView = _footerContainer;
}


#pragma mark - <UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    id<TJSHomeListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TJSBaseTableViewCell *cell = nil;
    
    id model = [[self.interactor items] objectAtIndex:indexPath.row];
    
    cell = [((TJSProductListCellFactory *)self.cellFactory)
            cellInTable:tableView
            forProductInfoModel:model];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(ProductListCell *)cell setDelegate:self.cellDelegate];

    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
}


#pragma mark - <UITableViewDataSource>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    id modelInArray    = [[self.interactor items] objectAtIndex:indexPath.row];
    TJSProductInfoModel *model = (TJSProductInfoModel *)modelInArray;
    
    id<TJSProductCellLayoutConfig> layoutConfig =[TJSProductListCellLayoutConfig  sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:model cellWidth:SCREEN_WIDTH].height;
    
    return cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [scrollView.tjs_viewController.navigationController.navigationBar endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ProductListCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
    TJSProductInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.row];
    
    if([cell.delegate conformsToProtocol:@protocol(TJSBaseTableViewCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
        
        [cell.delegate onTapCell:model];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //按理说应该弄一个headerFooterFactory,先暂时不弄了。
    //暂时先在TJSProductListCellFactory里返回，虽然这是不合理的。
    
    ProductListCellHeaderView *header = [_cellFactory headerFooterViewIntable:tableView forSection:section];

    [header tjs_bindDataToCellWithValue:@"精选产品"];
    
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [_cellFactory headerFooterViewIntable:tableView forSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    //按理说应该弄一个headerFooterLayoutConfig,先暂时不弄了。
    
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 1;
}

@end
