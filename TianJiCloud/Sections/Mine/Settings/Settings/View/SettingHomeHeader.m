//
//  SettingHomeHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/23.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeHeader.h"
#import "UIImageView+TJSWebCache.h"

#define Height ([[UIScreen mainScreen] bounds].size.width * 1032/1242.0)

@interface SettingHomeHeader ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UIView *bottomContentView;

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *nameL;

@property (weak, nonatomic) IBOutlet UIButton *vertifyBtn;

@property (weak, nonatomic) IBOutlet UIButton *uploadIconBtn;


@end

@implementation SettingHomeHeader

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        
        CGFloat height = screenBounds.size.width * 1032/1242.0;
        CGRect frame = CGRectMake(0.0f, -height, screenBounds.size.width, height);
        
        self.frame = frame;
    }
    
    return self;
}

- (void)awakeFromNib{
 
    [super awakeFromNib];
    
    self.icon.layer.cornerRadius = self.icon.tjs_height/2.0;
    self.icon.layer.masksToBounds = YES;
    
    self.nameL.textColor = ThemeService.text_color_01;
    self.nameL.font = [UIFont systemFontOfSize:17.0f];
    
    self.vertifyBtn.userInteractionEnabled = NO;
    self.vertifyBtn.tjs_backGroundColorNormal = ThemeService.origin_color_00;
    self.vertifyBtn.tjs_backGroundColorHighlighted = ThemeService.origin_color_00;
    self.vertifyBtn.tjs_backGroundColorSelected = ThemeService.origin_color_00;
    [self.vertifyBtn setTitle:@"未认证" forState:UIControlStateNormal];
    [self.vertifyBtn setTitle:@"未认证" forState:UIControlStateHighlighted];
    [self.vertifyBtn setTitle:@"已认证" forState:UIControlStateSelected];
    [self.vertifyBtn setImage:IMAGEOriginal(@"id_grey") forState:UIControlStateNormal];
    [self.vertifyBtn setImage:IMAGEOriginal(@"id_grey") forState:UIControlStateHighlighted];
    [self.vertifyBtn setImage:IMAGEOriginal(@"id_yellow") forState:UIControlStateSelected];
    [self.vertifyBtn setTitleColor:ThemeService.text_color_03 forState:UIControlStateNormal];
    [self.vertifyBtn setTitleColor:ThemeService.text_color_03 forState:UIControlStateHighlighted];
    [self.vertifyBtn setTitleColor:ThemeService.main_color_01 forState:UIControlStateSelected];
    
    self.vertifyBtn.tjs_borderColorNormal = ThemeService.text_color_03;
    self.vertifyBtn.tjs_borderColorHighlighted = ThemeService.text_color_03;
    self.vertifyBtn.tjs_borderColorSelected = ThemeService.main_color_01;
    
    self.vertifyBtn.layer.cornerRadius = 2;
    self.vertifyBtn.layer.masksToBounds = YES;
    self.vertifyBtn.tjs_borderWidthNormal = 1;
    self.vertifyBtn.tjs_borderWidthHighlighted = 1;
    self.vertifyBtn.tjs_borderWidthSelected = 1;
    [self.vertifyBtn tjs_imageTitleHorizontalAlignmentWithSpace:5];
    
    self.uploadIconBtn.layer.cornerRadius = self.uploadIconBtn.tjs_height/2.0;
    self.uploadIconBtn.layer.masksToBounds = YES;
    self.uploadIconBtn.backgroundColor = [ThemeService.origin_color_01 colorWithAlphaComponent:0.5];

}

- (void)updateConstraints{
    
    /*
    [self removeConstraint:_bottomConstant];
    
    NSLayoutConstraint *myConstraint =
    [NSLayoutConstraint
     constraintWithItem:_moneyL
     attribute:NSLayoutAttributeBottom
     relatedBy:NSLayoutRelationEqual
     toItem:self
     attribute:NSLayoutAttributeBottom
     multiplier:1.0
     constant:-(SCREEN_WIDTH/1.75/2.0-30)];
    
    [self addConstraint: myConstraint];
     */
    
    [super updateConstraints];
}

+ (instancetype)headerWithUpload:(void (^)(id))block{

    SettingHomeHeader *header = [[self alloc]init];
    header.backgroundColor = [UIColor clearColor];
    
    [header.uploadIconBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        if(block)block(sender);
    }];
    
    return header;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if(scrollView.contentOffset.y < -Height){
        
        CGRect frame     = self.frame;
        frame.origin.y   = scrollView.contentOffset.y;
        frame.size.height= -scrollView.contentOffset.y;
        
        frame.origin.x   = (SCREEN_WIDTH - frame.size.width)/2.0;
        frame.size.width = -scrollView.contentOffset.y * 1242/1032.0;
        self.frame = frame;
        
    }else{
    
      
    
    }
   
}


#pragma mark - 

- (void)tjs_bindDataWithValue:(id)value{
  
    //icon name vertify
    NSArray *values = (NSArray *)value;

    //[self.icon tjs_setImageWithURL:nil placeholderImage:[values firstObject]];
    
    self.icon.image = [values firstObject];
    
    self.nameL.text = [values objectAtIndex:1];
    
    self.vertifyBtn.selected = [[values lastObject] boolValue];
    
    
    //self.icon.image = [UIImage tjs_imageWithColor:[UIColor redColor] size:CGSizeMake(100, 40) cornerRadius:20];

}


@end
