//
//  UIButton+IBInspectableState.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIButton+IBInspectableState.h"
#import "UIButton+BackgroundColor.h"
#import "UIImage+ColorAtPixel.h"
#import <objc/runtime.h>
#import "NSObject+Swizzle.h"

#define objc_setObjRETAIN(key,value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
#define objc_getObj(key) objc_getAssociatedObject(self, key)

static NSString *const TJSUIButtonKeyPathEnabled     = @"enabled";
static NSString *const TJSUIButtonKeyPathSelected    = @"selected";
static NSString *const TJSUIButtonKeyPathHighlighted = @"highlighted";

static void * TJSUIButtonStateChangedContext = & TJSUIButtonStateChangedContext;

@interface UIButton ()

@property (nonatomic, strong) NSMutableDictionary <NSNumber *, UIFont *>*tjs_titleLabelFonts;
@property (nonatomic, strong) NSMutableDictionary <NSNumber *, UIColor *>*tjs_labelBorderColors;
@property (nonatomic, strong) NSMutableDictionary <NSNumber *, NSNumber *>*tjs_labelBorderWidths;
/**
 *  bool 是否添加状态的观察者
 */
@property (nonatomic, assign) BOOL tjs_isExcuteObserve;


@end

@implementation UIButton (IBInspectableState)

//一般情况下，类别里的方法会重写掉主类里相同命名的方法。如果有两个类别实现了相同命名的方法，只有一个方法会被调用。但 +load: 是个特例，当一个类被读到内存的时候， runtime 会给这个类及它的每一个类别都发送一个 +load: 消息。

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        /*
         tjs_ObjcSwizzleMethod([self class],
         @selector(setHighlighted:),
         @selector(hcb_setHighlighted:));
         
         tjs_ObjcSwizzleMethod([self class],
         @selector(setEnabled:),
         @selector(hcb_setEnabled:));
         
         tjs_ObjcSwizzleMethod([self class],
         @selector(setSelected:),
         @selector(hcb_setSelected:));
         */
        
        tjs_swizzleInstanceMethod([self class],
                              NSSelectorFromString(@"dealloc"),
                              @selector(place_dealloc));
        
    });
}


- (void)place_dealloc{
    
    [self tjs_removeObserverForKeyPathstatus];
    
    [self place_dealloc];
}


