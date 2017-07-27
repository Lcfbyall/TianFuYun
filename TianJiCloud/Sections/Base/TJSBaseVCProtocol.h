//
//  TJSBaseVCProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSBaseVCProtocol_h
#define TJSBaseVCProtocol_h



#pragma mark - BaseVCConfig
@protocol TJSBaseVCConfig <NSObject>

@optional

//1.1 子视图设置
- (void)tjs_configBaseView;

//1.2 网络加载
- (void)tjs_fetchData;

- (UIView *)tjs_listView;

@end

#pragma mark - NavigationConfig
@protocol TJSNavigationConfig <NSObject>

@optional

//1.是否隐藏导航栏
- (BOOL)tjs_hideNavigationBar;

//2.自定义返回按钮事件
- (void)tjs_unifyPopForMoreEvent;

//3.
- (NSArray <UIBarButtonItem *> *)tjs_leftBarButtonItems;

- (NSArray <UIBarButtonItem *> *)tjs_rightBarButtonItems;

//2.4
- (UIView *)tjs_titleView;

@end


#endif /* TJSBaseVCProtocol_h */





