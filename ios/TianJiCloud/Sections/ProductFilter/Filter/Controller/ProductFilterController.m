//
//  ProductFilterController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "ProductFilterController.h"

#import "ProducFilterVCConfig.h"
#import "TJSProductFilterConfigurator.h"


@interface ProductFilterController ()

@property (nonatomic,strong)ProducFilterVCConfig *config;
@property (nonatomic,strong)TJSProductFilterConfigurator *configurator;
@property (nonatomic,weak) id<TJSProductFilterInteractor> interactor;


@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

@implementation ProductFilterController

- (void)dealloc {
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - setupConfig

- (void)setupConfig{

    ProducFilterVCConfig *config = [[ProducFilterVCConfig alloc]init];
    [config setup:self];
    [config resetBtnConfig:self.resetBtn];
    [config sureBtnConfig:self.sureBtn];
    _config = config;
}

- (void)setupConfigurator{

    TJSProductFilterConfigurator *configurator = [[TJSProductFilterConfigurator alloc]init];
    _configurator = configurator;
    [configurator setup:self];
}


#pragma mark - TJSBaseVCConfig
- (void)tjs_configBaseView{
    
    WEAK_SELF(self);
    [self.resetBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        STRONG_SELF(self);
        if(self){
            [self.interactor resetFilterParamas];
        }
    }];
    
    [self.sureBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        STRONG_SELF(self);
        if(self){
            
            id params = [self.interactor filterParamas];
            [UIViewController tjs_pushViewController:ProductFilterResultVC params:@{@"keys":params} animated:YES];
        }
    }];
}

- (UIScrollView *)tjs_listView{
    
    return _filterCollectionView;
}




@end