#pragma mark backGroundColor for state
- (UIColor *)tjs_backGroundColorNormal{
    
    return [self tjs_backGroundColorForState:UIControlStateNormal];
}
- (void)setTjs_backGroundColorNormal:(UIColor *)tjs_backGroundColorNormal{
    
    self.backgroundColor = tjs_backGroundColorNormal;
    
    [self tjs_setBackGroundColor:tjs_backGroundColorNormal forState:UIControlStateNormal];
}
- (UIColor *)tjs_backGroundColorDisabled {
    
    return [self tjs_backGroundColorForState:UIControlStateDisabled];
}
- (void)setTjs_backGroundColorDisabled:(UIColor *)tjs_backGroundColorDisabled{
    
    [self tjs_setBackGroundColor:tjs_backGroundColorDisabled forState:UIControlStateDisabled];
}
- (UIColor *)tjs_backGroundColorHighlighted{
    
    return [self tjs_backGroundColorForState:UIControlStateHighlighted];
}
- (void)setTjs_backGroundColorHighlighted:(UIColor *)tjs_backGroundColorHighlighted{
    
    [self tjs_setBackGroundColor:tjs_backGroundColorHighlighted forState:UIControlStateHighlighted];
}
- (UIColor *)tjs_backGroundColorSelected{
    
    
    return [self tjs_backGroundColorForState:UIControlStateSelected];
}
- (void)setTjs_backGroundColorSelected:(UIColor *)tjs_backGroundColorSelected{
    
    [self tjs_setBackGroundColor:tjs_backGroundColorSelected forState:UIControlStateSelected];
}
#pragma mark titleColor for state
- (UIColor *)tjs_titleColorNormal{
    return [self tjs_titleColorForState:UIControlStateNormal];
}
- (void)setTjs_titleColorNormal:(UIColor *)tjs_titleColorNormal{
    
    [self tjs_setTitleColor:tjs_titleColorNormal forState:UIControlStateNormal];
}
- (UIColor *)tjs_titleColorDisabled{
    return [self tjs_titleColorForState:UIControlStateDisabled];
}
- (void)setTjs_titleColorDisabled:(UIColor *)tjs_titleColorDisabled{
    [self setTitleColor:tjs_titleColorDisabled forState:UIControlStateDisabled];
}
- (UIColor *)tjs_titleColorHighlighted{
    return [self tjs_titleColorForState:UIControlStateHighlighted];
}
- (void)setTjs_titleColorHighlighted:(UIColor *)tjs_titleColorHighlighted{
    [self tjs_setTitleColor:tjs_titleColorHighlighted forState:UIControlStateHighlighted];
}
- (UIColor *)tjs_titleColorSelected{
    return [self tjs_titleColorForState:UIControlStateSelected];
}
- (void)setTjs_titleColorSelected:(UIColor *)tjs_titleColorSelected{
    
    [self tjs_setTitleColor:tjs_titleColorSelected forState:UIControlStateSelected];
}
#pragma mark titleFont for state
- (UIFont *)tjs_titleFontNormal{
    
    return [self tjs_titleLabelFontForState:UIControlStateNormal];
}
- (void)setTjs_titleFontNormal:(UIFont *)tjs_titleFontNormal{
    
    [self tjs_setTitleLabelFont:tjs_titleFontNormal forState:UIControlStateNormal];
}
- (UIFont *)tjs_titleFontDisabled{
    return [self tjs_titleLabelFontForState:UIControlStateDisabled];
}
- (void)setTjs_titleFontDisabled:(UIFont *)tjs_titleFontDisabled{
    [self tjs_setTitleLabelFont:tjs_titleFontDisabled forState:UIControlStateDisabled];
}
- (UIFont *)tjs_titleFontHighlighted{
    return [self tjs_titleLabelFontForState:UIControlStateHighlighted];
}
- (void)setTjs_titleFontHighlighted:(UIFont *)tjs_titleFontHighlighted{
    [self tjs_setTitleLabelFont:tjs_titleFontHighlighted forState:UIControlStateHighlighted];
}
- (UIFont *)tjs_titleFontSelected{
    return [self tjs_titleLabelFontForState:UIControlStateSelected];
}
- (void)setTjs_titleFontSelected:(UIFont *)tjs_titleFontSelected{
    [self tjs_setTitleLabelFont:tjs_titleFontSelected forState:UIControlStateSelected];
}
#pragma mark title for state
- (NSString *)tjs_titleNormal{
    return  [self tjs_titleForState:UIControlStateNormal];
}
- (void)setTjs_titleNormal:(NSString *)tjs_ttitleNormal{
    [self tjs_setTitle:tjs_ttitleNormal forState:UIControlStateNormal];
}
- (NSString *)tjs_titleDisabled{
    return [self tjs_titleForState:UIControlStateDisabled];
}
- (void)setTjs_titleDisabled:(NSString *)titleDisabled{
    [self tjs_setTitle:titleDisabled forState:UIControlStateDisabled];
}
- (NSString *)tjs_titleHighlighted{
    
    return [self tjs_titleForState:UIControlStateHighlighted];
}
- (void)setTjs_titleHighlighted:(NSString *)titleHighlighted{
    [self tjs_setTitle:titleHighlighted forState:UIControlStateHighlighted];
}
- (NSString *)tjs_titleSelected{
    return [self tjs_titleForState:UIControlStateSelected];
}
- (void)setTjs_titleSelected:(NSString *)titleSelected{
    [self tjs_setTitle:titleSelected forState:UIControlStateSelected];
}


#pragma mark tjs_borderColor for state

- (UIColor *)tjs_borderColorNormal{
  
    return  [self tjs_borderColorForState:UIControlStateNormal];
}

- (void)setTjs_borderColorNormal:(UIColor *)tjs_borderColorNormal{
  
    [self tjs_setBorderColor:tjs_borderColorNormal forState:UIControlStateNormal];
    
}

- (UIColor *)tjs_borderColorDisabled{
  
    return [self tjs_borderColorForState:UIControlStateDisabled];
}

- (void)setTjs_borderColorDisabled:(UIColor *)tjs_borderColorDisabled{

    [self tjs_setBorderColor:tjs_borderColorDisabled forState:UIControlStateDisabled];
}

