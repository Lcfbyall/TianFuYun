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
        
    }
    
    return self;
}

#pragma mark - <TJSTableViewCellProtocol>

- (void)tjs_bindDataToCellWithValue:(id)value{

    self.cellInfo = (MineHomeCellInfo *)value;
    
    self.textLabel.text = self.cellInfo.title;
    self.imageView.image = IMAGE(self.cellInfo.image);
    
    self.detailTextLabel.text = self.cellInfo.detailTitle;
    
    self.accessoryType = self.cellInfo.accessoryType;
}

@end
