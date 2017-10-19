//
//  TJSMineHomeInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeInteractorImpl.h"


@interface TJSMineHomeInteractorImpl ()


@end

@implementation TJSMineHomeInteractorImpl


#pragma mark - <TJSMineHomeInteractor>

- (void)loadDatas:(void (^)(void))callback{
  
    [self.dataSource loadDatas:^{
       
        if(callback)callback();
        
    }];
}

- (NSArray *)items{

    id<TJSMineHomeDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];
}

- (NSArray *)headerDatas{
  
    return self.dataSource.headerDatas;
}

- (UICollectionViewLayout *)headerLayout{
 
    return self.dataSource.headerLayout;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.layout scrollViewDidScroll:scrollView];
}

- (void)reloadTableHeader{
    
    [self.layout reloadTableHeader];
}

- (void)onViewWillAppear{

    
}

- (void)onViewDidDisappear{


}

- (void)hideOrShowMoney:(BOOL)hide{

    [self.dataSource hideOrShowMoney:hide callback:^{
        
        [self.layout reloadTable];
        [self.layout reloadTableHeader];
    }];
}


#pragma mark - TJSMineHomeLayoutDelegate

//下拉刷新
- (void)onRefresh{

    [self loadDatas:^{
        
        [self.layout reloadTable];
        [self.layout reloadTableHeader];
    }];
}

@end
