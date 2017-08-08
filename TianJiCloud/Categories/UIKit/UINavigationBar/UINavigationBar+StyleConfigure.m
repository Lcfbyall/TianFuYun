//
//  UINavigationBar+StyleConfigure.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UINavigationBar+StyleConfigure.h"
#import "UIImage+FromColor.h"

static UIColor *TitleColor   = nil;
static UIFont  *TitleFont    = nil;
static UIColor *BarTintColor = nil;
static UIColor *TintColor    = nil;

@interface UINavigationBar ()


@end

@implementation UINavigationBar (StyleConfigure)

+ (void)initialize{
  
    TitleColor   =  [UIColor blackColor];
    TitleFont    =  [UIFont systemFontOfSize:16.0f];
    BarTintColor =  ThemeService.main_color_00;
    TintColor    =  ThemeService.main_color_00;
}

/**
 项目默认效果
 */
- (void)setupStyleBasic{
    
    [self setupStyleBasicWithBarTintColor:ThemeService.main_color_00];
    
}

- (void)setupStyleBasicTranslucent{

    [self setupStyleWithTitleColor:TitleColor
                         titleFont:TitleFont
                      barTintColor:BarTintColor
                         tintColor:TintColor
                       translucent:YES];
}

- (void)setupStyleBasicWithBarTintColor:(UIColor *)barTintColor{
  
    [self setupStyleWithTitleColor:TitleColor
                         titleFont:TitleFont
                      barTintColor:barTintColor
                         tintColor:TintColor
                       translucent:NO];
}


- (void)setupStyleBasicTranslucentWithBarTintColor:(UIColor *)barTintColor{

    
    [self setupStyleWithTitleColor:TitleColor
                         titleFont:TitleFont
                      barTintColor:barTintColor
                         tintColor:TintColor
                       translucent:YES];
}

/////

- (void)setupStyleWithTitleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont
                    barTintColor:(UIColor *)barTintColor
                       tintColor:(UIColor *)tintColor
                     translucent:(BOOL)translucent{


    NSDictionary *titleTextAttributes =
  
      @{
        
        NSForegroundColorAttributeName:titleColor,
        NSFontAttributeName:titleFont
        
        };
    
    // 颜色text
    self.titleTextAttributes = titleTextAttributes;
    // 导航栏背景颜色
    self.barTintColor = barTintColor;
    //
    self.tintColor    = tintColor;
    
    // 透明度
    self.translucent  = translucent;
    
    [self clearBottomLine];
    
    [self clearShadow];

}





/**
 设置导航栏底部横线颜色
 
 @param color 横线颜色
 */
- (void)setBottomLineColor:(UIColor *)color{
    
    [self setBackgroundImage:[[UIImage alloc] init]
              forBarPosition:UIBarPositionAny
                  barMetrics:UIBarMetricsDefault];
    
    [self setShadowImage:[UIImage tjs_imageWithColor:color size:CGSizeMake(1.f, 0.5f)]];
    
}


/**
 清除导航栏底部横线
 */
- (void)clearBottomLine {
    
    [self setBackgroundImage:[UIImage tjs_imageWithColor:[UIColor clearColor]]
              forBarPosition:UIBarPositionAny
                  barMetrics:UIBarMetricsDefault];
    
    [self setShadowImage:[UIImage new]];
}

/**
 清除导航栏底部阴影
 */
- (void)clearShadow {
    self.layer.shadowColor = [UIColor clearColor].CGColor;
    self.layer.shadowRadius = 0.f;
    self.layer.shadowOffset = CGSizeMake(0.f, 0.f);
    self.layer.shadowOpacity = 1.f;
}


-(void)changeNavigationBarBackgroundColor{
    
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
        
        NSArray *subviews =self.subviews;
        for (id viewObj in subviews) {
        
            NSString *classStr = [NSString stringWithUTF8String:object_getClassName(viewObj)];
            
            if ([classStr isEqualToString:@"UIView"]) {
                
                UIImageView *imageView=(UIImageView *)viewObj;
                [self sendSubviewToBack:imageView];
            }
            
        }
    }
}

@end
