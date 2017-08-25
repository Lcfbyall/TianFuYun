//
//  DiscoveryVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryVCConfig.h"

#import "DiscoveryViewController.h"
#import "NSObject+Swizzle.h"
#import "UISegmentedControl+TJSCustomStyle.h"


@interface DiscoveryVCConfig ()

@property (nonatomic,weak) DiscoveryViewController *vc;


@end

@implementation DiscoveryVCConfig

- (void)setup:(DiscoveryViewController *)vc{

    _vc = vc;
}


#pragma mark - <TJSNavigationConfig>

- (UIView *)tjs_titleView{

    
    NSString *firstSegment = NSLocalizedString(@"discovery_title_newsInformation", @"新闻资讯");
    NSString *secondSegment = NSLocalizedString(@"discovery_title_roadShowVedio", @"路演视频");
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[firstSegment,secondSegment]];
    [segment tjs_customTitleViewConfig];
    
    [segment addBlockForControlEvents:UIControlEventValueChanged
                                block:^(id  _Nonnull sender) {
        if([self.vc conformsToProtocol:@protocol(DiscoveryVCConfig)] &&
           [self.vc respondsToSelector:@selector(onTapSegmental:)]){
            [self.vc onTapSegmental:sender];
        }
    }];
    
    return segment;
}



@end




