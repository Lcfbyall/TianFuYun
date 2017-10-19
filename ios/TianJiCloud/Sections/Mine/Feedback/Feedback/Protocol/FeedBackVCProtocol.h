//
//  FeedBackVCProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef FeedBackVCProtocol_h
#define FeedBackVCProtocol_h

#import <UIKit/UIKit.h>

@protocol FeedBackVCConfig <NSObject>

- (void)textViewConfig:(UITextView *)textView;

- (void)commitButtonConfig:(UIButton *)btn;

@end


#endif /* FeedBackVCProtocol_h */
