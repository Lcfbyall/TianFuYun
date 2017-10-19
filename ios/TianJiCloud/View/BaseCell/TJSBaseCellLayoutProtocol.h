//
//  TJSBaseCellLayoutProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSBaseCellLayoutProtocol_h
#define TJSBaseCellLayoutProtocol_h


@protocol TJSBaseCellLayoutConfig <NSObject>

@optional

/**
 * @return 返回的内容大小
 */
- (CGSize)contentSize:(id)model cellWidth:(CGFloat)width;


/**
 *  需要构造的cellContent类名
 */
- (NSString *)cellContent:(id)model;


@end




#endif /* TJSBaseTableViewCellLayoutProtocol_h */
