//
//  NSMutableAttributedString+Formated.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "NSMutableAttributedString+Formated.h"

@implementation NSMutableAttributedString (Formated)


+ (NSAttributedString *)attTextWithText:(NSString *)text
                                  color:(UIColor *)color
                                   font:(UIFont *)font
                        underLineCoolor:(UIColor *)underLineColor
{
    NSDictionary *atts = @{
                           NSFontAttributeName            : font,
                           NSForegroundColorAttributeName : color,
                           };
    NSMutableAttributedString *attText =
    [[NSMutableAttributedString alloc]initWithString:text
                                          attributes:atts];
    
    NSRange strRange = {0,[attText length]};
    
    if(underLineColor){
        [attText addAttribute:NSUnderlineStyleAttributeName
                        value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
                        range:strRange];
        
        [attText addAttribute:NSUnderlineColorAttributeName
                        value:underLineColor
                        range:strRange];
    }
    
    return [attText copy];;
}


//base method
- (void)setTextColor:(UIColor *)textColor{
    
    [self setTextColor:textColor range:NSMakeRange(0, self.length)];
}
- (void)setTextColor:(UIColor *)textColor range:(NSRange)range
{
    
    if (range.location != NSNotFound)
    {
        [self addAttribute: NSForegroundColorAttributeName
                     value: textColor
                     range: range];
    }
    
}

- (void)setFont:(UIFont *)font{
    
    [self setFont:font range:NSMakeRange(0, self.length)];
}

- (void)setFont:(UIFont *)font range:(NSRange)range
{
    
    if (range.location != NSNotFound)
    {
        [self addAttribute: NSFontAttributeName
                     value: font
                     range: range];
    }
    
}

- (void)setUnderLineColor:(UIColor *)underLineCoolor style:(NSUnderlineStyle)style{
    
    [self setUnderLineColor:underLineCoolor range:NSMakeRange(0, self.length) style:style];
}

- (void)setUnderLineColor:(UIColor *)underLineCoolor
                    range:(NSRange)range
                    style:(NSUnderlineStyle)style{
    
    if (range.location != NSNotFound)
    {
        [self addAttribute:NSUnderlineStyleAttributeName
                     value:[NSNumber numberWithInteger:style]
                     range:range];
        
        [self addAttribute:NSUnderlineColorAttributeName
                     value:underLineCoolor
                     range:range];
    }
}

//chainable base
//Chainable base
- (NSMutableAttributedString* (^)(UIColor *textColor))textColor{
    
    return ^id(UIColor *textColor) {
        
        [self setTextColor:textColor];
        
        return self;
    };
}
- (NSMutableAttributedString* (^)(UIFont  *font))font{
    
    return ^id(UIFont *font) {
        
        [self setFont:font];
        
        return self;
    };
}
- (NSMutableAttributedString* (^)(UIColor *underLineColor,NSUnderlineStyle style))underLine{
    
    return ^id(UIColor *underLineColor,NSUnderlineStyle style){
        
        [self setUnderLineColor:underLineColor style:style];
        
        return self;
    };
}
- (NSMutableAttributedString* (^)(UIColor *textColor,NSRange range))textColorRange{
    return ^id(UIColor *textColor,NSRange range) {
        
        [self setTextColor:textColor range:range];
        
        return self;
    };
}
- (NSMutableAttributedString* (^)(UIFont  *font,NSRange range))fontRange{
    
    return ^id(UIFont *font,NSRange range) {
        
        [self setFont:font range:range];
        
        return self;
    };
}
- (NSMutableAttributedString* (^)(UIColor *underLineColor,NSRange range,NSUnderlineStyle style))underLineRange{
    
    return ^id(UIColor *underLineColor,NSRange range,NSUnderlineStyle style){
        
        [self setUnderLineColor:underLineColor range:range style:style];
        
        return self;
    };
}




//extensions
- (NSRange)p_rangeOfString:(NSString *)string{
    
    return [self.string rangeOfString:string];
}
- (void)setTextColor:(UIColor *)textColor occurenceOfString:(NSString*)separator{
    
    NSRange range = [self p_rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        
        [self setTextColor:textColor range:range];
    }
}

- (void)setFont:(UIFont *)font occurenceOfString:(NSString*)separator{
    
    NSRange range = [self p_rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        [self setFont:font range:range];
    }
}

- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator{
    
    NSRange range = [self p_rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.location += range.length;
        range.length = self.string.length - range.location;
        [self setTextColor:textColor range:range];
    }
}
- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator{
    
    NSRange range = [self p_rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.location += range.length;
        
        range.length = self.string.length - range.location;
        [self setFont:font range:range];
    }
}
- (void)setUnderLineColor:(UIColor *)underLineColor
        occurenceOfString:(NSString *)separator
                    style:(NSUnderlineStyle)style{
    
    NSRange range = [self p_rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        
        [self setUnderLineColor:underLineColor range:range style:style];
    }
}
- (void)setUnderLineColor:(UIColor *)underLineColor
   afterOccurenceOfString:(NSString *)separator
                    style:(NSUnderlineStyle)style{
    
    NSRange range = [self p_rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.location += range.length;
        range.length = self.string.length - range.location;
        [self setUnderLineColor:underLineColor range:range style:style];
    }
}




//Chainable extensions
- (NSMutableAttributedString* (^)(UIColor *textColor,NSString*occurenceString))occurenceTextColor{
    
    return ^id(UIColor *textColor,NSString *occurenceString) {
        
        [self setTextColor:textColor occurenceOfString:occurenceString];
        return self;
    };
}
- (NSMutableAttributedString* (^)(UIFont *font,NSString*occurenceString))occurenceFont{
    
    return ^id(UIFont *font,NSString *occurenceString) {
        
        [self setFont:font occurenceOfString:occurenceString];
        
        return self;
    };
}

- (NSMutableAttributedString* (^)(UIColor *textColor,NSString*afterString))afterTextColor{
    
    return ^id(UIColor *textColor,NSString *afterString){
        
        
        [self setTextColor:textColor afterOccurenceOfString:afterString];
        
        
        return self;
    };
}

- (NSMutableAttributedString* (^)(UIFont *font,NSString*afterString))afterFont{
    
    return ^id(UIFont *font,NSString *afterString){
        
        
        [self setFont:font afterOccurenceOfString:afterString];
        
        return  self;
    };
}


- (NSMutableAttributedString* (^)(UIColor *,NSString *,NSUnderlineStyle))occurenceUnderLine{
    
    return ^id(UIColor *underLineColor,NSString *occurenceString,NSUnderlineStyle style){
        
        
        [self setUnderLineColor:underLineColor occurenceOfString:occurenceString style:style];
        
        
        return self;
    };
}

- (NSMutableAttributedString* (^)(UIColor *,NSString *,NSUnderlineStyle))afterUnderLine{
    
    return ^id(UIColor *underLineColor,NSString *afterString,NSUnderlineStyle style){
        
        
        [self setUnderLineColor:underLineColor afterOccurenceOfString:afterString style:style];
        
        return self;
    };
}


@end
