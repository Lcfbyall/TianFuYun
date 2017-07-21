//
//  TJSLoginStateUtil.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSLoginStateUtil.h"

@implementation TJSLoginStateUtil

/**
 判断登录状态
 
 @return YES：已登录；No：未登录
 */
+ (BOOL)judgeLoginState{
  
    return YES;
}


/**
 重置登录状态为：未登录，回首页     退出登录 时可用
 */
+ (void)resetLoginStateAfterLogout{


}


/**
 重置登录状态为：未登录，但不回首页   token失效 时可用
 */
+ (void)resetLoginStateNotBackHome{



}

@end
