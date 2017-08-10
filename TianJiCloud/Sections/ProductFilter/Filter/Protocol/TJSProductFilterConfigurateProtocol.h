//
//  TJSProductFilterConfigurateProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductFilterConfigurateProtocol_h
#define TJSProductFilterConfigurateProtocol_h


@protocol TJSProductFilterInteractorDelegate <NSObject>

@optional


@end

@protocol TJSProductFilterInteractor

@required

//数据

- (NSArray *)items;

- (NSArray *)filterParamas;

//交互

- (void)resetFilterParamas;



@end


#endif /* TJSProductFilterConfigurateProtocol_h */
