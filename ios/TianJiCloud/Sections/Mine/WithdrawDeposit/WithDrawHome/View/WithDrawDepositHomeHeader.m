//
//  WithDrawDepositHomeHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "WithDrawDepositHomeHeader.h"

@interface WithDrawDepositHomeHeader ()

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UILabel *titleValueL;

@end

@implementation WithDrawDepositHomeHeader


- (instancetype)init{
    
    self = [super init];
    if(self){
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        
        CGRect frame = CGRectMake(0.0f, 0.0f, screenBounds.size.width, screenBounds.size.width * 666/1240.0);
        
        self.frame = frame;
        
    }
    
    return self;
}


- (void)awakeFromNib{
  
    [super awakeFromNib];

    _titleL.text = @"可提现金额(元)";
    _titleL.font = [UIFont systemFontOfSize:16.0f];
    _titleL.textColor = ThemeService.origin_color_00;
    _titleValueL.font = [UIFont systemFontOfSize:40.0f];
    _titleValueL.textColor = ThemeService.origin_color_00;
}


+ (instancetype)header{
 
    WithDrawDepositHomeHeader *header = [[self alloc]init];
    header.backgroundColor = ThemeService.main_color_02;
    
    return header;
}


- (void)tjs_bindDataToCellWithValue:(id)value{

    _titleValueL.text = value;

}

@end
