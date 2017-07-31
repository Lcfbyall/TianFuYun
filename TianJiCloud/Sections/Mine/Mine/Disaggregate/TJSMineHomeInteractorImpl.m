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

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        
        
    }
    
    return self;
}


#pragma mark - <TJSMineHomeInteractor>

- (NSArray *)items{

    id<TJSMineHomeDataSource> dataSource = self.dataSource;
    
    return  [dataSource items];
}


#pragma mark - TJSMineHomeLayoutDelegate
//下拉刷新
- (void)onRefresh{


}

@end
