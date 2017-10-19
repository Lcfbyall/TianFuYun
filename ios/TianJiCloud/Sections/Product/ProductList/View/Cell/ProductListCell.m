//
//  ProductListCell.m
//  TianJiCloud
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


#pragma mark - action

- (void)onTapLikeBtn:(id)sender{
  
    if ([self.delegate respondsToSelector:@selector(onTapLikeBtn:)]) {
        
        //[self.delegate onTapLikeBtn:self.model];
    }

}


#pragma mark - p_addSubViews

- (void)p_addSubviews{

    _productNameL = [[UILabel alloc] init];
    _productNameL.backgroundColor = ThemeService.main_color_04;
    _productNameL.opaque = YES;
    _productNameL.font   = [UIFont systemFontOfSize:14.0];
    [_productNameL setTextColor:ThemeService.text_color_01];
    [self.contentView addSubview:_productNameL];
    
    _productStateL = [[UILabel alloc] init];
    _productStateL.backgroundColor = ThemeService.main_color_04;
    _productStateL.opaque = YES;
    _productStateL.font   = [UIFont systemFontOfSize:14.0];
    [_productStateL setTextColor:ThemeService.text_color_01];
    [self.contentView addSubview:_productStateL];
    

    _productThresholdL = [[UILabel alloc] init];
    _productThresholdL.backgroundColor = ThemeService.main_color_04;
    _productThresholdL.opaque = YES;
    _productThresholdL.font   = [UIFont systemFontOfSize:14.0];
    [_productThresholdL setTextColor:ThemeService.text_color_01];
    [self.contentView addSubview:_productThresholdL];
    
    
    _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_likeBtn setImage:IMAGE(@"button_soucang_nor") forState:UIControlStateNormal];
    [_likeBtn setImage:IMAGE(@"button_soucang_sel") forState:UIControlStateHighlighted];
    [_likeBtn setFrame:CGRectMake(0, 0, 20, 20)];
    [_likeBtn addTarget:self action:@selector(onTapLikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_likeBtn];
}

- (void)addContentViewIfNotExist{
  
    if(_contentview == nil){
    
        //确定cell是那种内容
        id <TJSProductCellLayoutConfig> layoutConfig = [TJSProductListCellLayoutConfig sharedLayoutConfig];
        
        NSString *identifier = [layoutConfig cellContent:self.model];
        NSAssert([identifier length] > 0, @"should offer cell content class name");
        
        if(![identifier isEqualToString:@"ProductListCell"]){
            
            Class contentviewClass = NSClassFromString(identifier);
            ProductListCellContentView *content = [[contentviewClass alloc]initListCellContentViewWithDefaultSize:CGSizeMake(SCREEN_WIDTH, 60)];
            
            _contentview = content;
            
            _contentview.delegate = self;
            
            [self.contentView addSubview:content];
        }
    }
}


#pragma mark - layoutSubViews

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self layoutCellContentView];
    
    [self layoutProductNameL];
    
    [self layoutProductStateL];
    
    [self layoutProductThresholdL];
    
    [self layoutLikeBtn];
}

- (void)layoutProductNameL{
  
    CGFloat X = 18;
    CGFloat Y = 20;
    CGFloat R = 24;
    CGFloat H = 16;
    CGFloat W = self.bounds.size.width - X - R;
    _productNameL.frame = CGRectMake(X, Y, W, H);

}

- (void)layoutProductStateL{

    CGFloat X = 18;
    CGFloat Y = 20;
    CGFloat R = 24;
    CGFloat H = 16;
    CGFloat W = self.bounds.size.width - X - R;
    _productNameL.frame = CGRectMake(X, Y, W, H);
}

- (void)layoutProductThresholdL{
    
    
}

- (void)layoutLikeBtn{
    
    
}

- (void)layoutCellContentView{

    if(self.contentview)
    self.contentview.frame = CGRectInset(self.bounds, 5, 5);

}

@end
