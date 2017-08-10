//
//  ProductFilterItemModel.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/9.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterItemModel.h"

@implementation ProductFilterItemModel


+ (NSMutableArray *)items{
  
    //1.
    ProductFilterItemModel *section0 = [ProductFilterItemModel new];
    section0.type = @"产品分类";
    section0.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"集合信托",@"资管计划",@"债权基金",@"股权基金",@"证券基金"];
        NSArray *imgs = @[@"",@"",@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item0 = [ProductFilterItem new];
            item0.title = [titles objectAtIndex:idx];
            item0.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item0];
        }];
        items;
    });
    
    //2.
    ProductFilterItemModel *section1 = [ProductFilterItemModel new];
    section1.type = @"产品状态";
    section1.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"在售+预热",@"封闭",@"结束"];
        NSArray *imgs   = @[@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item1 = [ProductFilterItem new];
            item1.title = [titles objectAtIndex:idx];
            item1.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item1];
        }];
        items;
    });
    
    //3.
    ProductFilterItemModel *section2 = [ProductFilterItemModel new];
    section2.type = @"佣金";
    section2.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"1%以下",@"1%-3%",@"3%以上"];
        NSArray *imgs   = @[@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item1 = [ProductFilterItem new];
            item1.title = [titles objectAtIndex:idx];
            item1.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item1];
        }];
        items;
    });
    
    
    //4.
    ProductFilterItemModel *section3 = [ProductFilterItemModel new];
    section3.type = @"收益率";
    section3.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"7%以下",@"7-7.9%",@"8-8.9%",@"9-9.9%",@"10%以上",@"浮动"];
        NSArray *imgs   = @[@"",@"",@"",@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item1 = [ProductFilterItem new];
            item1.title = [titles objectAtIndex:idx];
            item1.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item1];
        }];
        items;
    });
    
    
    //5.
    ProductFilterItemModel *section4 = [ProductFilterItemModel new];
    section4.type = @"产品期限";
    section4.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"12个月以内",@"12个月",@"13-23个月",@"24个月",@"24个月以上"];
        NSArray *imgs   = @[@"",@"",@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item1 = [ProductFilterItem new];
            item1.title = [titles objectAtIndex:idx];
            item1.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item1];
        }];
        items;
    });
    
    
    //6.
    ProductFilterItemModel *section5 = [ProductFilterItemModel new];
    section5.type = @"付息方式";
    section5.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"按季付息",@"半年付息",@"按年付息",@"到期付息"];
        NSArray *imgs   = @[@"",@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item1 = [ProductFilterItem new];
            item1.title = [titles objectAtIndex:idx];
            item1.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item1];
        }];
        items;
    });
    
    
    
    //7.
    ProductFilterItemModel *section6 = [ProductFilterItemModel new];
    section6.type = @"评级";
    section6.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"AAA",@"AA",@"A",@"BBB",@"BB",@"B",@"CCC",@"CC",@"C"];
        NSArray *imgs   = @[@"",@"",@"",@"",@"",@"",@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item1 = [ProductFilterItem new];
            item1.title = [titles objectAtIndex:idx];
            item1.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item1];
        }];
        items;
    });
    
    
    //8.
    ProductFilterItemModel *section7 = [ProductFilterItemModel new];
    section7.type = @"投资领域";
    section7.items = ({
        
        NSMutableArray *items = [NSMutableArray array];
        
        NSArray *titles = @[@"工商企业类",@"金融市场类",@"基础建设类",@"房地产类",@"资金池类",@"其他类"];
        NSArray *imgs   = @[@"",@"",@"",@"",@"",@""];
        
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ProductFilterItem *item1 = [ProductFilterItem new];
            item1.title = [titles objectAtIndex:idx];
            item1.img   = [imgs objectAtIndex:idx];
            
            [items addObject:item1];
        }];
        items;
    });
    
    
    NSMutableArray *items = [NSMutableArray arrayWithObjects:section0,section1,section2,section3,section4,section5,section6,section7, nil];
    
    return items;
}

@end
