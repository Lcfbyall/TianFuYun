//
//  MyFavListTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyFavListTableAdapter.h"

#import "TJSProductInfoModel.h"
#import "ProductListCell.h"

#import "TJSProductListCellFactory.h"
#import "TJSProductListCellLayoutConfig.h"

@interface MyFavListTableAdapter ()

@property (nonatomic,strong) TJSProductListCellFactory *cellFactory;

@end

@implementation MyFavListTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
    
        _cellFactory = [[TJSProductListCellFactory alloc]init];
        
    }
    
    return self;
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    id<MyFavListInteractor> interactor = self.interactor;
    
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


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    id modelInArray    = [[self.interactor items] objectAtIndex:indexPath.row];
    TJSProductInfoModel *model = (TJSProductInfoModel *)modelInArray;
    
    id<TJSProductCellLayoutConfig> layoutConfig =[TJSProductListCellLayoutConfig  sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:model cellWidth:SCREEN_WIDTH].height;
    
    return cellHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    ProductListCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
    TJSProductInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.row];
    
    if([cell.delegate conformsToProtocol:@protocol(TJSBaseTableViewCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
        
        [cell.delegate onTapCell:model];
    }
    
}






@end



