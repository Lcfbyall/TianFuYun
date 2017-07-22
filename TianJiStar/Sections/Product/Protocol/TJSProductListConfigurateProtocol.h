//
//  TJSProductListConfigurateProtocol.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductListConfigurateProtocol_h
#define TJSProductListConfigurateProtocol_h


@protocol TJSProductListInteractorDelegate <NSObject>

@optional

@end


@protocol TJSProductListInteractor <NSObject>

@optional

//网络接口


//界面操作接口


//数据接口
- (NSArray *)items;

//排版接口



//按钮响应接口



//页面状态同步接口


@end



#endif /* TJSProductListConfigurateProtocol_h */
