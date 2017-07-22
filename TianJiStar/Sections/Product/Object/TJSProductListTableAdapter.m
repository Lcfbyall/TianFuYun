//
//  TJSProductListTableAdapter.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListTableAdapter.h"

#import "TJSProductInfoModel.h"

#import "TJSProductListCellFactory.h"


@interface TJSProductListTableAdapter ()

@property (nonatomic,strong) TJSProductListCellFactory *cellFactory;

@end


@implementation TJSProductListTableAdapter

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
    
    id<TJSProductListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    UITableViewCell *cell = nil;
    
    id model = [[self.interactor items] objectAtIndex:indexPath.row];
    
    cell = [self.cellFactory cellInTable:tableView
                     forProductInfoModel:model];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(ProductListCell *)cell setDelegate:self.cellDelegate];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 60;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{


}


@end
