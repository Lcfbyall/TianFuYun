//
//  UITextView+PlaceHolder.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UITextView+PlaceHolder.h"
#import "NSObject+Swizzle.h"

static void * TJSTextViewTextChangedContext= & TJSTextViewTextChangedContext;

@interface UITextView ()

/**
 *  bool 是否添加通知
 */
@property (nonatomic, assign) BOOL isExcuteNoti;


@end

@implementation UITextView (PlaceHolder)

+ (void)load
{

    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      
                      tjs_swizzleInstanceMethod([self class],
                                            @selector(drawRect:),
                                            @selector(place_drawRect:));
                      
                      tjs_swizzleInstanceMethod([self class],
                                            NSSelectorFromString(@"dealloc"),
                                            @selector(place_dealloc));
                  });
}


- (void)place_dealloc
{
    if(self.isExcuteNoti){
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
        
        [self removeObserver:self forKeyPath:@"text" context:TJSTextViewTextChangedContext];
    }
    
    [self place_dealloc];
}

- (void)place_drawRect:(CGRect)rect
{
    //设置默认字体颜色
    UIFont  *placeFont  = self.tjs_placeholderFont? self.tjs_placeholderFont:[UIFont systemFontOfSize:14.0];
    UIColor *placeColor = self.tjs_placeholderColor?self.tjs_placeholderColor:[UIColor lightGrayColor];
    
    BOOL isZero = UIEdgeInsetsEqualToEdgeInsets(self.tjs_placeContainerInset, UIEdgeInsetsZero);
    UIEdgeInsets placeInsets = isZero?self.textContainerInset:self.tjs_placeContainerInset;
    
    if([self.text length] == 0 && self.tjs_placeholder)
    {
        
        CGRect InsetRect =  UIEdgeInsetsInsetRect(rect, placeInsets);
        CGRect placeHolderRect = InsetRect;
        
        [placeColor set];
        
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_0)
        {
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
            paragraphStyle.alignment = self.textAlignment;
            paragraphStyle.paragraphSpacing   = 2;
            paragraphStyle.firstLineHeadIndent= 7;
            //            paragraphStyle.headIndent=2;
            //            paragraphStyle.paragraphSpacingBefore=2;
            //            paragraphStyle.defaultTabInterval=2;
            
            [self.tjs_placeholder drawInRect:placeHolderRect
                              withAttributes:
             
             @{ NSFontAttributeName :            placeFont,
                NSForegroundColorAttributeName:  placeColor,
                NSParagraphStyleAttributeName :   paragraphStyle
                }
             ];
        }
        
        else
        {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
            
            [self.tjs_placeholder drawInRect:placeHolderRect
                                    withFont:placeFont
                               lineBreakMode:NSLineBreakByTruncatingTail
                                   alignment:self.textAlignment];
            
            
#pragma clang diagnostic pop
        }
    }
    
    
    [self place_drawRect:rect];
}
#pragma mark - UITextViewTextDidChangeNotification
#pragma mark - 监听键盘输入text改变通知
- (void)didReceiveTextDidChangeNotification:(NSNotification *)notification
{
    [self setNeedsDisplay];
}
#pragma mark - KVO  监听手动设置text
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if (object == self &&
        [keyPath isEqualToString:@"text"]
        && context==TJSTextViewTextChangedContext) {
        
        
        [self setNeedsDisplay];
        
    } else {
        // Make sure to call the superclass's implementation in the else block in case it is also implementing KVO
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

#pragma mark - setters && getters
- (void)setTjs_placeholder:(NSString *)tjs_placeholder
{
    
    objc_setAssociatedObject(self,
                             @selector(tjs_placeholder),
                             tjs_placeholder,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if(!self.isExcuteNoti)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveTextDidChangeNotification:)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:self];
        
        [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:TJSTextViewTextChangedContext];
        
        self.isExcuteNoti = 1;
    }
    
    [self setNeedsDisplay];
    
}
- (NSString *)tjs_placeholder
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setTjs_placeholderColor:(UIColor *)tjs_placeholderColor
{
    objc_setAssociatedObject(self,
                             @selector(tjs_placeholderColor),
                             tjs_placeholderColor,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setNeedsDisplay];
}
- (UIColor *)tjs_placeholderColor
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setTjs_placeholderFont:(UIFont *)tjs_placeholderFont
{
    objc_setAssociatedObject(self,
                             @selector(tjs_placeholderFont),
                             tjs_placeholderFont,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setNeedsDisplay];
}
- (UIFont *)tjs_placeholderFont
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTjs_placeContainerInset:(UIEdgeInsets)tjs_placeContainerInset{
    
    objc_setAssociatedObject(self,
                             @selector(tjs_placeContainerInset),
                             [NSValue valueWithUIEdgeInsets:tjs_placeContainerInset],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setNeedsDisplay];
}
- (UIEdgeInsets)tjs_placeContainerInset{
    
    NSValue *insetValue = objc_getAssociatedObject(self, _cmd);
    return [insetValue UIEdgeInsetsValue];
}

- (void)setIsExcuteNoti:(BOOL)isExcuteNoti
{
    objc_setAssociatedObject(self, @selector(isExcuteNoti), @(isExcuteNoti), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)isExcuteNoti
{
    
    //id object   const void *key
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}




@end
