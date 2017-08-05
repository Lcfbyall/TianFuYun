//
//  MineHomeOrderCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeOrderCell.h"


static CGFloat const Margin = 10;
static CGFloat const ItemWitem = 80;

@interface MineHomeOrderCell ()

@property (nonatomic,strong) UIScrollView *scrollView;



@end

@implementation MineHomeOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){

        [self p_addSubViews];
    }
    
    return self;
}


- (void)p_addSubViews{

    self.scrollView = ({

        UIScrollView *scroll = [[UIScrollView alloc]init];
        scroll.showsHorizontalScrollIndicator=NO;
        scroll.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:scroll];
        scroll;
    });
}


#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    [super tjs_bindDataToCellWithValue:value];

    [self p_updateItems];
}

- (void)p_updateItems{

    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    WEAK_SELF(self);
    [self.cellInfo.cellItems enumerateObjectsUsingBlock:^(MineHomeCellItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        STRONG_SELF(self);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.scrollView addSubview:btn];
    }];

}

- (void)layoutSubviews{

    [super layoutSubviews];

    self.scrollView.frame = self.contentView.bounds;
    self.scrollView.contentSize = CGSizeMake(ItemWitem*self.cellInfo.cellItems.count, self.scrollView.bounds.size.height);

    WEAK_SELF(self);
    [self.cellInfo.cellItems enumerateObjectsUsingBlock:^(MineHomeCellItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        STRONG_SELF(self);
        UIButton *btn = (UIButton *)[self.scrollView.subviews objectAtIndex:idx];
        MineHomeCellItem *item = (MineHomeCellItem *)obj;
        CGFloat itemW = ItemWitem;
        CGFloat itemH = self.scrollView.bounds.size.height;
        CGFloat X     = idx * itemW;
        CGFloat Y     = 0;
        btn.frame     = CGRectMake(X, Y, itemW, itemH);
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        //btn.backgroundColor = [UIColor whiteColor];
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
        [btn tjs_imageTitleVerticalAlignmentWithSpace:Margin];
    }];
}

@end



