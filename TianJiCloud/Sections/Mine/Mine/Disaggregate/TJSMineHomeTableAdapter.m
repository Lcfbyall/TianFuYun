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

@interface TJSMineHomeTableAdapter (){

    CGFloat _headerHeight;
}

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

    //
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];

    //
    _headerContainer = [MineHomeHeaderContainer headerContainer];
    //_tableView.tableHeaderView = _headerContainer;
    _headerContainer.tjs_origin = CGPointMake(0, -_headerContainer.tjs_height);
    _headerHeight = _headerContainer.tjs_height;
    _headerContainer.contentMode = UIViewContentModeScaleAspectFill;

    _tableView.contentInset = UIEdgeInsetsMake(_headerHeight, 0, 0, 0);
    [_tableView addSubview:_headerContainer];

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
    
   MineHomeCellInfo * info = [[self.interactor items] objectAtIndex:indexPath.section][indexPath.row];
    
    cell = [((TJSMineHomeCellFactory *)self.cellFactory)
            cellInTable:tableView forMineInfoModel:info];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(MineHomeBaseTableCell *)cell setDelegate:self.cellDelegate];
    
    [cell tjs_bindDataToCellWithValue:info];
    
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
    
    if([cell.delegate conformsToProtocol:@protocol(TJSMineHomeCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
    
        [cell.delegate onTapCell:cell.cellInfo];
    }

    if(cell.cellInfo.cellOperation){

        cell.cellInfo.cellOperation(nil, nil);
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
  
    return 1;
}


#pragma mark - <UITableViewDataSourcePrefetching>



#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
 
    [scrollView.tjs_viewController.view endEditing:YES];

    if(scrollView.contentOffset.y < -_headerHeight){

        CGRect frame = _headerContainer.frame;
        //frame.origin.x =
        frame.origin.y = scrollView.contentOffset.y;
        //frame.size.width =
        frame.size.height = -scrollView.contentOffset.y;

        _headerContainer.frame = frame;
    }

    /*
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 10;;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {

            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);

        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {

            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
     */



    UIColor * color = UIColorFromHEX(0x007cf4);
    CGFloat offset = scrollView.contentOffset.y;
    if (offset > -_headerHeight) {
        
        CGFloat alpha = MIN(1,fabs(offset+_headerHeight) / 64.0);

        scrollView.tjs_viewController.navigationController.navigationBar.barTintColor = [UIColor redColor];


    } else {
        
        scrollView.tjs_viewController.navigationController.navigationBar.barTintColor = [color colorWithAlphaComponent:1];
    }

}


@end
