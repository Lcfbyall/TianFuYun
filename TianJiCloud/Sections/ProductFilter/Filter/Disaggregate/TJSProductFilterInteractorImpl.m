//
//  TJSProductFilterInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterInteractorImpl.h"

@implementation TJSProductFilterInteractorImpl


#pragma mark - <TJSProductFilterInteractor>

- (NSArray *)items{
  
    return self.dataSource.items;
}


#pragma mark - <ProductFilterLayoutDelegate>

- (void)onRefresh{
  
    [self.layout reloadCollect];
    
    //结束刷新
    [self.layout endRefresh];
}


@end
