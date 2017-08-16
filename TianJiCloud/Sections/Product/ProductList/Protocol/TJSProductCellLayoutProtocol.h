//
//  TJSProductCellConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductCellLayoutProtocol_h
#define TJSProductCellLayoutProtocol_h

#import <UIKit/UIKit.h>

@class TJSProductInfoModel;

@protocol TJSProductCellLayoutConfig <TJSBaseCellLayoutConfig>

@optional

- (NSArray *)allCells;


@end


#endif /* TJSProductCellLayoutProtocol_h */
