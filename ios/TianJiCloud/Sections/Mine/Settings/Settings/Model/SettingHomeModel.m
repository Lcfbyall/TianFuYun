//
//  SettingHomeModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeModel.h"

@implementation SettingHomeModel


+ (NSArray *)configModels{

    SettingHomeModel *profile = [SettingHomeModel new];
    profile.cellClass = @"SettingHomeDefaultCell";
    profile.image = @"user_data";
    profile.text = @"个人资料";
    profile.detailText = @"";
    profile.target = ProfileVC;
    profile.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    profile.selectionStyle = UITableViewCellSelectionStyleDefault;
    profile.cellOperation = ^(id obj1, id obj2) {
        
        [UIViewController tjs_pushViewController:ProfileVC animated:YES];
    };
    
    SettingHomeModel *logincode = [SettingHomeModel new];
    logincode.cellClass = @"SettingHomeDefaultCell";
    logincode.image = @"login_pwd";
    logincode.text = @"登录密码";
    logincode.detailText = @"";
    logincode.target = ProfileVC;
    logincode.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    logincode.selectionStyle = UITableViewCellSelectionStyleDefault;
    logincode.cellOperation = ^(id obj1, id obj2) {
        
        [UIViewController tjs_pushViewController:ModifyLogPasswordVC animated:YES];
    };

    SettingHomeModel *gesturecode = [SettingHomeModel new];
    gesturecode.cellClass = @"SettingHomeDefaultCell";
    gesturecode.image = @"gesture_pwd";
    gesturecode.text = @"手势密码";
    gesturecode.detailText = @"";
    gesturecode.target = ProfileVC;
    gesturecode.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    gesturecode.selectionStyle = UITableViewCellSelectionStyleDefault;
    gesturecode.cellOperation = ^(id obj1, id obj2) {
        
        [UIViewController tjs_pushViewController:GesturePasswordVC animated:YES];
    };
    
    
    SettingHomeModel *withdrawcode = [SettingHomeModel new];
    withdrawcode.cellClass = @"SettingHomeDefaultCell";
    withdrawcode.image = @"cash_pwd";
    withdrawcode.text = @"提现密码";
    withdrawcode.detailText = @"修改";
    withdrawcode.target = ProfileVC;
    withdrawcode.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    withdrawcode.selectionStyle = UITableViewCellSelectionStyleDefault;
    withdrawcode.cellOperation = ^(id obj1, id obj2) {
        
        [UIViewController tjs_pushViewController:FindWithDrawPasswordVC animated:YES];
    };
    
    
    SettingHomeModel *vertify = [SettingHomeModel new];
    vertify.cellClass = @"SettingHomeDefaultCell";
    vertify.image = @"job_icon";
    vertify.text = @"职业认证";
    vertify.detailText = @"已认证";
    vertify.target = ProfileVC;
    vertify.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    vertify.selectionStyle = UITableViewCellSelectionStyleDefault;
    vertify.cellOperation = ^(id obj1, id obj2) {
        
         [UIViewController tjs_pushViewController:ProfesisonAuthenVC animated:YES];
    };
    

    return @[@[profile],@[logincode,gesturecode,withdrawcode],@[vertify]];
}

@end
