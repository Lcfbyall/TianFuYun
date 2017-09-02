//
//  TJSMineHomeConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSMineHomeConfigurateProtocol_h
#define TJSMineHomeConfigurateProtocol_h


@protocol TJSMineHomeInteractorDelegate <NSObject>

@optional

///

@end


@protocol TJSMineHomeInteractor <NSObject>

@optional

- (void)loadDatas:(void (^)(void))callback;

//
- (NSArray *)items;

- (NSArray *)headerDatas;

- (UICollectionViewLayout *)headerLayout;

- (void)reloadTableHeader;

- (void)onViewWillAppear;

- (void)onViewDidDisappear;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)hideOrShowMoney:(BOOL)hide;


@end




#endif /* TJSMineHomeConfigurateProtocol_h */
