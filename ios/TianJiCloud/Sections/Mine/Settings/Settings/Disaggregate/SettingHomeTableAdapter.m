//
//  SettingHomeTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeTableAdapter.h"
#import "SettingHomeCellFactory.h"
#import "SettingHomeModel.h"
#import "SettingHomeHeader.h"


static NSString *const headerFooterIdentifier = @"SettingHomeListHeaderIdentifier";
@interface SettingHomeTableAdapter (){


}

@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,strong) SettingHomeHeader *header;

@property (nonatomic,strong)SettingHomeCellFactory *cellFactory;

@end

@implementation SettingHomeTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        _cellFactory = [[SettingHomeCellFactory alloc]init];
        
        [self setupTableView];
    }
    
    return self;
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.interactor.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [((NSArray *)[self.interactor.items objectAtIndex:section]) count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SettingHomeModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    TJSBaseTableViewCell *cell = (TJSBaseTableViewCell *)[_cellFactory cellInTable:tableView forMineInfoModel:model];
    
    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
}


#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    SettingHomeModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    CGFloat height =  [_cellFactory cellHeight:model cellWidth:SCREEN_WIDTH];
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SettingHomeModel *model = [((NSArray *)[self.interactor.items objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    
    if(model.cellOperation) model.cellOperation(nil, nil);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return section?10:0.001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    header.contentView.backgroundColor = ThemeService.weak_color_00;
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
  
    return 0.001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
  
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
    header.contentView.backgroundColor = ThemeService.origin_color_00;
    
    return header;
}


#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self.header scrollViewDidScroll:scrollView];
    
}


#pragma mark - Private

- (void)setupTableView{
    
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
    _tableView.backgroundColor = ThemeService.weak_color_00;
    
    [self configHeader];
    
    [self configFooter];
}

- (void)configHeader{
    
    WEAK_SELF(self);
    _header = [SettingHomeHeader headerWithUpload:^(id sender) {
        STRONG_SELF(self);
        [self.interactor presentImageAcitonSheet:^(id value) {
         
            [self updateHeaderWithImage:(UIImage *)value];
            [self.interactor uploadIcon:value block:^(id result) {
                
            }];
        }];
    }];
    
    _tableView.contentInset = UIEdgeInsetsMake(_header.tjs_height, 0, 0, 0);
    [_tableView addSubview:_header];
    
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    tableHeaderView.backgroundColor = ThemeService.origin_color_00;
    _tableView.tableHeaderView = tableHeaderView;
    
    [self updateHeaderWithImage:IMAGE(@"avatar")];
}

- (void)updateHeaderWithImage:(UIImage *)image{
    
    [self.header tjs_bindDataWithValue:@[image,@"朱鹏",@YES]];
    
}

- (void)configFooter{
    
    UIView *tableFooterView = [UIButton tjs_logoutBtnForTBFooterWithTitle:@"安全退出"
          blockForControl:^(id sender) {
              [self.interactor logout:^(id result) {
                  
              }];
          }];
    
    _tableView.tableFooterView = tableFooterView;
    
}


@end

