//
//  TJSBaseCellContentConfigProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/11.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSBaseCellContentConfigProtocol_h
#define TJSBaseCellContentConfigProtocol_h

@protocol TJSBaseCellContentConfig <NSObject>


@optional

- (CGSize)contentSize:(CGFloat)cellWidth model:(id)model;

- (NSString *)cellContent:(id)model;

- (id<TJSBaseCellContentConfig>)configBy:(id)model;


@end


#endif /* TJSBaseCellContentConfigProtocol_h */
