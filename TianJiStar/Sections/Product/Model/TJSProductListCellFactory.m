//
//  TJSProductListCellFactory.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListCellFactory.h"


@interface TJSProductListCellFactory ()


@end


@implementation TJSProductListCellFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)dealloc
{
    
}



- (ProductListCell *)cellInTable:(UITableView *)tableView
             forProductInfoModel:(TJSProductInfoModel *)model{

    
    static NSString *_identifier = @"qqq";
    
    ProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {

        
        NSString *nibName = NSStringFromClass([ProductListCell class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:nil];
        
        if(nib){
            
            [tableView registerNib:nib forCellReuseIdentifier:_identifier];
        }else{
        
            [tableView registerClass:[ProductListCell class] forCellReuseIdentifier:_identifier];
        }
        
        
        cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    }
    
    return cell;
}


@end
