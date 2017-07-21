//
//  TJSSystemAlertMaker.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSSystemAlertMaker.h"
#import "TJSAlertController.h"

@interface TJSSystemAlertMaker ()

@property (nonatomic, strong) TJSAlertController *alertController;

@end

@implementation TJSSystemAlertMaker

- (instancetype)initWithStyle:(UIAlertControllerStyle)style {
    
    if (self = [super init]) {
        
        
        self.alertController              = [TJSAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:style] ;
        _alertController.titleColor       = [UIColor blackColor];
        _alertController.messageColor     = [UIColor blackColor];
        _alertController.actionColor      = nil;//ThemeService.main_color_00;
        _alertController.cancelColor      = nil;//ThemeService.normal_color_10;
        _alertController.messageAlignment = NSTextAlignmentCenter;
    }
    return self;
}



- (TJSSystemAlertMaker *(^)(NSString *))title {
    return ^id(NSString * title) {
        self.alertController.title = title;
        return self;
    };
}

- (TJSSystemAlertMaker *(^)(UIColor *))titleColor {
    return ^id(UIColor * titleColor) {
        self.alertController.titleColor = titleColor;
        return self;
    };
}

- (TJSSystemAlertMaker *(^)(NSString *))message {
    return ^id(NSString * message) {
        self.alertController.message = message;
        return self;
    };
}

- (TJSSystemAlertMaker * _Nonnull (^)(UIColor * _Nonnull))messageColor {
    return ^id(UIColor * messageColor) {
        self.alertController.messageColor = messageColor;
        return self;
    };
}

- (TJSSystemAlertMaker * _Nonnull (^)(NSTextAlignment))messageAlignment {
    return ^id(NSTextAlignment messageAlignment) {
        
        self.alertController.messageAlignment = messageAlignment;
        return self;
    };
}


- (TJSSystemAlertMaker * _Nonnull (^)(UIColor * _Nonnull))actionUnifyColor {
    return ^id(UIColor * actionUnifyColor) {
        self.alertController.tintColor = actionUnifyColor;
        return self;
    };
}

- (TJSSystemAlertMaker * _Nonnull (^)(UIColor * _Nonnull))actionButtonColor {
    return ^id(UIColor * actionButtonColor) {
        self.alertController.actionColor = actionButtonColor;
        return self;
    };
}

- (TJSSystemAlertMaker * _Nonnull (^)(UIColor * _Nonnull))cancelButtonColor {
    return ^id(UIColor * cancelButtonColor) {
        self.alertController.cancelColor = cancelButtonColor;
        return self;
    };
}

- (TJSSystemAlertMaker *(^)(NSString * , TJSSystemAlertActionBlock))action {
    return ^id(NSString * title, TJSSystemAlertActionBlock handler) {
        [self p_addActionWithStyle:UIAlertActionStyleDefault title:title handler:handler];
        return self;
    };
}

- (TJSSystemAlertMaker *(^)(NSString * , TJSSystemAlertActionBlock))cancelAction {
    return ^id(NSString * title, TJSSystemAlertActionBlock handler) {
        [self p_addActionWithStyle:UIAlertActionStyleCancel title:title handler:handler];
        return self;
    };
}

- (TJSSystemAlertMaker *(^)(TJSSystemAlertConfigurationBlock))textField {
    return ^id(TJSSystemAlertConfigurationBlock hander) {
        [self.alertController addTextFieldWithConfigurationHandler:hander];
        return self;
    };
}

- (TJSSystemAlertShowBlock)show {
    
    return ^{
        
        [[UIViewController tjs_currentController] presentViewController:self.alertController animated:YES completion:nil];
        
        return self.alertController;
    };
}

#pragma mark - Private Methods
- (void)p_addActionWithStyle:(UIAlertActionStyle)style
                       title:(id)title
                     handler:(void (^)(UIAlertAction * action))handler {
    TJSAlertAction *action = [TJSAlertAction actionWithTitle:title style:style handler:handler];
    [self.alertController addAction:action];
}


@end
