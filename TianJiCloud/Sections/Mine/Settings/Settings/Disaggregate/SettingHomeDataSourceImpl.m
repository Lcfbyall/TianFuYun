//
//  SettingHomeDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeDataSourceImpl.h"

#import "SettingHomeModel.h"


@interface SettingHomeDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation SettingHomeDataSourceImpl


#pragma mark - <SettingHomeDataSource>


- (NSArray *)items{
    
    if(_items==nil){
    
        NSArray *items = [SettingHomeModel configModels];
  
        _items = [NSMutableArray arrayWithArray:items];
    }
    
    return _items;
}

- (void)logout:(void (^)(id))block{

    if(block)block(nil);
}

- (void)uploadIcon:(UIImage *)icon block:(void (^)(id))block{

    if(block)block(@"imageUrl");
}

#pragma mark - Private




@end


@implementation SettingHomeOperateResult

@end



