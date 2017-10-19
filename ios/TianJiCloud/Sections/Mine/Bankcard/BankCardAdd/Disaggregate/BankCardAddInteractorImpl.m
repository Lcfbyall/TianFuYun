//
//  BankCardAddInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/14.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "BankCardAddInteractorImpl.h"
#import "BankPickerView.h"

@implementation BankCardAddInteractorImpl

#pragma mark - <BankCardAddInteractor>

- (void)addBankCard:(void (^)(id, NSError *))callback{
 
    [self.dataSource addBankCard:^(id result, NSError *error) {
        
        if(callback)callback(result,error);
        
        [UIViewController tjs_popViewControllerAnimated:YES];
    }];
}

- (NSArray *)items{
 
    return self.dataSource.items;
}

- (void)configWithBankCardInfo:(id)bankCardInfo{

    [self.dataSource configWithBankCardInfo:bankCardInfo];
}

- (void)showBank{

    WEAK_SELF(self);
    NSArray *banks = [self.dataSource banks];
    [BankPickerView showWithDatas:banks
                       defaultRow:[self.dataSource bankIndex]
                             done:^(NSInteger row) {

        STRONG_SELF(self);
        [self.dataSource fillingBank:[banks objectAtIndex:row]];
        [self.layout reloadTable];
    }];
}

- (BOOL)canCommit{
 
    return [self.dataSource canCommit];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self.layout scrollViewDidScroll:scrollView];
}



#pragma mark - <BankCardAddLayoutDelegate>

- (void)onRefresh{

    //[self.layout reloadTable];
    
    //[self.layout endRefresh];
}

@end
