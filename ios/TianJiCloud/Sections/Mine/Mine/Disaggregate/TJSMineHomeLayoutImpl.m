//
//  TJSMineHomeLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeLayoutImpl.h"
#import "TJSBaseViewController.h"


@interface TJSMineHomeLayoutImpl ()

@property (nonatomic,strong)  UITableView *tableView;
@property (nonatomic,weak)    id<TJSMineHomeLayoutDelegate> delegate;

@end
@implementation TJSMineHomeLayoutImpl

- (instancetype)initWithTableView:(UITableView *)tableView{

    self = [super init];
    if(self){
        
        _tableView = tableView;
        
        //[self setupRefreshControl];
    }
    
    return self;
}

- (void)dealloc{
    
    
}


#pragma mark - <TJSMineHomeLayout>

- (void)reloadTable{
  
    [self.tableView reloadData];
}

- (void)reloadTableHeader{

    [self.tableView tjs_reloadTableHeader];
}

- (void)beginRefresh{
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)endRefresh{
    
    [self.tableView.mj_header endRefreshing];
}

- (void)remove:(NSArray <NSIndexPath *>*)indexPaths{
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
    [scrollView.tjs_viewController.view endEditing:YES];
    TJSBaseViewController *vc = (TJSBaseViewController *)scrollView.tjs_viewController;

    CGFloat headerH = SCREEN_WIDTH/1.75;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = -offset/headerH -0.5;
    if (offset > -headerH) {
         [vc.navigationController.navigationBar tjs_setBackgroundAlpha:alpha];
    } else {
        [vc.navigationController.navigationBar tjs_setBackgroundAlpha:1];
    }
    
    NSMutableDictionary *p = [vc.params mutableCopy];
    [p setObject:@(alpha) forKey:NavBarBackgroundAlpha];
    vc.params = [p copy];
    
}


#pragma mark -

- (void)setupRefreshControl{
    
    WEAK_SELF(self);
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        STRONG_SELF(self);
        
        if(self){
            
            if ([self.delegate respondsToSelector:@selector(onRefresh)])
            {
                [self.delegate onRefresh];
            }
            
        }
        
    }];
}


@end
