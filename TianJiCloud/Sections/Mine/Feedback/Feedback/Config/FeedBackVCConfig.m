//
//  FeedBackVCConfig.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "FeedBackVCConfig.h"
#import "FeedbackViewController.h"



static NSString *const tjs_placeholder  = @"感谢您对天富云的关注，请详细描述您的问题或建议，我们将及时为您解决！（8-300个字符）";

@interface FeedBackVCConfig ()<UITextViewDelegate>

@property (nonatomic,weak)FeedbackViewController *vc;

@end

@implementation FeedBackVCConfig

- (void)setup:(FeedbackViewController *)vc{
  
    _vc = vc;
    
    _vc.view.backgroundColor = ThemeService.weak_color_00;

}



#pragma mark - <FeedBackVCConfig>

- (void)textViewConfig:(UITextView *)textView{

    textView.delegate = self;
    textView.backgroundColor = ThemeService.main_color_00;
    textView.font = [UIFont systemFontOfSize:14.0f];
    textView.textColor = ThemeService.text_color_01;
    textView.tjs_placeholderColor = ThemeService.text_color_02;
    textView.tjs_placeholderFont = [UIFont systemFontOfSize:14.0f];
    textView.tjs_placeholder = tjs_placeholder;
    textView.tjs_minLimitNums = 8;
    textView.tjs_maxLimitNums = 300;
    textView.textAlignment = NSTextAlignmentLeft;
    textView.allowsEditingTextAttributes = YES;
    textView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    textView.editable = YES;
    textView.selectable = YES;
    textView.clearsOnInsertion = YES;
    textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //UITextInputTraits
    textView.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    textView.autocorrectionType = UITextAutocorrectionTypeDefault;
    textView.spellCheckingType = UITextSpellCheckingTypeDefault;
    textView.keyboardType = UIKeyboardTypeDefault;
    textView.keyboardAppearance = UIKeyboardAppearanceDefault;
    textView.returnKeyType = UIReturnKeyDefault;
    textView.enablesReturnKeyAutomatically = YES;
    textView.secureTextEntry = NO;
    //textView.textContentType = UITextContentTypeName;
    
}

- (void)commitButtonConfig:(UIButton *)btn{
   
    [btn tjs_commitBtnStateConfigWithNormalTitle:@"反馈问题"];
    
    btn.enabled = NO;
}


#pragma mark - <UITextViewDelegate>

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{

    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{

    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{

}

- (void)textViewDidEndEditing:(UITextView *)textView{


}

- (BOOL)textView:(UITextView *)textView
   shouldChangeTextInRange:(NSRange)range
           replacementText:(NSString *)text{

    return [textView tjs_shouldChangeTextInRange:range replacementText:text maxLimitNums:textView.tjs_maxLimitNums];
    
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{

    [textView tjs_didChangeMaxLimitNums:textView.tjs_maxLimitNums];
    
    if([_vc conformsToProtocol:@protocol(FeedBackVCInteractor)] && [_vc respondsToSelector:@selector(textView_DidChange:)]){
    
        [_vc textView_DidChange:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView{


}

- (BOOL)textView:(UITextView *)textView
  shouldInteractWithURL:(NSURL *)URL
                inRange:(NSRange)characterRange
            interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){

    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment
         inRange:(NSRange)characterRange
     interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){

    return YES;
}

@end




