//
//  ContractListDataSourceImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListDataSourceImpl.h"

@interface ContractListDataSourceImpl ()

@end

@implementation ContractListDataSourceImpl




#pragma mark - <ContractListDataSource>

- (void)loadContracts:(void (^)(NSArray *, NSError *))callback{

}

- (void)deleteContracts:(NSArray<ContractInfoModel *> *)products callback:(void (^)(BOOL, NSError *))callback{


}

- (void)deleteContract:(ContractInfoModel *)product callback:(void (^)(BOOL, NSError *))callback{


}

- (NSArray *)items{
 
    return @[@"",@"",@""];
}


@end
