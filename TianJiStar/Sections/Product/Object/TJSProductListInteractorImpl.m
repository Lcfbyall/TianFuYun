//
//  TJSProductListInteractorImpl.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListInteractorImpl.h"

@interface TJSProductListInteractorImpl ()



@end

@implementation TJSProductListInteractorImpl



#pragma mark - <NIMSessionInteractor>

//数据接口
- (NSArray *)items{
    
    id<TJSProductListDataSource> dataSource = self.dataSource;

    return  [dataSource items];
}

@end
