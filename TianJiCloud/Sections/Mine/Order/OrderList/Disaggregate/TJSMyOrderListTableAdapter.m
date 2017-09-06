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

static NSString *const headerFooterIdentifier = @"TJSMyOrderListFooterIdentifier";

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

- (void)setInteractor:(id<TJSMyOrderListInteractor>)interactor{
 
    _interactor = interactor;
    
    [self setupTableView];
}

#pragma mark - Private

- (void)setupTableView{
  
    
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    id<TJSMyOrderListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TJSBaseTableViewCell *cell = nil;
    
    MyOrderInfoModel * info = [[self.interactor items] objectAtIndex:indexPath.section];
    
    cell = [((TJSMyOrderListCellFactory *)self.cellFactory)
            cellInTable:tableView forOrderInfoModel:info];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    //[(TJSBaseTableViewCell *)cell setDelegate:self.cellDelegate];
    
    [(TJSBaseTableViewCell *)cell tjs_bindDataToCellWithValue:info];

    return cell;
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat cellHeight = 0;
    
    id model = [[self.interactor items] objectAtIndex:indexPath.section];

    id <TJSMyOrderListCellLayoutConfig >layoutConfig = [TJSMyOrderListCellLayoutConfig sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:model cellWidth:SCREEN_WIDTH].height;
    
    return cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //id model = [[self.interactor items] objectAtIndex:indexPath.section];
    
    [UIViewController tjs_pushViewController:ProductDetailVC params:@{@"webUrl":@"http://wandou.im/1ig5qp"} animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    header.contentView.backgroundColor = ThemeService.weak_color_00;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section?16:0;
}

@end
