//
//  MyOrderListTableCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyOrderListTableCell.h"
#import "MyOrderInfoModel.h"

@interface MyOrderListTableCell ()

@property (weak, nonatomic) IBOutlet UILabel  *orderTypeL;

@property (weak, nonatomic) IBOutlet UIButton *orderName;

@property (weak, nonatomic) IBOutlet UILabel  *orderStatusL;

@property (weak, nonatomic) IBOutlet UILabel  *brokerageL;

@property (weak, nonatomic) IBOutlet UILabel  *investmentL;

@property (weak, nonatomic) IBOutlet UILabel  *orderNumTimeL;

@property (weak, nonatomic) IBOutlet UILabel  *investorL;

@property (weak, nonatomic) IBOutlet UIView   *contentBgView;

@property (nonatomic,strong) UIImage *rightarrow;


@end

@implementation MyOrderListTableCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.orderStatusL.textColor = ThemeService.main_color_01;
    
    self.contentBgView.backgroundColor = ThemeService.weak_color_04;
    
    self.rightarrow = IMAGEOriginal(@"dark_arrow");
}


#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{

    MyOrderInfoModel *model = (MyOrderInfoModel *)value;
    
    self.orderTypeL.attributedText = model.orderType;
    [self.orderName setAttributedTitle:model.orderName forState:UIControlStateNormal];
    [self.orderName setImage:self.rightarrow forState:UIControlStateNormal];
    [self.orderName tjs_titleImageHorizontalAlignmentWithSpace:8];
    self.orderStatusL.attributedText = model.orderStatus;
    self.brokerageL.attributedText = model.brokerage;
    self.investorL.attributedText = model.investor;
    self.investmentL.attributedText = model.investment;
    self.orderNumTimeL.attributedText = model.orderNumTime;
}

@end
