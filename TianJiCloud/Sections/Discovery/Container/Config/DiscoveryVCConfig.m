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

@interface DiscoveryVCConfig ()

@property (nonatomic,weak) DiscoveryViewController *vc;


@end

@implementation DiscoveryVCConfig

- (void)setup:(DiscoveryViewController *)vc{

    _vc = vc;
}


#pragma mark - <TJSNavigationConfig>

- (UIView *)tjs_titleView{

    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"新闻资讯",@"路演视频"]];
    
    //segment.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)

    segment.selectedSegmentIndex = 0;
    segment.apportionsSegmentWidthsByContent = YES;
    segment.tintColor = [UIColor iOS7darkBlueColor];
    
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



