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

- (NSArray *)items{

    id<TJSMineHomeDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];
}

- (NSArray *)headerDatas{
  
    return self.dataSource.headerDatas;
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


}

@end
