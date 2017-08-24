//
//  SettingHomeHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/23.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingHomeHeader.h"

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


+ (instancetype)header{

    SettingHomeHeader *header = [[self alloc]init];
    header.backgroundColor = [UIColor clearColor];
    
    return header;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if(scrollView.contentOffset.y < -self.frame.size.height){
        CGRect frame     = self.frame;
        frame.size.width = -scrollView.contentOffset.y * 1.75;
        frame.size.height= -scrollView.contentOffset.y;
        frame.origin.x   = (SCREEN_WIDTH - frame.size.width)/2.0;
        frame.origin.y   = scrollView.contentOffset.y;
        self.frame = frame;
    }
}


@end
