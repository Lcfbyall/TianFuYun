//
//  TJSBaseViewController.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "UINavigationBar+StyleConfigure.h"

@protocol TJSViewControllerHideNavigationBarDelegate <NSObject>
@optional
- (BOOL)tjs_hideNavigationBar;
@end



@protocol TJSViewControllerPopActionDelegate <NSObject>
@optional
- (void)tjs_unifyPopForMoreEvent;
@end


@protocol TJSBaseViewControllerDelegate <NSObject>
@optional
- (void)tjs_configBaseView;
- (void)tjs_fetchData;
@end


@interface TJSBaseViewController : UIViewController

@end