- (UIColor *)tjs_borderColorHighlighted{
   
    return [self tjs_borderColorForState:UIControlStateHighlighted];
}

- (void)setTjs_borderColorHighlighted:(UIColor *)tjs_borderColorHighlighted{
  
    [self tjs_setBorderColor:tjs_borderColorHighlighted forState:UIControlStateHighlighted];
}

- (UIColor *)tjs_borderColorSelected{
  
    return  [self tjs_borderColorForState:UIControlStateSelected];
}

- (void)setTjs_borderColorSelected:(UIColor *)tjs_borderColorSelected{

    [self tjs_setBorderColor:tjs_borderColorSelected forState:UIControlStateSelected];
}

#pragma mark tjs_borderWidth for state




#pragma mark tools
- (void)tjs_setBackGroundColor:(UIColor *)backGroundColor
                      forState:(UIControlState)state {
    
    [self setBackgroundColor:backGroundColor forState:state];
}
- (UIColor *)tjs_backGroundColorForState:(UIControlState)state {
    
    UIImage *backGroundImage= [self backgroundImageForState:state];
    return [backGroundImage tjs_colorAtPixel:CGPointZero];
}
- (void)tjs_setTitleColor:(UIColor *)titleColor
                 forState:(UIControlState)state {
    
    [self setTitleColor:titleColor forState:state];
}
- (UIColor *)tjs_titleColorForState:(UIControlState)state {
    
    return  [self titleColorForState:state];
}
- (void)tjs_setTitle:(NSString *)title
            forState:(UIControlState)state {
    
    [self setTitle:title forState:state];
}
- (NSString *)tjs_titleForState:(UIControlState)state {
    
    return  [self titleForState:state];
}

- (void)tjs_setTitleLabelFont:(UIFont *)titleLabelFont
                     forState:(UIControlState)state {
    
    if (titleLabelFont) {
        
        [self tjs_addObserverForKeyPathstate];
        [self.tjs_titleLabelFonts setObject:titleLabelFont forKey:@(state)];
    }
    
    if(self.state == state) {
        self.titleLabel.font = titleLabelFont;
    }
}
- (UIFont *)tjs_titleLabelFontForState:(UIControlState)state {
    
    UIFont *font = [self.tjs_titleLabelFonts objectForKey:@(state)];
    
    if (!font) {
        font = self.titleLabel.font;
    }
    return font;
}
- (void)tjs_setBorderColor:(UIColor *)borderColor
                  forState:(UIControlState)state {
    
    if (borderColor) {
        
        [self tjs_addObserverForKeyPathstate];
        [self.tjs_labelBorderColors setObject:borderColor forKey:@(state)];
    }
    
    if(self.state == state) {
        self.layer.borderColor = borderColor.CGColor;
    }
}
- (UIColor *)tjs_borderColorForState:(UIControlState)state {
    
    UIColor *color = [self.tjs_labelBorderColors objectForKey:@(state)];
    if (!color) {
        //The color of the layer's border. Defaults to opaque black
        // color = (__bridge id _Nullable)self.layer.borderColor;
        color = [UIColor clearColor];
    }
    return color;
}

- (void)tjs_setBorderWidth:(CGFloat)borderWidth
                  forState:(UIControlState)state{
    
    if(borderWidth>=0){
        
        [self tjs_addObserverForKeyPathstate];
        [self.tjs_labelBorderWidths setObject:@(borderWidth) forKey:@(state)];
        
        if(self.state == state){
            
            self.layer.borderWidth = borderWidth;
        }
    }
}
- (CGFloat)tjs_borderWidthForState:(UIControlState)state{
    
    NSNumber *widthNum = [self.tjs_labelBorderWidths objectForKey:@(state)];
    CGFloat width = 0;
    //Defaults to zero.
    if (!widthNum) {
        
        width = 0;
    }else{
        
        width = [widthNum doubleValue];
    }
    
    return width;
}


