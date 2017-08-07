//
//  TJSMyOrderListCellLayoutProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMyOrderListCellLayoutProtocol_h
#define TJSMyOrderListCellLayoutProtocol_h

@protocol TJSMyOrderListCellLayoutConfig <NSObject>

@optional

/**
 * @return 返回message的内容大小
 */
- (CGSize)contentSize:(id)model cellWidth:(CGFloat)width;


/**
 *  需要构造的cellContent类名
 */
- (NSString *)cellContent:(id)model;


@end


#endif /* TJSMyOrderListCellLayoutProtocol_h */
