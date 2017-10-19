//
//  FeedBackVCConfig.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITextView+PlaceHolder.h"
#import "UITextView+LengthLimited.h"
#import "UIButton+CommitStyle.h"


@class FeedbackViewController;

#import "FeedBackVCProtocol.h"

@interface FeedBackVCConfig : NSObject<FeedBackVCConfig>

- (void)setup:(FeedbackViewController *)vc;

@end
