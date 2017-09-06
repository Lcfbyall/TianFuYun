//
//  CumulateInvestHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "CumulateInvestHeader.h"
#import "CumulateInvestInfoModel.h"
#import "UIImage+FromColor.h"
#import "NSMutableAttributedString+Formated.h"


static NSInteger const column = 2;

@interface CumulateInvestHeader ()

@property (weak, nonatomic) IBOutlet UILabel *sumL;

@property (nonatomic,strong) NSMutableArray *btns;

@end

@implementation CumulateInvestHeader

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

+ (instancetype)header{

    CumulateInvestHeader *header = [[self alloc]init];
    header.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 260);
    header.backgroundColor = ThemeService.origin_color_00;
    return header;
}

- (void)setInteractor:(id<CumulativeInvestInteractor>)interactor{
 
    _interactor = interactor;
}

- (void)tjs_reloadTableHeader{
    
    _sumL.text = self.interactor.totalInvest;
    _sumL.attributedText = MAttWithStr(_sumL.text).textColor(ThemeService.text_color_01).font([UIFont systemFontOfSize:17.0]).afterTextColor(ThemeService.text_color_00,@"\n").afterFont([UIFont systemFontOfSize:30.0f],@"\n");

    _btns = [NSMutableArray array];
    [self p_addSubBtns];
}

#pragma mark - subViews

- (void)p_addSubBtns{
    
    [_btns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_btns removeAllObjects];

    WEAK_SELF(self);
    [self.interactor.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        STRONG_SELF(self);
        CumulateInvestInfoModel *item = (CumulateInvestInfoModel *)obj;
        //找到最长的
        CGFloat itemW = 80;
        CGFloat itemH = 20;
        CGFloat X     = idx % column * (itemW+10) + 30;
        CGFloat Y     = idx / column * (itemH+10) + 100;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame     = CGRectMake(X, Y, itemW, itemH);
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.backgroundColor = ThemeService.origin_color_00;
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        UIImage *btnImage = [UIImage tjs_imageWithColor:item.info.color size:CGSizeMake(13, 13)];
        [btn setImage:btnImage forState:UIControlStateNormal];
        [btn setTitle:item.info.name forState:UIControlStateNormal];
        [btn setTitleColor:ThemeService.text_color_01 forState:UIControlStateNormal];
        [btn tjs_imageTitleHorizontalAlignmentWithSpace:5];
        [self addSubview:btn];
        [self.btns addObject:btn];
    }];

}


@end



