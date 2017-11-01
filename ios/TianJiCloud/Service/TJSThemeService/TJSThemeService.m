//
//  TJSThemeService.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSThemeService.h"
#import "UIColor+HEX.h"

@interface TJSThemeService ()

@property (nonatomic,strong) NSDictionary *colorDict;

@end

@implementation TJSThemeService


+ (instancetype)sharedInstance {
    
    static TJSThemeService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        instance.colorDict = [self p_getThemeConfigure:@"TJSThemeConfig"];
    });
    return instance;
}


- (void)changeThemeStyleWithFileName:(NSString *)fileName {
    
    [TJSThemeService sharedInstance].colorDict = [TJSThemeService p_getThemeConfigure:fileName];
}

+ (NSDictionary *)p_getThemeConfigure:(NSString *)fileName {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"strings"];
    
    NSDictionary *map = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    
    return map;
}



#pragma mark - Color

- (UIColor *)origin_color_00{

    return [UIColor tjs_colorWithHexString:self.colorDict[@"origin_color_00"]];
}

- (UIColor *)origin_color_01{

    return [UIColor tjs_colorWithHexString:self.colorDict[@"origin_color_01"]];
}

//
- (UIColor *)main_color_00{

  return [UIColor tjs_colorWithHexString:self.colorDict[@"main_color_00"]];
}

- (UIColor *)main_color_01{

  return [UIColor tjs_colorWithHexString:self.colorDict[@"main_color_01"]];
}

- (UIColor *)main_color_02{
 
    return [UIColor tjs_colorWithHexString:self.colorDict[@"main_color_02"]];
}
- (UIColor *)main_color_03{

     return [UIColor tjs_colorWithHexString:self.colorDict[@"main_color_03"]];
}

- (UIColor *)main_color_04{

    return [UIColor clearColor];
}

- (UIColor *)main_color_05{
  
    return [UIColor tjs_colorWithHexString:self.colorDict[@"main_color_05"]];
}


//文字
- (UIColor *)text_color_00{
   return [UIColor tjs_colorWithHexString:self.colorDict[@"text_color_00"]];
}
- (UIColor *)text_color_01{
   return [UIColor tjs_colorWithHexString:self.colorDict[@"text_color_01"]];
}
- (UIColor *)text_color_02{
   return [UIColor tjs_colorWithHexString:self.colorDict[@"text_color_02"]];
}

- (UIColor *)text_color_03{

  return [UIColor tjs_colorWithHexString:self.colorDict[@"text_color_03"]];
}

//按钮
// 提交按钮
// 按钮正常时的背景颜色
- (UIColor *)btn_color_00{
   return [UIColor tjs_colorWithHexString:self.colorDict[@"btn_color_00"]];
}
// 按钮高亮时的背景颜色
- (UIColor *)btn_color_01{
  return [UIColor tjs_colorWithHexString:self.colorDict[@"btn_color_01"]];
}
// 按钮禁用背景颜色
- (UIColor *)btn_color_02{
  return [UIColor tjs_colorWithHexString:self.colorDict[@"btn_color_02"]];
}
// 按钮正常文字颜色
- (UIColor *)btn_color_03{
  return [UIColor tjs_colorWithHexString:self.colorDict[@"btn_color_03"]];
}
// 按钮高亮文字颜色
- (UIColor *)btn_color_04{
  return [UIColor tjs_colorWithHexString:self.colorDict[@"btn_color_04"]];
}
// 按钮禁用文字颜色
- (UIColor *)btn_color_05{
  return [UIColor tjs_colorWithHexString:self.colorDict[@"btn_color_05"]];
}


//
- (UIColor *)weak_color_00 {
    
    return [UIColor tjs_colorWithHexString:self.colorDict[@"weak_color_00"]];
}

- (UIColor *)weak_color_01 {

    return [UIColor tjs_colorWithHexString:self.colorDict[@"weak_color_01"]];
}

- (UIColor *)weak_color_02 {
    
    return [UIColor tjs_colorWithHexString:self.colorDict[@"weak_color_02"]];
}

- (UIColor *)weak_color_03 {
    
    return [UIColor tjs_colorWithHexString:self.colorDict[@"weak_color_03"]];
}

- (UIColor *)weak_color_04 {
    
    return [UIColor tjs_colorWithHexString:self.colorDict[@"weak_color_04"]];
}


#pragma mark - Font
- (UIFont *)pingFangSCLightWithSize:(CGFloat)size {
    return [UIFont fontWithName:self.colorDict[@"light_font"] size:size] ? : [UIFont fontWithName:@".HelveticaNeueInterface-Light" size:size];
}

- (UIFont *)pingFangSCMediumWithSize:(CGFloat)size {
    return [UIFont fontWithName:self.colorDict[@"medium_font"] size:size] ? : [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

- (UIFont *)pingFangSCRegularWithSize:(CGFloat)size {
    return [UIFont fontWithName:self.colorDict[@"regular_font"] size:size] ? : [UIFont fontWithName:@".HelveticaNeueInterface-Regular" size:size];
}

- (UIFont *)pingFangSCSemiboldWithSize:(CGFloat)size {
    return [UIFont fontWithName:self.colorDict[@"semibold_font"] size:size] ? : [UIFont fontWithName:@".HelveticaNeueInterface-MediumP4" size:size];
}

- (UIFont *)pingFangSCThinWithSize:(CGFloat)size {
    return [UIFont fontWithName:self.colorDict[@"thin_font"] size:size] ? : [UIFont fontWithName:@".HelveticaNeueInterface-Thin" size:size];
}

- (UIFont *)pingFangSCUltralightWithSize:(CGFloat)size {
    return [UIFont fontWithName:self.colorDict[@"ultralight_font"] size:size] ? : [UIFont fontWithName:@".HelveticaNeueInterface-UltraLightP2" size:size];
}


@end