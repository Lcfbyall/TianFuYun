//
//  NSMutableAttributedString+Formated.h
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAttWithStr(str) [[NSMutableAttributedString alloc]initWithString:(str)]
#define MAttWithAttributes(str,attributes) [[NSMutableAttributedString alloc]initWithString:(str) attributes:(attributes)]


@interface NSMutableAttributedString (Formated)


//new a underLine quikly
+ (NSAttributedString *)attTextWithText:(NSString *)text
                                  color:(UIColor *)color
                                   font:(UIFont *)font
                        underLineCoolor:(UIColor *)underLineColor;



//base method
- (void)setTextColor:(UIColor *)textColor;
- (void)setTextColor:(UIColor *)textColor
               range:(NSRange)range;

- (void)setFont:(UIFont *)font;
- (void)setFont:(UIFont *)font
          range:(NSRange)range;

- (void)setUnderLineColor:(UIColor *)underLineCoolor
                    range:(NSRange)range
                    style:(NSUnderlineStyle)style;
- (void)setUnderLineColor:(UIColor *)underLineCoolor
                    style:(NSUnderlineStyle)style;
//Chainable base
- (NSMutableAttributedString* (^)(UIColor *textColor))textColor;
- (NSMutableAttributedString* (^)(UIFont  *font))font;
- (NSMutableAttributedString* (^)(UIColor *underLineColor,NSUnderlineStyle style))underLine;
- (NSMutableAttributedString* (^)(UIColor *textColor,NSRange range))textColorRange;
- (NSMutableAttributedString* (^)(UIFont  *font,NSRange range))fontRange;
- (NSMutableAttributedString* (^)(UIColor *underLineColor,NSRange range,NSUnderlineStyle style))underLineRange;






//extensions
- (void)setTextColor:(UIColor *)textColor occurenceOfString:(NSString*)separator;
- (void)setFont:(UIFont *)font occurenceOfString:(NSString*)separator;
- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator;
- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator;
- (void)setUnderLineColor:(UIColor *)underLineColor
        occurenceOfString:(NSString *)separator
                    style:(NSUnderlineStyle)style;
- (void)setUnderLineColor:(UIColor *)underLineColor
   afterOccurenceOfString:(NSString *)separator
                    style:(NSUnderlineStyle)style;
//Chainable extensions
- (NSMutableAttributedString* (^)(UIColor *textColor,NSString*occurenceString))occurenceTextColor;
- (NSMutableAttributedString* (^)(UIFont  *font ,     NSString*occurenceString))occurenceFont;
- (NSMutableAttributedString* (^)(UIColor *textColor,NSString*afterString))afterTextColor;
- (NSMutableAttributedString* (^)(UIFont  *font,     NSString*afterString))afterFont;
- (NSMutableAttributedString* (^)(UIColor *underLineColor,NSString *occurenceString,NSUnderlineStyle style))occurenceUnderLine;
- (NSMutableAttributedString* (^)(UIColor *underLineColor,NSString *afterString,NSUnderlineStyle style))afterUnderLine;



@end
