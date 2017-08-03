//
//  TJSMineHomeTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeTableAdapter.h"

#import "MineHomeBaseTableCell.h"
#import "MineHomeHeaderContainer.h"


#import "TJSMineHomeCellFactory.h"
#import "TJSMineHomeCellLayoutConfig.h"

static NSString *const headerFooterIdentifier = @"MineHomeHeaderFooterIdentifier";

@interface TJSMineHomeTableAdapter ()

@property (nonatomic,strong) TJSMineHomeCellFactory *cellFactory;

@property (nonatomic,weak)  UITableView *tableView;

@property (nonatomic,strong)MineHomeHeaderContainer *headerContainer;

@end


@implementation TJSMineHomeTableAdapter


- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _cellFactory = [[TJSMineHomeCellFactory alloc]init];
        
        _tableView   = tableView;
        
        [self setupTableView];
    }
    return self;
}


#pragma mark - Private

- (void)setupTableView{

    _headerContainer = [MineHomeHeaderContainer headerContainer];

    _tableView.tableHeaderView = _headerContainer;
    
    //
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    id<TJSMineHomeInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    id<TJSMineHomeInteractor> interactor = self.interactor;
    
    return [[[interactor items] objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
   MineHomeBaseTableCell *cell = nil;
    
   id model    = [[self.interactor items] objectAtIndex:indexPath.section][indexPath.row];
    
    cell = [((TJSMineHomeCellFactory *)self.cellFactory)
            cellInTable:tableView forMineInfoModel:model];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(MineHomeBaseTableCell *)cell setDelegate:self.cellDelegate];
    
    return cell;
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    id modelInArray    = [[self.interactor items] objectAtIndex:indexPath.section][indexPath.row];

    id<TJSMineHomeCellLayoutConfig> layoutConfig =[TJSMineHomeCellLayoutConfig  sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:modelInArray cellWidth:SCREEN_WIDTH].height;
    
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MineHomeBaseTableCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
    id modelInArray    = [[self.interactor items] objectAtIndex:indexPath.section][indexPath.row];
    
    if([cell.delegate conformsToProtocol:@protocol(TJSMineHomeCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
    
        [cell.delegate onTapCell:modelInArray];
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  
    if(section ==0) return 1;
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
  
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
  
    return 0;
}


#pragma mark - <UITableViewDataSourcePrefetching>



#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
 
    [scrollView.tjs_viewController.view endEditing:YES];

    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > 50) {
        
        CGFloat alpha = MIN(1, 1 - ((50 + 64 - offsetY) / 64));
        
        //[scrollView.tjs_viewController.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        
        //[scrollView.tjs_viewController.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}


@end
