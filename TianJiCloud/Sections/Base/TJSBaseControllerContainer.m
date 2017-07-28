//
//  TJSBaseControllerContainer.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/28.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "TJSBaseControllerContainer.h"

@interface TJSBaseControllerContainer ()<UIScrollViewDelegate>

@property (weak, nonatomic) UIScrollView *contentScroll;

@end

@implementation TJSBaseControllerContainer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    
    [self tjs_setupChildViewControllers];
    
    [self contentScroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


#pragma mark - getters

- (UIScrollView *)contentScroll
{
    if(_contentScroll == nil)
    {
        UIScrollView *title =[[UIScrollView alloc]initWithFrame:self.view.bounds];
        title.delegate = self;
        title.pagingEnabled = YES;
        title.bounces = NO;
        title.showsHorizontalScrollIndicator = NO;

        title.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width * self.childViewControllers.count);
        
        [self.view addSubview:(_contentScroll = title)];
    }
    return _contentScroll;
}


#pragma mark - TJSBaseControllerContainerProtocol

- (UIScrollView *)tjs_contentScroll{

       return _contentScroll;
}



#pragma mark - UIScrollViewDelegate

/**
 *  1.scrollView结束了滚动动画以后就会调用这个方法,
 
 2.手动拖动动画结束后不调用,是在scrollViewDidEndDecelerating里调用了的
 
 （比如- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;方法执行的动画完毕后）
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //这里主要处理 contentScroll停止滚动后，上下内容的联动
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / scrollView.frame.size.width;
    UIViewController *willShowVC = self.childViewControllers[index];
    
    if(![willShowVC isViewLoaded])
    {
        willShowVC.view.frame = CGRectMake(offsetX,0, scrollView.width, scrollView.height);
        
        [self.contentScroll addSubview:willShowVC.view];
    }
}

/**
 * 手指松开scrollView后，scrollView停止减速完毕就会调用这个
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/**
 * 只要scrollView在滚动，就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   //这里主要是做滚动的时候，头部渐变



}




@end
