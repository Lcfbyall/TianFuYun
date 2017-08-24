//
//  TJSMineHomeLayoutImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSMineHomeLayoutImpl.h"

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
    
    
    /*
     UIColor * color = UIColorFromHEX(0x007cf4);
     CGFloat offset = scrollView.contentOffset.y;
     if (offset > -_headerHeight) {
     //CGFloat alpha = MIN(1,fabs(offset+_headerHeight) / 64.0);
     scrollView.tjs_viewController.navigationController.navigationBar.barTintColor = [UIColor redColor];
     } else {
     scrollView.tjs_viewController.navigationController.navigationBar.barTintColor = [color colorWithAlphaComponent:1];
     }
     */
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
