//
//  ContractAddAddressDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractAddAddressDataSourceImpl.h"
#import "AdressEditNetworkTool.h"
#import "ContractAddAddressCellModel.h"

@interface ContractAddAddressDataSourceImpl ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation ContractAddAddressDataSourceImpl


#pragma mark - <ContractAddAddressDataSource>

- (void)loadAddres:(void (^)(id, NSError *))callback{

    if(_items==nil){
        
      _items = [[ContractAddAddressCellModel configModelsWithAddress:nil] mutableCopy];
    }
    
    if(callback)callback(_items,nil);

}

- (void)saveAddress:(void (^)(id, NSError *))callback{

    [AdressEditNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
        
        
    } failCallback:^(id _Nullable error) {
        
        
    }];
    
    if(callback)callback(nil,nil);

}

- (NSArray *)items{
    
    return _items;
}

//
- (NSArray *)regions{

    NSArray *const regions = @[
                             @"北京市",
                             @"天津市",
                             @"河北省",
                             @"山西省",
                             @"内蒙古自治区",
                             @"辽宁省",
                             @"吉林省",
                             @"黑龙江省",
                             @"上海市",
                             @"江苏省",
                             @"浙江省",
                             @"安徽省",
                             @"福建省",
                             @"江西省",
                             
                             ];
    
    return regions;
}

- (void)fillingRegion:(NSString *)region{

    ContractAddAddressCellModel *regionM = [_items objectAtIndex:2];
    
    regionM.rightValue = region;
}

- (NSInteger)regionIndex{

    ContractAddAddressCellModel *regionM = [_items objectAtIndex:2];
    
    NSArray *regions = [self regions];

    if([regions containsObject:regionM.rightValue]){
        
         return  [regions indexOfObject:regionM.rightValue];
    }
    
    return 0;
}

- (BOOL)canCommit{

    return YES;
}


#pragma mark - Private




@end


@implementation ContractAddAddressOperateResult

@end



