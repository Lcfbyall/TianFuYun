//
//  UITableView+TJSTableHeader.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UITableView+TJSTableHeader.h"

@interface UITableView ()

@property (nonatomic,copy) void (^tjs_headerReloadBlock)(UITableView *tableView);

@end


@implementation UITableView (TJSTableHeader)

- (void)tjs_reloadTableHeader{

    if(self.tjs_headerReloadBlock)self.tjs_headerReloadBlock(self);
    
}

- (void)tjs_headerWithRefreshingBlock:(void (^)(UITableView *tableView))callback{

    self.tjs_headerReloadBlock = callback;
}


- (void)setTjs_headerReloadBlock:(void (^)(UITableView *))tjs_headerReloadBlock{

   objc_setAssociatedObject(self, @selector(tjs_headerReloadBlock), tjs_headerReloadBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UITableView *tableView))tjs_headerReloadBlock{

    return objc_getAssociatedObject(self, _cmd);
}

@end
