//
//  TJSProductListTableAdapter.m
//  TianJiStar
//
//  Created by 朱鹏 on 17/7/22.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductListTableAdapter.h"

#import "TJSProductInfoModel.h"

#import "TJSProductListCellFactory.h"


@interface TJSProductListTableAdapter ()

@property (nonatomic,strong) TJSProductListCellFactory *cellFactory;

@end


@implementation TJSProductListTableAdapter

- (instancetype)init{

    self = [super init];
    if(self){
     
        
        
    }
    return self;
}



#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    static NSString *identifier = @"TJSProductListTableAdapter";
    return [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
}


@end
