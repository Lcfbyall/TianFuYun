//
//  ContractListHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/15.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ContractListHeader.h"

@interface ContractListHeader ()

@property (nonatomic,strong) UILabel *adrress;
@property (nonatomic,strong) UILabel *adrressTitle;
@property (nonatomic,strong) UILabel *recipients;
@property (nonatomic,strong) UILabel *recipientsL;

@end


@implementation ContractListHeader

- (instancetype)init{
 
    self = [super init];
    if(self){
    
        [self p_addSubViews];
    }

    return self;
}


- (void)p_addSubViews{
 
    _adrress = [[UILabel alloc]initWithFrame:CGRectZero];
    _adrress.textColor = ThemeService.text_color_02;
    _adrress.textAlignment = NSTextAlignmentLeft;
    _adrress.text = @"寄回地址:";
    _adrress.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:_adrress];
    
    _adrressTitle = [[UILabel alloc]initWithFrame:CGRectZero];
    _adrressTitle.textColor = ThemeService.text_color_02;
    _adrressTitle.textAlignment = NSTextAlignmentLeft;
    _adrressTitle.font = [UIFont systemFontOfSize:14.0f];
    _adrressTitle.numberOfLines = 0;
    [self addSubview:_adrressTitle];
    
    _recipients = [[UILabel alloc]initWithFrame:CGRectZero];
    _recipients.textColor = ThemeService.text_color_02;
    _recipients.textAlignment = NSTextAlignmentLeft;
    _recipients.text = @"收件人:";
    _recipients.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:_recipients];
    
    _recipientsL = [[UILabel alloc]initWithFrame:CGRectZero];
    _recipientsL.textColor = ThemeService.text_color_02;
    _recipientsL.textAlignment = NSTextAlignmentLeft;
    _recipientsL.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:_recipientsL];
    
    
    /*
    _adrress.backgroundColor = [UIColor redColor];
    _adrressTitle.backgroundColor = [UIColor blueColor];
    _recipients.backgroundColor = [UIColor grayColor];
    _recipientsL.backgroundColor = [UIColor cyanColor];
    */
    
    
    [_adrress mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.mas_equalTo(20);
        
        make.left.mas_equalTo(20);
        
        make.top.mas_equalTo(15);
        
    }];
    
    
    WEAK_SELF(self);
    [_adrressTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        STRONG_SELF(self);
        make.left.equalTo(self.adrress.mas_right).offset(10);
        make.top.equalTo(self.adrress.mas_top);
        make.right.mas_equalTo(-60);
        
    }];
    
    
    [_recipients mas_makeConstraints:^(MASConstraintMaker *make) {
        
        STRONG_SELF(self);
        make.left.equalTo(self.adrress.mas_left);
        make.top.equalTo(self.adrressTitle.mas_bottom).offset(20);
    
    }];
    
    
    [_recipientsL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        STRONG_SELF(self);
        make.left.equalTo(self.adrressTitle.mas_left);
        make.top.equalTo(self.recipients.mas_top);
        
    }];
}


+ (instancetype)header{
  
    ContractListHeader *header = [[ContractListHeader alloc]init];
    header.backgroundColor = ThemeService.origin_color_00;
    
    header.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
    
    [header tjs_bindDataToCellWithValue:nil];
    
    return header;
}

#pragma mark - Public

- (void)tjs_bindDataToCellWithValue:(id)value{

    self.adrressTitle.text = @"上海浦东新区世纪大道1777号东方希望大厦12楼B座";
    self.recipientsL.text = @"400-877-6097";

}

@end
