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

@protocol TJSProductCellLayoutConfig <NSObject>

@optional

/**
 * @return 返回message的内容大小
 */
- (CGSize)contentSize:(TJSProductInfoModel *)model cellWidth:(CGFloat)width;

/**
 *  需要构造的cellContent类名
 */
- (NSString *)cellContent:(TJSProductInfoModel *)model;

@end


#endif /* TJSProductCellLayoutProtocol_h */
