//
//  CumulateInvestInfoModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulateInvestInfoModel.h"

@implementation CumulateInvestInfoModel

+ (NSArray <CumulateInvestInfoModel *> *)configWithInvestInfos:(NSArray <CumulateInvestInfo*>*)investInfos{
 
    NSMutableArray *models = [NSMutableArray array];
    [investInfos enumerateObjectsUsingBlock:^(CumulateInvestInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CumulateInvestInfoModel *model = [CumulateInvestInfoModel new];
        model.info = obj;
        model.cellClass = @"CumulativeInvestDefaultCell";
        model.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        model.selectionStyle = UITableViewCellSelectionStyleDefault;
        model.cellBgColor = idx%2!=0?ThemeService.origin_color_00:ThemeService.weak_color_04;
        model.cellSelectedColor = ThemeService.origin_color_00;
        model.textColor = ThemeService.text_color_01;
        model.highlightedTextColor = ThemeService.text_color_02;
        model.detailTextColor = ThemeService.text_color_01;
        model.highlightedDetailTextColor = ThemeService.text_color_02;
        model.text = obj.name;
        model.detailText = obj.sum;
        model.target = InvestProductVC;
        model.targetParams = @{@"CumulateInvestInfo":obj};
        WEAK_SELF(model);
        model.cellOperation = ^(id obj1, id obj2) {
            STRONG_SELF(model);
            [UIViewController tjs_pushViewController:model.target params:model.targetParams animated:YES];
        };
        [models addObject:model];
    }];
    
    return models;
}

@end
