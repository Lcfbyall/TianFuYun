//
//  CumulateInvestHeader.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CumulativeInvestConfigurateProtocol.h"


@interface CumulateInvestHeader : UIView

+ (instancetype)header;

- (void)tjs_reloadTableHeader;

@property (nonatomic,weak) id<CumulativeInvestInteractor> interactor;


@end
