//
//  TJSProductListTableAdapter.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJSProductListConfigurateProtocol.h"
#import "TJSpRroductListCellProtocol.h"

@interface TJSProductListTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,weak) id<TJSProductListInteractor> interactor;

@property (nonatomic,weak) id<TJSProductListCellDelegate> cellDelegate;




@end
