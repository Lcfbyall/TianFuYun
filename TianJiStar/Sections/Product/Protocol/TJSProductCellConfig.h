//
//  TJSProductCellConfig.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/24.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductCellConfig_h
#define TJSProductCellConfig_h

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


#endif /* TJSProductCellConfig_h */
