//
//  TJSProductFilterInteractorImpl.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSProductFilterInteractorImpl.h"

@implementation TJSProductFilterInteractorImpl


#pragma mark - <TJSProductFilterInteractor>

//数据

- (void)loadFilterParamas:(void (^)(NSArray *paramas, NSError *error))callback{

    WEAK_SELF(self);
    [self.dataSource loadFilterParamas:^(NSArray *paramas, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
        
            if(callback){
                
                callback(paramas,error);
            }
        }
        
    }];
    
}

- (NSArray *)items{
  
    return self.dataSource.items;
}

//

- (NSArray *)filterParamas{
  
    return [self.dataSource filterParamas];
}

- (void)resetFilterParamas{
  
    [self.dataSource resetFilterParamas];
    
    [self.layout reloadCollect];
}

- (UICollectionViewLayout *)collectionViewLayout{
  
    return self.dataSource.collectionViewLayout;
}


#pragma mark - <ProductFilterLayoutDelegate>

- (void)onRefresh{
    
    //请求
    WEAK_SELF(self);
    [self loadFilterParamas:^(NSArray *paramas, NSError *error) {
        
        STRONG_SELF(self);
        if(self){
        
            [self.layout reloadCollect];
            
            //结束刷新
            [self.layout endRefresh];
        }
    }];
}


@end
