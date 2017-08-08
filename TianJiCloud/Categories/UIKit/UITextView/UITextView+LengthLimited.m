//
//  UITextView+LengthLimited.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UITextView+LengthLimited.h"

@implementation UITextView (LengthLimited)


- (BOOL)tjs_shouldChangeTextInRange:(NSRange)range
                    replacementText:(NSString *)text
                       maxLimitNums:(NSInteger)maxLimitNums {
    
    UITextRange *selectedRange = [self markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [self positionFromPosition:selectedRange.start offset:0];
    //获取高亮部分内容
    //NSString * selectedtext = [textView textInRange:selectedRange];
    
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if (selectedRange && pos) {
        
        NSInteger startOffset = [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.start];
        
        NSInteger endOffset = [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.end];
        
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        
        if (offsetRange.location < maxLimitNums) {
            
            return YES;
        }
        else
        {
            return NO;
        }
    }
    
    NSString *comcatstr = [self.text stringByReplacingCharactersInRange:range withString:text];
    
    NSInteger caninputlen = maxLimitNums - comcatstr.length;
    
    if (caninputlen >= 0)
    {
        return YES;
    }
    else
    {
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        
        if (rg.length > 0)
        {
            NSString *s = @"";
            //判断是否只普通的字符或asc码(对于中文和表情返回NO)
            BOOL asc = [text canBeConvertedToEncoding:NSASCIIStringEncoding];
            if (asc) {
                s = [text substringWithRange:rg];//因为是ascii码直接取就可以了不会错
            }
            else
            {
                __block NSInteger idx = 0;
                __block NSString  *trimString = @"";//截取出的字串
                //使用字符串遍历，这个方法能准确知道每个emoji是占一个unicode还是两个
                [text enumerateSubstringsInRange:NSMakeRange(0, [text length])
                                         options:NSStringEnumerationByComposedCharacterSequences
                                      usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                                          
                      if (idx >= rg.length) {
                          *stop = YES; //取出所需要就break，提高效率
                          return ;
                      }
                      
                      trimString = [trimString stringByAppendingString:substring];
                      
                      idx++;
                }];
                
                s = trimString;
            }
            
            //rang是指从当前光标处进行替换处理(注意如果执行此句后面返回的是YES会触发didchange事件)
            [self setText:[self.text stringByReplacingCharactersInRange:range withString:s]];
        }
        return NO;
    }
}

- (void)tjs_didChangeMaxLimitNums:(NSInteger)maxLimitNums {
    
    
    UITextRange *selectedRange = [self markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [self positionFromPosition:selectedRange.start offset:0];
    
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    
    NSString  *nsTextContent = self.text;
    NSInteger existTextNum = nsTextContent.length;
    
    if (existTextNum > maxLimitNums)
    {
        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        NSString *s = [nsTextContent substringToIndex:maxLimitNums];
        
        [self setText:s];
    }
    

}

#pragma mark - setter & getter

- (void)setTjs_minLimitNums:(NSInteger)tjs_minLimitNums{
 
    objc_setAssociatedObject(self, @selector(tjs_minLimitNums), @(tjs_minLimitNums), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)tjs_minLimitNums{
    
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setTjs_maxLimitNums:(NSInteger)tjs_maxLimitNums{
  
    objc_setAssociatedObject(self, @selector(tjs_maxLimitNums), @(tjs_maxLimitNums), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSInteger)tjs_maxLimitNums{

  return [objc_getAssociatedObject(self, _cmd) integerValue];
}


@end
