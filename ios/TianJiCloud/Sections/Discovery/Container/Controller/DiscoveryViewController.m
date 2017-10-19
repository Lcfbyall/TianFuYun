//
//  DiscoveryViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/27.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "DiscoveryViewController.h"

#import "DiscoveryVCConfig.h"

@interface DiscoveryViewController ()

@property (nonatomic,strong) DiscoveryVCConfig *discoveryConfig;

@property (nonatomic,assign) NSInteger selectedIndex;

@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDiscoveryConfig];

    [self scrollViewDidEndScrollingAnimation:self.tjs_contentScroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - settings

- (void)setDiscoveryConfig{

    DiscoveryVCConfig *discoveryConfig = [[DiscoveryVCConfig alloc]init];
    [discoveryConfig setup:self];
    
    self.navigationItem.titleView = [discoveryConfig tjs_titleView];
    
    _discoveryConfig = discoveryConfig;
}


#pragma mark - <DiscoveryVCConfig>

- (void)onTapSegmental:(id)sender{
  
    self.selectedIndex = ((UISegmentedControl *)sender).selectedSegmentIndex;
}


#pragma mark - <TJSBaseControllerContainerProtocol>

- (void)tjs_setupChildViewControllers{
  
    UIViewController *news  = LOAD_Storyboard(DiscoverySB, DiscoryNewsListVC);
    [self addChildViewController:news];
    
    UIViewController *shows = LOAD_Storyboard(DiscoverySB, DiscoryRoadShowListVC);
    [self addChildViewController:shows];
}


#pragma mark - settetrs

- (void)setSelectedIndex:(NSInteger)selectedIndex{
  
    _selectedIndex = selectedIndex;
    
    CGPoint offset  = CGPointMake(self.tjs_contentScroll.bounds.size.width * selectedIndex, self.tjs_contentScroll.contentOffset.y);
    [self.tjs_contentScroll setContentOffset:offset animated:YES];
}


#pragma mark - <UIScrollViewDelegate>

/**
 *  1.scrollView结束了滚动动画以后就会调用这个方法,
 
 2.手动拖动动画结束后不调用,是在scrollViewDidEndDecelerating里调用了的
    
   // 一定要有动画！！！才会调用
   // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    //这里主要处理 contentScroll停止滚动后，上下内容的联动
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / scrollView.frame.size.width;
    UIViewController *willShowVC = self.childViewControllers[index];
    if(![willShowVC isViewLoaded])
    {
        willShowVC.view.frame = CGRectMake(offsetX,0, scrollView.tjs_width,scrollView.tjs_height - (self.tabBarController?(49+64):0));
        [self.tjs_contentScroll addSubview:willShowVC.view];
    }
}

/**
 * 手指松开scrollView后，scrollView停止减速完毕就会调用这个
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / scrollView.frame.size.width;
    ((UISegmentedControl *)self.navigationItem.titleView).selectedSegmentIndex= index;
}

/**
 * 只要scrollView在滚动，就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //这里主要是做滚动的时候，头部渐变
    [super scrollViewDidScroll:scrollView];
    
    
    
    
}

@end





