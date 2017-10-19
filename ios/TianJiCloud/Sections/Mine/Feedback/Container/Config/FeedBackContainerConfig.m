//
//  FeedBackContainerConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FeedBackContainerConfig.h"
#import "FeedbackContainerController.h"
#import "UISegmentedControl+TJSCustomStyle.h"



@interface FeedBackContainerConfig ()

@property (nonatomic,weak) FeedbackContainerController *vc;

@end

@implementation FeedBackContainerConfig


- (void)setup:(FeedbackContainerController *)vc{
  
    _vc = vc;
    
}



#pragma mark - <TJSNavigationConfig>

- (UIView *)tjs_titleView{
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"反馈问题",@"历史问题"]];
    
    [segment tjs_customTitleViewConfig];
    
    [segment addBlockForControlEvents:UIControlEventValueChanged
                                block:^(id  _Nonnull sender) {
                                    
        if([self.vc conformsToProtocol:@protocol(FeedBackContainerConfig)] &&
           [self.vc respondsToSelector:@selector(onTapSegmental:)]){
            
            [self.vc onTapSegmental:sender];
        }
        
    }];
    
    return segment;
}



@end
