//
//  TJSMineHomeTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeTableAdapter.h"

#import "MineHomeBaseTableCell.h"
#import "TJSMineHomeCellFactory.h"
#import "TJSMineHomeCellLayoutConfig.h"

@interface TJSMineHomeTableAdapter ()

@property (nonatomic,strong) TJSMineHomeCellFactory *cellFactory;

@end


@implementation TJSMineHomeTableAdapter

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        _cellFactory = [[TJSMineHomeCellFactory alloc]init];
        
    }
    return self;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    id modelInArray    = [[self.interactor items] objectAtIndex:indexPath.section][indexPath.row];

    id<TJSMineHomeCellLayoutConfig> layoutConfig =[TJSMineHomeCellLayoutConfig  sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:modelInArray cellWidth:SCREEN_WIDTH].height;
    
    return cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
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
  
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
  
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
  
    return 10;
}


@end
