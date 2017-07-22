//
//  TJSBaseViewController.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UINavigationBar+StyleConfigure.h"
#import "TJSBaseVCProtocol.h"

@interface TJSBaseViewController : UIViewController <TJSBaseVCConfig,TJSNavigationConfig>

@end
