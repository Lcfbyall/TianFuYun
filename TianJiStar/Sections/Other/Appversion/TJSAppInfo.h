//
//  TJSAppInfo.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJSAppInfo : NSObject

@property (nonatomic, assign) NSInteger  appinfoId;            //
@property (nonatomic, assign) NSInteger  clientType;           //客户端类型 1安卓 2IOS
@property (nonatomic,copy)    NSString   *lastTimeVersionsNo;  //上次发布版本号
@property (nonatomic,copy)    NSString   *newsVersionsNo;      //最新版本号
@property (nonatomic,assign)  NSInteger  buildNo;              //build号
@property (nonatomic, assign) NSInteger  ifPush;               //是否推送消息 （1发送推送、0不发送）
@property (nonatomic,copy)    NSString   *introductions;       //更新说明
@property (nonatomic,assign)  NSInteger  upgradeType;          //更新类型 （1强制更新、2允许忽略更新）
@property (nonatomic,copy)    NSString   *url;                 //安装包url


@end
