//
//  TJSBaseTableViewCell.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseTableViewCell.h"

static NSString *_identifier = nil;

@interface TJSBaseTableViewCell ()


@end

@implementation TJSBaseTableViewCell

+ (void)initialize{
   
    _identifier = NSStringFromClass([self class]);
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
    
    
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}

- (void)TJS_separatorInsetZero {
    
    self.separatorInset = UIEdgeInsetsZero;
    self.layoutMargins  = UIEdgeInsetsZero;
    [self setPreservesSuperviewLayoutMargins:NO];
}

- (void)tjs_separatorInsetZeroWithTableView:(UITableView *)tableView {
    
#ifdef   __IPHONE_7_0
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
#endif
#ifdef __IPHONE_8_0
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [self setPreservesSuperviewLayoutMargins:NO];
    }
#endif
}



+ (instancetype)tjs_makeCellForAllocTableView:(UITableView *)tableView {

    
    TJSBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {
        
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_identifier];
    }
    return cell;
}

+ (instancetype)tjs_makeCellForNibTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    

    TJSBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if (!cell) {
        
        NSString *nibName = NSStringFromClass([self class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:nil];
        
        [tableView registerNib:nib forCellReuseIdentifier:_identifier];
        
        cell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



@end
