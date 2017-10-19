//
//  MineHomeBaseTableCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineHomeBaseTableCell.h"

@interface MineHomeBaseTableCell ()

@end

@implementation MineHomeBaseTableCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if(self){

        self.textLabel.font = [UIFont systemFontOfSize:16.0f];
        self.textLabel.textColor = ThemeService.text_color_01;
        self.detailTextLabel.font = [UIFont systemFontOfSize:13.0f];
        self.detailTextLabel.textColor = ThemeService.text_color_01;
    }
    
    return self;
}


#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{

    self.cellInfo = (MineHomeCellInfo *)value;
    self.textLabel.text = self.cellInfo.title;
    self.imageView.image= IMAGE(self.cellInfo.image);
    self.detailTextLabel.text=self.cellInfo.detailTitle;
    self.accessoryType  = self.cellInfo.accessoryType;
    self.selectionStyle = self.cellInfo.selectionStyle;



}

@end
