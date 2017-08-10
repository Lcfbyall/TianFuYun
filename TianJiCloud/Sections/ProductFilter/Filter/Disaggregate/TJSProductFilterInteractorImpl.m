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

- (NSArray *)filterParamas{
  
    return [self.dataSource filterParamas];
}

- (void)resetFilterParamas{
  
    [self.dataSource resetFilterParamas];
    
    [self.layout reloadCollect];
}


#pragma mark - <ProductFilterLayoutDelegate>

- (void)onRefresh{
  
    [self.layout reloadCollect];
    
    //结束刷新
    [self.layout endRefresh];
}


@end
