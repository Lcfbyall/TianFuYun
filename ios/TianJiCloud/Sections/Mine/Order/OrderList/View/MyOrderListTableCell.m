//
//  MyOrderListTableCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyOrderListTableCell.h"
#import "MyOrderInfoModel.h"
#import "UILabel+TJSEdgeInsets.h"
#import "CALayer+YYAdd.h"

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

@property (nonatomic,strong) CAShapeLayer *borderLayer;

@end

@implementation MyOrderListTableCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.orderStatusL.textColor = ThemeService.main_color_01;
    
    self.contentBgView.backgroundColor = ThemeService.weak_color_04;
    
    self.rightarrow = IMAGEOriginal(@"dark_arrow");
    
    self.orderTypeL.tjs_edgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
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
    [self setNeedsLayout];
    [self layoutIfNeeded];
    [self.orderTypeL.layer addSublayer:self.borderLayer];
}

- (CAShapeLayer *)borderLayer{

    if(_borderLayer==nil){
        
        UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:self.orderTypeL.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft cornerRadii:CGSizeMake(15, 15)];
        //UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:self.orderTypeL.bounds cornerRadius:15];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.lineWidth = 1;
        maskLayer.fillColor = [UIColor clearColor].CGColor;
        maskLayer.strokeColor = ThemeService.text_color_00.CGColor;
        maskLayer.path = borderPath.CGPath;
        
        _borderLayer = maskLayer;
    }
    
   return _borderLayer;
}

@end


