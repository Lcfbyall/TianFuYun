//
//  DiscoRoadShowListController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoRoadShowListController.h"
#import "DiscoRoadShowConfig.h"
#import "DiscoRoadShowConfigurator.h"
#import "ZFPlayer.h"
#import "DiscoRoadShowInfoModel.h"


@interface DiscoRoadShowListController ()<ZFPlayerDelegate>

@property (nonatomic,strong) DiscoRoadShowConfig *config;

@property (nonatomic,strong) DiscoRoadShowConfigurator *configurator;

@property (nonatomic,weak) id<DiscoRoadShowListInteractor> interactor;

@property (weak, nonatomic) IBOutlet UICollectionView *showlist;

@property (nonatomic, strong) ZFPlayerView        *playerView;

@property (nonatomic, strong) ZFPlayerControlView *controlView;

@end

@implementation DiscoRoadShowListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupConfig];
    
    [self setupConfiguator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


#pragma mark - <Config>

- (void)setupConfig{

    _config = [[DiscoRoadShowConfig alloc]init];
    
    [_config setup:self];
}

- (void)setupConfiguator{

    _configurator = [[DiscoRoadShowConfigurator alloc]init];
    
    [_configurator setup:self];
}


#pragma mark - <TJSBaseVCConfig>

- (void)tjs_configBaseView{

[super tjs_configBaseView];
}

- (UIScrollView *)tjs_listView{
 
    return _showlist;
}


#pragma mark - <TJSBaseCollectionViewCellDelegate>

- (BOOL)onTapCell:(id)value{

    [UIViewController tjs_pushViewController:DiscoryRoadShowDetailVC params:@{@"webUrl":@"http://wandou.im/1ig5qp"} animated:YES];
  
    return YES;
}

- (void)onTapControl:(UIControl *)control value:(id)value{
  
    DiscoRoadShowInfoModel *model = (DiscoRoadShowInfoModel *)value;

    // 设置播放控制层和model
    [self.playerView playerControlView:nil playerModel:model.videoInfo];
    
    // 下载功能
    self.playerView.hasDownload = NO;
    // 自动播放
    [self.playerView autoPlayTheVideo];
}


#pragma mark - <ZFPlayerDelegate>

/** 返回按钮事件 */
- (void)zf_playerBackAction{

}

/** 下载视频 */
- (void)zf_playerDownload:(NSString *)url{

}

/** 控制层即将显示 */
- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen{

}

/** 控制层即将隐藏 */
- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen{


}

#pragma mark - setter & getter

- (ZFPlayerView *)playerView {
    
    if (!_playerView) {
        
        _playerView = [ZFPlayerView sharedPlayerView];
        _playerView.delegate = self;
        // 当cell播放视频由全屏变为小屏时候，不回到中间位置
        _playerView.cellPlayerOnCenter = NO;
        
        // 当cell划出屏幕的时候停止播放
        // _playerView.stopPlayWhileCellNotVisable = YES;
        //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
        // _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
        // 静音
        // _playerView.mute = YES;
    }
    return _playerView;
}

- (ZFPlayerControlView *)controlView {
    
    if (!_controlView) {
        _controlView = [[ZFPlayerControlView alloc] init];
    }
    return _controlView;
}

@end
