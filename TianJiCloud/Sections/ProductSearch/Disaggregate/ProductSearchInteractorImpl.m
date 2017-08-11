//
//  ProductSearchInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductSearchInteractorImpl.h"



@implementation ProductSearchInteractorImpl


#pragma mark - <ProductSerachInteractor>

- (NSArray *)items{

   return  [self.dataSource items];
}

#pragma mark - <ProductSearchLayoutDelegate>

- (void)onRefresh{


}


@end
