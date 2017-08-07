//
//  TJSMyOrderListTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMyOrderListTableAdapter.h"

#import "TJSMyOrderListCellFactory.h"
#import "TJSMyOrderListCellLayoutConfig.h"

#import "MyOrderInfoModel.h"
#import "MyOrderListTableCell.h"

@interface TJSMyOrderListTableAdapter ()

@property (nonatomic,strong) TJSMyOrderListCellFactory *cellFactory;

@property (nonatomic,weak)  UITableView *tableView;

@end

@implementation TJSMyOrderListTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
    
        _cellFactory = [[TJSMyOrderListCellFactory alloc]init];
        
        _tableView   = tableView;
    
    }
    
    return self;
}


#pragma mark - Private

- (void)setupTableView{
  
    
}


#pragma mark - <UITableViewDataSource>


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    
    id<TJSMyOrderListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TJSBaseTableViewCell *cell = nil;
    
    MyOrderInfoModel * info = [[self.interactor items] objectAtIndex:indexPath.row];
    
    cell = [((TJSMyOrderListCellFactory *)self.cellFactory)
            cellInTable:tableView forOrderInfoModel:info];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    //[(TJSBaseTableViewCell *)cell setDelegate:self.cellDelegate];
    
    [cell tjs_bindDataToCellWithValue:info];

    return cell;
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat cellHeight = 0;
    
    id model = [[self.interactor items] objectAtIndex:indexPath.row];

    id <TJSMyOrderListCellLayoutConfig >layoutConfig = [TJSMyOrderListCellLayoutConfig sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:model cellWidth:SCREEN_WIDTH].height;
    
    return cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //TJSBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [UIViewController tjs_pushViewController:ProductDetailVC params:@{} animated:YES];
}

@end
