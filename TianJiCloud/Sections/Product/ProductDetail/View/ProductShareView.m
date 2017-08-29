//
//  ProductShareView.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductShareView.h"
#import "UIView+YYAdd.h"

@interface ProductShareView ()

@property (weak, nonatomic) IBOutlet UIView *contaniner;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (nonatomic,strong)NSMutableArray *itemBtns;

@property (nonatomic,copy) void (^clickBlock)(NSInteger index);

@end

@implementation ProductShareView


- (instancetype)init{
    
    self = [super init];
    if(self){
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGRect frame = CGRectMake(0.0f, 0.0f, screenBounds.size.width, screenBounds.size.height);
        self.frame = frame;
        
        self.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
        
        [self addTarget:self
                 action:@selector(dismiss)
       forControlEvents:UIControlEventTouchUpInside];

    }
    
    return self;
}


+ (instancetype)showWithItems:(NSArray *)items
                         done:(void (^)(NSInteger index))done{

    ProductShareView *share = [[self alloc]init];
    
    share.contaniner.backgroundColor = ThemeService.origin_color_00;
    share.cancelBtn.backgroundColor = ThemeService.origin_color_00;
    
    [share setupSubViewsWithItems:items block:done];
    
    [share show];
    
    return share;

}


#pragma mark - Private

- (void)setupSubViewsWithItems:(NSArray <ProductShareItem *> *)items
                         block:(void (^)(NSInteger index))block{
    
    WEAK_SELF(self);
    self.itemBtns = [NSMutableArray array];
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        STRONG_SELF(self);
        ProductShareItem *shareItem = (ProductShareItem *)obj;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tjs_backGroundColorNormal = shareItem.btnColor;
        btn.tjs_backGroundColorHighlighted = shareItem.btnColor_hig;
        btn.tjs_titleNormal = shareItem.btnTitle;
        btn.tjs_titleHighlighted = shareItem.btnTitle_hig;
        [btn setImage:shareItem.btnImage forState:UIControlStateNormal];
        [btn setImage:shareItem.btnImage forState:UIControlStateHighlighted];
        [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            if(block)block(shareItem.plat);
        }];
        [self.itemBtns addObject:btn];
        [self.contaniner addSubview:btn];
        
        
    }];
    
    [self.cancelBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        STRONG_SELF(self);
        [self dismiss];
    }];
}

- (void)show{

    UIWindow *keywindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
    [keywindow addSubview:self];
    //CGSize winSize = [UIScreen mainScreen].bounds.size;
    
    _contaniner.tjs_top =  self.frame.size.height;
    CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:.35 animations:^{
        _contaniner.tjs_bottom =  self.frame.size.height;
    }];
}

- (void)dismiss{

    [UIView animateWithDuration:.35 animations:^{
        _contaniner.tjs_top =  self.frame.size.height;
    }completion:^(BOOL finished)
     {
         [self removeAllSubviews];
         [self removeFromSuperview];
     }];
}

@end
