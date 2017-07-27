//
//  TJSHomeListTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSHomeListTableAdapter.h"

#import "TJSProductInfoModel.h"
#import "ProductListCell.h"


//cell的配置就是产品的，不再是home的了
#import "TJSProductListCellFactory.h"
#import "TJSProductListCellLayoutConfig.h"

@interface TJSHomeListTableAdapter ()

@property (nonatomic,strong) TJSProductListCellFactory *cellFactory;

@end


@implementation TJSHomeListTableAdapter

- (instancetype)init{
    
    self = [super init];
    if(self){
      
        _cellFactory = [[TJSProductListCellFactory alloc]init];
        
    }
    return self;
}


#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    id<TJSHomeListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    id model = [[self.interactor items] objectAtIndex:indexPath.row];
    
    
    cell = [((TJSProductListCellFactory *)self.cellFactory)
            cellInTable:tableView
            forProductInfoModel:model];
    
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(ProductListCell *)cell setDelegate:self.cellDelegate];
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    id modelInArray    = [[self.interactor items] objectAtIndex:indexPath.row];
    TJSProductInfoModel *model = (TJSProductInfoModel *)modelInArray;
    
    id<TJSProductCellLayoutConfig> layoutConfig =[TJSProductListCellLayoutConfig  sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:model cellWidth:SCREEN_WIDTH].height;
    
    
    return cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}



@end
