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

- (UIColor *)weak_color_10 {
    
    return [UIColor tjs_colorWithHexString:self.colorDict[@"weak_color_10"]];
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