#pragma mark state发生改变  字体、边框要手动修改！！！
#pragma mark - KVO  监听手动设置text
- (void)tjs_addObserverForKeyPathstate{
    
    if(!self.tjs_isExcuteObserve){
        
        [self addObserver:self forKeyPath:TJSUIButtonKeyPathEnabled options:NSKeyValueObservingOptionNew context:TJSUIButtonStateChangedContext];
        [self addObserver:self forKeyPath:TJSUIButtonKeyPathSelected options:NSKeyValueObservingOptionNew context:TJSUIButtonStateChangedContext];
        [self addObserver:self forKeyPath:TJSUIButtonKeyPathHighlighted options:NSKeyValueObservingOptionNew context:TJSUIButtonStateChangedContext];
        
        self.tjs_isExcuteObserve = 1;
    }
}
- (void)tjs_removeObserverForKeyPathstatus{
    
    if(self.tjs_isExcuteObserve){
        
        [self removeObserver:self forKeyPath:TJSUIButtonKeyPathEnabled context:TJSUIButtonStateChangedContext];
        [self removeObserver:self forKeyPath:TJSUIButtonKeyPathSelected context:TJSUIButtonStateChangedContext];
        [self removeObserver:self forKeyPath:TJSUIButtonKeyPathHighlighted context:TJSUIButtonStateChangedContext];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if (object == self &&
        ([keyPath isEqualToString:TJSUIButtonKeyPathEnabled] || [keyPath isEqualToString:TJSUIButtonKeyPathSelected] || [keyPath isEqualToString:TJSUIButtonKeyPathHighlighted])
        && context==TJSUIButtonStateChangedContext) {
        
        
        [self tjs_updateButtonForgroundWhenStateChanged];
        
    } else {
        // Make sure to call the superclass's implementation in the else block in case it is also implementing KVO
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}
- (void)tjs_updateButtonForgroundWhenStateChanged{
    
    UIFont *fontForCurrent =  [self tjs_titleLabelFontForState:self.state];
    if(fontForCurrent){
        [self tjs_setTitleLabelFont:fontForCurrent forState:self.state];
    }
    
    UIColor *borderColorForCurrent = [self tjs_borderColorForState:self.state];
    if(borderColorForCurrent){
        [self tjs_setBorderColor:borderColorForCurrent forState:self.state];
    }
    
    
    CGFloat borderWidthForCurent = [self tjs_borderWidthForState:self.state];
    if(borderWidthForCurent>=0){
        
        [self tjs_setBorderWidth:borderWidthForCurent forState:self.state];
    }
}





#pragma mark objc_setAssociatedObject
- (void)setTjs_isExcuteObserve:(BOOL)tjs_isExcuteObserve
{
    objc_setAssociatedObject(self, @selector(tjs_isExcuteObserve), @(tjs_isExcuteObserve), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)tjs_isExcuteObserve
{
    //id object   const void *key
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setTjs_titleLabelFonts:(NSMutableDictionary *)tjs_titleLabelFonts {
    objc_setObjRETAIN(@selector(tjs_titleLabelFonts), tjs_titleLabelFonts);
}

- (NSMutableDictionary *)tjs_titleLabelFonts {
    
    NSMutableDictionary *titleLabelFonts = objc_getObj(@selector(tjs_titleLabelFonts));
    if(!titleLabelFonts) {
        titleLabelFonts = [[NSMutableDictionary alloc] init];
        self.tjs_titleLabelFonts = titleLabelFonts;
    }
    return titleLabelFonts;
}

- (void)setTjs_labelBorderColors:(NSMutableDictionary *)tjs_labelBorderColors{
    
    objc_setObjRETAIN(@selector(tjs_labelBorderColors), tjs_labelBorderColors);
}
- (NSMutableDictionary *)tjs_labelBorderColors{
    
    NSMutableDictionary *labelBorderColors = objc_getObj(@selector(tjs_labelBorderColors));
    if(!labelBorderColors) {
        labelBorderColors = [[NSMutableDictionary alloc] init];
        self.tjs_labelBorderColors = labelBorderColors;
    }
    return labelBorderColors;
}


- (void)setTjs_labelBorderWidths:(NSMutableDictionary *)tjs_labelBorderWidths{
    objc_setObjRETAIN(@selector(tjs_labelBorderWidths), tjs_labelBorderWidths);
}

- (NSMutableDictionary *)tjs_labelBorderWidths{
    
    NSMutableDictionary *labelBorderWidths = objc_getObj(@selector(tjs_labelBorderWidths));
    if(!labelBorderWidths) {
        labelBorderWidths = [[NSMutableDictionary alloc] init];
        self.tjs_labelBorderWidths = labelBorderWidths;
    }
    return labelBorderWidths;
}


@end
