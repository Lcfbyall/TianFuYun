//
//  ProductListCell.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductListCell.h"

#import "TJSProductInfoModel.h"

#import "TJSProductListCellLayoutConfig.h"

#import "ProductListCellContentView.h"
//其他类型的内容
#import "ProductListCellTextContentView.h"

@interface ProductListCell ()<ProductListCellContentViewDelegate>

@property (nonatomic,strong) TJSProductInfoModel *model;

@property (nonatomic,strong) UILabel  *productNameL;

@property (nonatomic,strong) UILabel  *productStateL;

@property (nonatomic,strong) UILabel  *productThresholdL;

@property (nonatomic,strong) UIButton *likeBtn;

@end

@implementation ProductListCell


#pragma mark - UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
    
        
        
    }
    return self;
}

/*
- (void)setFrame:(CGRect)frame{

    

}
 */

#pragma mark - TJSBaseTableViewCell

- (void)tjs_bindDataToCellWithValue:(TJSProductInfoModel *)model{

    self.model     = model;
    BOOL validData = [self tjs_checkData];
    
    if(validData){
      
        [self refresh];
    }
}

- (BOOL)tjs_checkData{

    return [self.model isKindOfClass:[TJSProductInfoModel class]];
}


#pragma mark - setters

- (void)setModel:(TJSProductInfoModel *)model{
    
    _model = model;
}



#pragma mark - refreshData

- (void)refresh{

    [self addContentViewIfNotExist];
  
    [self setNeedsLayout];
    
}


#pragma mark - ProductListCellContentViewDelegate

- (void)onCatchEvent:(TJSProductEvent *)event{

    if ([self.delegate respondsToSelector:@selector(onTapCell:)]) {
        
        [self.delegate onTapCell:event];
    }
}



#pragma mark - addSubViews

- (void)addContentViewIfNotExist{
  
    if(_contentview == nil){
    
        //确定cell是那种内容
        id <TJSProductCellLayoutConfig> layoutConfig = [TJSProductListCellLayoutConfig sharedLayoutConfig];
        
        NSString *identifier = [layoutConfig cellContent:self.model];
        NSAssert([identifier length] > 0, @"should offer cell content class name");
        
        Class contentviewClass = NSClassFromString(identifier);
        ProductListCellContentView *content = [[contentviewClass alloc]initListCellContentViewWithDefaultSize:CGSizeMake(SCREEN_WIDTH, 60)];
        
        _contentview = content;
        
        _contentview.delegate = self;
        
        [self.contentView addSubview:content];
    
    }
}

#pragma mark - layoutSubViews

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self layoutCellContentView];
}

- (void)layoutCellContentView{

    self.contentview.frame = CGRectInset(self.bounds, 5, 5);

}

@end
