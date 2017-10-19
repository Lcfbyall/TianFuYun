//
//  ProductFilterResultTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/10.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterResultTableAdapter.h"
#import "ProductFilterResultCell.h"

static NSString *const identifier = @"ProductFilterResultCell";
@interface ProductFilterResultTableAdapter ()

@property (nonatomic,weak)UITableView *tableView;


@end

@implementation ProductFilterResultTableAdapter


- (instancetype)initWithTableView:(UITableView *)tableView{
  
    self = [super init];
    if(self){
    
        _tableView = tableView;
        
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView{

    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProductFilterResultCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.interactor.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    return cell;
    
}

#pragma mark - <UITableViewDelegate>



@end
