//
//  AddressManageTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AddressManageTableAdapter.h"
#import "AddressManageCellFactory.h"

#import "AddressManageCellModel.h"

@interface AddressManageTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,strong)AddressManageCellFactory *cellFactory;

@end

@implementation AddressManageTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[AddressManageCellFactory alloc]init];
        
        [self setupTableView];
    }
    
    return self;
}


- (void)setupTableView{
    
    _tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
    
    _tableView.backgroundColor = ThemeService.weak_color_00;

    
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.interactor.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [((NSArray *)[self.interactor.items objectAtIndex:section]) count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressManageCellModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    return (UITableViewCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    AddressManageCellModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AddressManageCellModel *model = [self.interactor.items objectAtIndex:indexPath.row];
    
    if(model.cellOperation) model.cellOperation(nil, nil);
    
}

@end


