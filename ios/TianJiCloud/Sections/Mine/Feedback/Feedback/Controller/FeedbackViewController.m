//
//  FeedbackViewController.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FeedbackViewController.h"
#import "FeedbackCommitNetworkTool.h"
#import "FeedBackVCConfig.h"

@interface FeedbackViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *commitBtn;


@property (nonatomic,strong) FeedBackVCConfig *config;

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.a

    [self setupConfig];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - settings

- (void)setupConfig{

    FeedBackVCConfig *config = [[FeedBackVCConfig alloc]init];
    [config setup:self];
    _config = config;
    [config textViewConfig:self.textView];
    [config commitButtonConfig:self.commitBtn];
}


#pragma mark - <BaseVCConfig>

- (void)tjs_configBaseView{
[super tjs_configBaseView];
    [self.commitBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        [FeedbackCommitNetworkTool requestWithParameters:nil successCallback:^(id _Nullable data) {
        
        } failCallback:^(id _Nullable error) {
        
        }];
        
        self.textView.text = @"";
        [self textView_DidChange:self.textView];
    }];
}


#pragma mark - <FeedBackVCInteractor>

- (void)textView_DidChange:(UITextView *)textView{
    
    BOOL enabled = textView.text.length>=textView.tjs_minLimitNums?YES:NO;
    self.commitBtn.enabled = enabled;
}


@end
