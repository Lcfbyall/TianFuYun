//
//  ProductFilterResultInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterResultInteractorImpl.h"

@interface ProductFilterResultInteractorImpl ()

@end

@implementation ProductFilterResultInteractorImpl


#pragma mark - <>

- (NSArray *)items{
  
    return self.dataSource.items;
}

#pragma mark - <ProductFilterResultLayoutDelegate>

- (void)onRefresh{


}

@end
