//
//  SettingHomeInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeInteractorImpl.h"

@implementation SettingHomeInteractorImpl

#pragma mark - <SettingHomeInteractor>


- (NSArray *)items{
 
    return self.dataSource.items;
}


#pragma mark - <SettingHomeLayoutDelegate>

- (void)onRefresh{

    [self.layout reloadTable];
    
    [self.layout endRefresh];
}

@end
