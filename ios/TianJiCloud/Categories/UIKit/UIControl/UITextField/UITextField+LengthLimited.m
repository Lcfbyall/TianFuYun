//
//  UITextField+LengthLimited.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UITextField+LengthLimited.h"

@implementation UITextField (LengthLimited)

/*
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
 
 if(range.length + range.location > textField.text.length){
 return NO;
 }
 
 NSUInteger newLenght = [textField.text length] + [string length] - range.length;
 
 return newLength <= maxLength;
 
 }
 
 这样在输入全部是英文的情况下是可以的. 但是当输入是中文时, 由于shouldChangeCharactersInRange判断的是当前键盘的字符数, 会出现这样的问题: 比如你还剩下2个字可以打, 你想输入"张三", "张"的拼音是Zhang, 于是你在输入Zh的时候就无法输入了. 显然, 这样的结果不是我们想要的.
 
 而且, shouldChangeCharactersInRange也没有响应最后拼音到汉字的过程.
 
 */



/*
 - (BOOL)tjs_shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text maxLimitNums:(NSInteger)maxLimitNums{
 
 //return按钮点击
 if ([self.delegate textFieldShouldReturn:self] && [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location != NSNotFound) {
 
 return NO;
 }
 
 //取得高亮部分，markedTextRange如果为Nil的话就说明你现在没有未选中的字符，可以计算文字长度。否则此时计算出来的字符长度可能不正确。
 UITextRange *markedTextRange = [self markedTextRange];
 //UITextPosition *pos = [self positionFromPosition:selectedRange.start offset:0];
 NSString *textInrange = [self textInRange:markedTextRange];
 
 //光标位置
 UITextRange *selectedRange = [self selectedTextRange];
 
 //有高亮选择的字，就允许？？？
 if (markedTextRange) {
 return YES;
 }
 
 
 //统计文字字符长度
 NSString *modifiedText = [self.text stringByReplacingCharactersInRange:range withString:text];
 const BOOL willModifyText = modifiedText.length <= maxLimitNums;
 
 return willModifyText;
 }
 */

//字符
- (void)tjs_didChangeMaxLimitNums:(NSInteger)maxLimitNums{
    
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position   = [self positionFromPosition:selectedRange.start offset:0];
    __unused NSString *textInrange = [self textInRange:selectedRange];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
    if(!position){
        
        if (self.text.length > maxLimitNums) {
            
            NSString *text = self.text;
            //判断是否只普通的字符或asc码(对于中文和表情返回NO)
            BOOL ASCII = [text canBeConvertedToEncoding:NSASCIIStringEncoding];
            if (ASCII) {
                
                //因为是ascii码直接取就可以了不会错
                self.text = [text substringToIndex:maxLimitNums];
                
                
            }else{
                
                //中文和表情
                __block NSInteger index = 0;
                [text enumerateSubstringsInRange:NSMakeRange(0,[text length])
                                         options:NSStringEnumerationByComposedCharacterSequences
                                      usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                                          
                                          if (index + substring.length > maxLimitNums) {
                                              *stop = YES;
                                              return ;
                                          }
                                          
                                          index += substring.length;
                                      }];
                
                self.text = [self.text substringToIndex:index];
            }
        }
    }
}

//字符
- (void)tjs_didChangeMaxInputLimitNums:(NSInteger)maxLimitNums{
    
    NSUInteger _maxLength = maxLimitNums;
    NSString *text = self.text;
    //高亮
    UITextRange *markedTextRange = [self markedTextRange];
    UITextPosition *position     = [self positionFromPosition:markedTextRange.start offset:0];
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
    if (!position){
        
        //---字符处理
        if (text.length > _maxLength){
            
            //中文和emoj表情存在问题，需要对此进行处理
            NSRange range;
            NSUInteger inputLength = 0;
            for(int i=0; i < text.length && inputLength <= _maxLength; i += range.length) {
                
                range = [self.text rangeOfComposedCharacterSequenceAtIndex:i];
                
                inputLength += [text substringWithRange:range].length;
                if (inputLength > _maxLength) {
                    
                    NSString* newText = [text substringWithRange:NSMakeRange(0, range.location)];
                    self.text = newText;
                }
            }
        }
    }
}

//字节
- (void)tjs_didChangeMaxBytesLimitNums:(NSInteger)maxLimitNums{
    
    NSUInteger _maxBytesLength = maxLimitNums;
    NSString *text = self.text;
    
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
    
    if (!position){
        
        //---字节处理
        //Limit
        NSUInteger textBytesLength = [self.text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        if (textBytesLength > _maxBytesLength) {
            
            //中文和emoj表情存在问题，需要对此进行处理
            NSRange range;
            NSUInteger byteLength = 0;
            for(int i=0; i < text.length && byteLength <= _maxBytesLength; i += range.length) {
                
                range = [self.text rangeOfComposedCharacterSequenceAtIndex:i];
                byteLength += strlen([[text substringWithRange:range] UTF8String]);
                if (byteLength > _maxBytesLength) {
                    
                    NSString* newText = [text substringWithRange:NSMakeRange(0, range.location)];
                    self.text = newText;
                }
            }
        }
    }
}

/*
 UITextRange* selectedRange     = textField.selectedTextRange;
 UITextPosition* beginning2     = textField.beginningOfDocument;
 UITextPosition* selectionStart = selectedRange.start;
 UITextPosition* selectionEnd   = selectedRange.end;
 NSInteger location = [textField offsetFromPosition:beginning2 toPosition:selectionStart];
 NSInteger length = [textField offsetFromPosition:selectionStart toPosition:selectionEnd];
 */



@end
