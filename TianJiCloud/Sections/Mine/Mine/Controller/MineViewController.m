//
//  MineViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MineViewController.h"

#import "MineHomeVCConfig.h"
//#import "TJSHomeListConfigurator.h"

@interface MineViewController ()

@property (nonatomic,strong) MineHomeVCConfig *homeConfig;
//@property (nonatomic,strong) TJSHomeListConfigurator *configurator;
//@property (nonatomic,strong) id<TJSHomeListInteractor> interactor;


@property (weak, nonatomic) IBOutlet UITableView *mineTableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setHomeConfig];
    
    [self setupConfigurator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - settings

- (void)setHomeConfig{

}

- (void)setupConfigurator{


}




#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{
    
    _mineTableView.backgroundColor = ThemeService.weak_color_10;
    _mineTableView.tableFooterView = [UIView new];
    
}

- (UIView *)tjs_listView{
    
    return _mineTableView;
}



#pragma mark - <MineHomeVCConfig>

- (void)onTapLeftBarBtnToSettingList:(id)sender{
   
    
}

- (void)onTapRightBarBtnToHideSum:(id)sender{


}

@end
