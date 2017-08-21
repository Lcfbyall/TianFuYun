//
//  BankPickerView.m
//  TianJiCloud
//
//  Created by staff on 2017/8/19.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankPickerView.h"
#import "UIView+YYAdd.h"
#import "NSMutableAttributedString+Formated.h"


@interface BankPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *contaniner;

@property (weak, nonatomic) IBOutlet UIPickerView *piker;

@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;


@property (nonatomic,strong) NSArray *dataSource;


@end

@implementation BankPickerView

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


#pragma mark - public

+ (instancetype)showWithDatas:(NSArray *)datas
                   defaultRow:(NSInteger)defaultRow
                   done:(void (^)(NSInteger row))done{

    BankPickerView *pk = [[self alloc]init];
    
    pk.piker.dataSource= pk;
    pk.piker.delegate  = pk;
    pk.dataSource = datas;
    
    [pk.piker reloadAllComponents];
    [pk.piker selectRow:defaultRow inComponent:0 animated:NO];
    
    pk.cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [pk.cancleBtn setTitleColor:ThemeService.main_color_01 forState:UIControlStateNormal];
    [pk.cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    pk.doneBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [pk.doneBtn setTitleColor:ThemeService.main_color_01 forState:UIControlStateNormal];
    [pk.doneBtn setTitle:@"完成" forState:UIControlStateNormal];
    
    WEAK_SELF(pk);
    [pk.cancleBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        STRONG_SELF(pk);
        [pk dismiss];
    }];
    [pk.doneBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        STRONG_SELF(pk);
        NSInteger row0 = [pk.piker selectedRowInComponent:0];
        if(done)done(row0);
        [pk dismiss];
    }];
    
    pk.contaniner.backgroundColor = ThemeService.origin_color_00;
  
    [pk show];
    
    return pk;
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




#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.dataSource.count;
}


#pragma mark - UIPickerViewDelegate

// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component __TVOS_PROHIBITED{

    return 200;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component __TVOS_PROHIBITED{

    return 30;
}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
/*
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
}
*/

// attributed title is favored if both methods are implemented

- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED{
    NSString *title = [self.dataSource objectAtIndex:row];
    NSMutableAttributedString *att = MAttWithStr(title);
    att.textColor(ThemeService.text_color_00).font([UIFont systemFontOfSize:18.0f]);
    return  att;
}

/*
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view __TVOS_PROHIBITED{
}
*/

//手动滑动
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{

    //NSInteger row0 = [self.piker selectedRowInComponent:0];
    //[self.dataSource objectAtIndex:row0];
    
}

@end





