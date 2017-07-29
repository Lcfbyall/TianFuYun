//
//  ProductListVCProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductListVCProtocol_h
#define TJSProductListVCProtocol_h

@protocol ProductListVCConfig <NSObject>

- (void)onTapRightBarBtnToProductSearch:(id)sender;

- (void)onTapSearchBarToProductSearch:(id)sender;


@end


#endif /* TJSProductListVCProtocol_h */
