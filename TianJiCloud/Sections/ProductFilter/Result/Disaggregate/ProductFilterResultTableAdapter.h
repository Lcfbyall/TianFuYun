//
//  ProductFilterResultTableAdapter.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductFilterResultConfigurateProtocol.h"

@interface ProductFilterResultTableAdapter : NSObject<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,weak) id<ProductFilterResultInteractor> interactor;

//@property (nonatomic,weak) id<TJSProductFilterResultCellDelegate> cellDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;



@end
