//
//  AlternateIconManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/9/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AlternateIconManager.h"

@implementation AlternateIconManager


- (void)changeIcon:(NSString*)iconName{
    
    UIApplication *application = [UIApplication sharedApplication];
    //判断系统是否支持
    if(![UIApplication instancesRespondToSelector:@selector(supportsAlternateIcons)]){
        
        NSLog(@"not support AlternateIcons");
    }else{
        
        if ([application supportsAlternateIcons]){
            
            [application setAlternateIconName:iconName completionHandler:^(NSError * error)
             {
                 if (error) {
                     NSLog(@"set icon error: %@",error);
                 }
                 NSLog(@"The alternate icon's name is %@",iconName);
             }];
        }else{
            NSLog(@"not support AlternateIcons");
        }
    }
}


@end
