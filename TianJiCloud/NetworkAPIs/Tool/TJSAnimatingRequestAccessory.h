//
//  TJSAnimatingRequestAccessory.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKBaseRequest.h"
#import "YTKBatchRequest.h"
#import "YTKChainRequest.h"

@interface TJSAnimatingRequestAccessory : NSObject <YTKRequestAccessory>

@property(nonatomic, weak) UIView *animatingView;

@property(nonatomic, strong) NSString *animatingText;

- (id)initWithAnimatingView:(UIView *)animatingView;

- (id)initWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

+ (id)accessoryWithAnimatingView:(UIView *)animatingView;

+ (id)accessoryWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

@end

/**
 *  request add loading，通过设置animatingView、animatingText属性
 */

#pragma mark - YTKBaseRequest

@interface YTKBaseRequest (AnimatingAccessory)

@property (weak, nonatomic) UIView *animatingView;

@property (strong, nonatomic) NSString *animatingText;

@end

#pragma mark - YTKBatchRequest

@interface YTKBatchRequest (AnimatingAccessory)

@property (weak, nonatomic) UIView *animatingView;

@property (strong, nonatomic) NSString *animatingText;

@end

#pragma mark - YTKChainRequest

@interface YTKChainRequest (AnimatingAccessory)

@property (weak, nonatomic) UIView *animatingView;

@property (strong, nonatomic) NSString *animatingText;

@end
