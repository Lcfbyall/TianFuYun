//
//  TJSBaseTableHeaderFooterView.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/3.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseTableHeaderFooterView.h"

static NSString *_identifier = nil;

@interface TJSBaseTableHeaderFooterView ()

@end

@implementation TJSBaseTableHeaderFooterView


+ (void)initialize{
  
    _identifier = NSStringFromClass([self class]);
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if(self){
    
        
        
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}


// 注册并创建 cell
+ (instancetype)tjs_makeHeaderFooterForAllocTableView:(UITableView *)tableView{

    TJSBaseTableHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:_identifier];
    
    if(!header){
    
        header = [[self alloc]initWithReuseIdentifier:_identifier];
    
    }

    return header;
}



// 注册并创建 xib cell
+ (instancetype)tjs_makeHeaderFooterForNibTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{

    TJSBaseTableHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:_identifier];
    
    if(!header){
    
        NSString *nibName = NSStringFromClass([self class]);
        UINib    *nib     = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
        
        [tableView registerNib:nib forHeaderFooterViewReuseIdentifier:_identifier];
        
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:_identifier];
        
    }

    return header;
}



@end
