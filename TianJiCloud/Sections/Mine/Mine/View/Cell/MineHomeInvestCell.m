//
//  MineHomeInvestCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeInvestCell.h"

static NSInteger const column = 2;
static CGFloat const Margin = 10;
@interface MineHomeInvestCell ()

@end

@implementation MineHomeInvestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){


    }
    
    return self;
}


#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];

    [self p_updateItems];
}


- (void)p_updateItems{

    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    WEAK_SELF(self);
    [self.cellInfo.cellItems enumerateObjectsUsingBlock:^(MineHomeCellItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        STRONG_SELF(self);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
    }];
}


- (void)layoutSubviews{

    [super layoutSubviews];

    WEAK_SELF(self);
    [self.cellInfo.cellItems enumerateObjectsUsingBlock:^(MineHomeCellItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        STRONG_SELF(self);
        UIButton *btn = (UIButton *)[self.contentView.subviews objectAtIndex:idx];
        MineHomeCellItem *item = (MineHomeCellItem *)obj;
        CGFloat itemW = self.bounds.size.width/(CGFloat)column;
        CGFloat itemH = self.bounds.size.height/((CGFloat)self.cellInfo.cellItems.count/column);
        CGFloat X     = idx % column * itemW;
        CGFloat Y     = idx / column * itemH;
        btn.frame     = CGRectMake(X, Y, itemW, itemH);
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        //btn.backgroundColor = idx %2? [UIColor redColor]:[UIColor greenColor];
        //btn.titleLabel.backgroundColor = [UIColor whiteColor];
        //btn.imageView.backgroundColor  = [UIColor blueColor];
        [btn setImage:IMAGE(item.img) forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            if(item.itemOperation)item.itemOperation(nil, nil);
        }];
        [btn tjs_imageTitleHorizontalAlignmentWithSpace:Margin];
    }];
}

@end
