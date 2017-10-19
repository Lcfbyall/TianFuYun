//
//  SettingBaseTableCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "SettingBaseTableCell.h"

@implementation SettingBaseTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    
    if(self){
    
        
    }

    return self;
}

#pragma mark -

- (void)tjs_bindDataToCellWithValue:(id)value{
    
    self.model = value;
    
    self.imageView.image = IMAGE(self.model.image);
    
    self.textLabel.text = self.model.text;
    self.textLabel.textColor = ThemeService.text_color_01;
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    
    self.detailTextLabel.text = self.model.detailText;
    self.detailTextLabel.textColor = ThemeService.text_color_02;
    self.detailTextLabel.font = [UIFont systemFontOfSize:13.0f];

    self.accessoryType = self.model.accessoryType;
    self.selectionStyle = self.model.selectionStyle;
}

@end
