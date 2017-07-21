//
//  TJSSystemAlertMaker.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TJSSystemAlertMaker : NSObject

#define ALERT [[TJSSystemAlertMaker alloc] initWithStyle:UIAlertControllerStyleAlert]
#define ACTION_SHEET [[TJSSystemAlertMaker alloc] initWithStyle:UIAlertControllerStyleActionSheet]


NS_ASSUME_NONNULL_BEGIN

typedef void(^TJSSystemAlertActionBlock)(UIAlertAction *action);
typedef void(^TJSSystemAlertConfigurationBlock)(UITextField *textField);
typedef UIAlertController  * _Nonnull (^TJSSystemAlertShowBlock)();


- (instancetype)initWithStyle:(UIAlertControllerStyle)style;


//add what you want here
- (TJSSystemAlertMaker *(^)(NSString *))title;
- (TJSSystemAlertMaker *(^)(UIColor *))titleColor;
- (TJSSystemAlertMaker *(^)(NSString *))message;
- (TJSSystemAlertMaker *(^)(UIColor *))messageColor;
- (TJSSystemAlertMaker *(^)(NSTextAlignment))messageAlignment;
// 统一设置按钮样式 不写系统默认的蓝色
- (TJSSystemAlertMaker *(^)(UIColor *))actionUnifyColor;
- (TJSSystemAlertMaker *(^)(UIColor *))actionButtonColor;
- (TJSSystemAlertMaker *(^)(UIColor *))cancelButtonColor;
- (TJSSystemAlertMaker *(^)(NSString *, _Nullable TJSSystemAlertActionBlock))action;
- (TJSSystemAlertMaker *(^)(NSString *, _Nullable TJSSystemAlertActionBlock))cancelAction;
- (TJSSystemAlertMaker *(^)(TJSSystemAlertConfigurationBlock))textField;
- (TJSSystemAlertShowBlock)show;


NS_ASSUME_NONNULL_END


@end
