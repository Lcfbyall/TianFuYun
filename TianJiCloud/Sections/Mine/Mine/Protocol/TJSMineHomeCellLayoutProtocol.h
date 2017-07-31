//
//  TJSMineHomeCellLayoutProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMineHomeCellLayoutProtocol_h
#define TJSMineHomeCellLayoutProtocol_h

@protocol TJSMineHomeCellLayoutConfig <NSObject>

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


#endif /* TJSMineHomeCellLayoutProtocol_h */
