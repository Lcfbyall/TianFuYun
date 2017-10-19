//
//  TJSBaseRequest.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface TJSBaseRequest : YTKRequest

#pragma mark - init

/**
 request初始化，默认的方式是使用字典，不需要传参直接使用init

 @param parame 请求的参数
 @return request
 */
- (id)initWithParame:(NSDictionary *)parame;





#pragma mark - Config

/**
 是否隐藏错误提示

 @return 默认为No,如果不需要提示，需在子类重写该方法,置为YES
 */
- (BOOL)isHidenErrorToast;


/**
 是否需要token参数

 @return 默认为YES,如果不需要，需在子类重写该方法，置为NO
 */
- (BOOL)isNeedParameToken;


/**
 是否需要弹出登录视图
 
 @return 默认为YES，如果不需要，需在子类重写该方法，置为NO
 */
- (BOOL)isNeedPresentLogin;



/**
 是否需要弹出请求非网络原因失败的提示

 @return 默认为YES，如果不需要，需在子类重写该方法，置为NO
 */
- (BOOL)isNeedAlertFailureMessage;

/**
 是否需要loading

 @return 默认为NO，如果需要loading，需在dataController中设置该属性为YES
 */

@property (nonatomic, assign,getter=isNeedLoading) BOOL needLoading;


@end






