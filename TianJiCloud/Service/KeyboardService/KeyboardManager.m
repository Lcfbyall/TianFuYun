//
//  KeyboardManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "KeyboardManager.h"
#import "IQKeyboardManager.h"


@implementation KeyboardManager

+ (void)load{
    
    [self IQKeyboardManagersettings];
}

//IQKeyboardManager
+ (void)IQKeyboardManagersettings
{
    //关闭设置为NO, 默认值为NO.
    [IQKeyboardManager sharedManager].enable = YES;
    //如果产品需要当键盘弹起时，点击背景收起键盘，也是一行代码解决。
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    //而当产品需要支持内联编辑(Inline Editing), 这就需要隐藏键盘上的工具条(默认打开)
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    
    
    //如果当某一个输入框特定不需要键盘上的工具条时，一行代码
    //textField.inputAccessoryView = [[UIView alloc] init];
    //如果因为不知名的原因需要在某个页面禁止自动键盘处理事件相应，也很 简单。
    //- (void) viewWillAppear: (BOOL)animated {
    //打开键盘事件相应
    // [IQKeyboardManager sharedManager].enable = YES;
    //}
    //- (void)viewWillDisappear:(BOOL)animated {
    //关闭键盘事件相应
    //[IQKeyboardManager sharedManager].enable = NO;
    //}
    
    /*
    点击旁边的空白处收起键盘;这里是控制单个页面，上面的是全局的
    - (void)viewDidLoad {
        [super viewDidLoad];
        
        [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    }
     */
    
    
    /*
    常用的属性
    
    输入框到键盘的距离，默认是10px。修改的话，等号后面的值自己定，但是10感觉最合适了， 根据个人习惯吧。。。
    
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 0.0f;
    防止上滑过渡，离得太远；
    
    [IQKeyboardManager sharedManager].preventShowingBottomBlankSpace = NO;
  
     */
    
    
}

@end