//
//  UISearchBar+TJSBlock.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UISearchBar+TJSBlock.h"
#import <objc/runtime.h>


typedef BOOL (^UISearchBarReturnBlock) (UISearchBar *searchBar);
typedef void (^UISearchBarVoidBlock)   (UISearchBar *searchBar);

typedef void (^UISearchBarTextDidChange)(UISearchBar *searchBar,NSString *searchText);
typedef BOOL (^UISearchBarShouldChangeTextInRange) (UISearchBar *searchBar,NSRange range,NSString *text);
;
typedef void (^UISelectedScopeButtonIndexDidChange)(UISearchBar *searchBar,NSInteger selectedScope);




static const void *UISearchBarDelegateKey = &UISearchBarDelegateKey;


@interface UISearchBar ()


@end

@implementation UISearchBar (TJSBlock)


#pragma mark UITextField Delegate methods

// return NO to not become first responder
+ (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    UISearchBarReturnBlock block = searchBar.searchBarShouldBeginEditing;
    if (block) {
        return block(searchBar);
    }
    
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]) {
        
        return [delegate searchBarShouldBeginEditing:searchBar];
    }
    
    // return default value just in case
    return YES;
}


// called when text starts editing
+ (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{

    UISearchBarVoidBlock block = searchBar.searchBarTextDidBeginEditing;
    if (block) {
        
         block(searchBar);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]) {
        
         [delegate searchBarTextDidBeginEditing:searchBar];
    }
}


// return NO to not resign first responder
+ (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{

    UISearchBarReturnBlock block = searchBar.searchBarShouldEndEditing;
    if (block) {
        return block(searchBar);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]) {
        
        return [delegate searchBarShouldEndEditing:searchBar];
    }
    
    return YES;
}

// called when text ends editing

+ (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{

    UISearchBarVoidBlock block = searchBar.searchBarTextDidEndEditing;
    if (block) {
         block(searchBar);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]) {
        
         [delegate searchBarTextDidEndEditing:searchBar];
    }
}

// called when text changes (including clear)
+ (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    UISearchBarTextDidChange block = searchBar.searchBarTextDidChange;
    if (block) {
        
         block(searchBar,searchText);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBar:textDidChange:)]) {
        
         [delegate searchBar:searchBar textDidChange:searchText];
    }
}

// called before text changes
+ (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0){

    UISearchBarShouldChangeTextInRange block = searchBar.searchBarShouldChangeTextInRange;
    
    if (block) {
        
       return  block(searchBar,range,text);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)]) {
        
        return  [delegate searchBar:searchBar shouldChangeTextInRange:range replacementText:text];
    }
    
    return YES;
}

// called when keyboard search button pressed

+ (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    UISearchBarVoidBlock block = searchBar.searchBarSearchButtonClicked;
    if (block) {
        
        block(searchBar);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]) {
        
        [delegate searchBarSearchButtonClicked:searchBar];
    }
}

// called when bookmark button pressed
+ (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED{

    UISearchBarVoidBlock block = searchBar.searchBarBookmarkButtonClicked;
    if (block) {
        
        block(searchBar);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarBookmarkButtonClicked:)]) {
        
        [delegate searchBarBookmarkButtonClicked:searchBar];
    }
}

// called when cancel button pressed
+ (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED{

    UISearchBarVoidBlock block = searchBar.searchBarCancelButtonClicked;
    if (block) {
        
        block(searchBar);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]) {
        
        [delegate searchBarCancelButtonClicked:searchBar];
    }
}

// called when search results button pressed
+ (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED{

    
    UISearchBarVoidBlock block = searchBar.searchBarResultsListButtonClicked;
    if (block) {
        
        block(searchBar);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBarResultsListButtonClicked:)]) {
        
        [delegate searchBarResultsListButtonClicked:searchBar];
    }
}

+ (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0){


    UISelectedScopeButtonIndexDidChange block = searchBar.selectedScopeButtonIndexDidChange;

    if (block) {
        
        block(searchBar,selectedScope);
    }
    
    id delegate = objc_getAssociatedObject(self, UISearchBarDelegateKey);
    
    if ([delegate respondsToSelector:@selector(searchBar:selectedScopeButtonIndexDidChange:)]) {
        
        [delegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
    
}



#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UISearchBar will use blocks if no delegate is set.
 */

- (void)setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UISearchBarDelegate>)[self class])
    {
        objc_setAssociatedObject(self, UISearchBarDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        
        self.delegate = (id<UISearchBarDelegate>)[self class];
    }
}


#pragma mark - setters && getters


//////////////////////
- (BOOL (^)(UISearchBar *))searchBarShouldBeginEditing{

    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSearchBarShouldBeginEditing:(BOOL (^)(UISearchBar *))searchBarShouldBeginEditing{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarShouldBeginEditing), searchBarShouldBeginEditing, OBJC_ASSOCIATION_COPY);

}

- (void (^)(UISearchBar *))searchBarTextDidBeginEditing{

   return objc_getAssociatedObject(self, _cmd);
}

- (void)setSearchBarTextDidBeginEditing:(void (^)(UISearchBar *))searchBarTextDidBeginEditing{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarTextDidBeginEditing), searchBarTextDidBeginEditing, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *))searchBarShouldEndEditing{

return objc_getAssociatedObject(self, _cmd);

}

- (void)setSearchBarShouldEndEditing:(BOOL (^)(UISearchBar *))searchBarShouldEndEditing{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarShouldEndEditing), searchBarShouldEndEditing, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))searchBarTextDidEndEditing{

  return objc_getAssociatedObject(self, _cmd);
}

- (void)setSearchBarTextDidEndEditing:(void (^)(UISearchBar *))searchBarTextDidEndEditing{


    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarTextDidEndEditing), searchBarTextDidEndEditing, OBJC_ASSOCIATION_COPY);
}


//////////////////////

- (void (^)(UISearchBar *searchBar,NSString *searchText))searchBarTextDidChange{

   return objc_getAssociatedObject(self, _cmd);
}

- (void)setSearchBarTextDidChange:(void (^)(UISearchBar *, NSString *))searchBarTextDidChange{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarTextDidChange), searchBarTextDidChange, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *searchBar,NSRange range,NSString *text))searchBarShouldChangeTextInRange{

return objc_getAssociatedObject(self, _cmd);
}

- (void)setSearchBarShouldChangeTextInRange:(BOOL (^)(UISearchBar *, NSRange, NSString *))searchBarShouldChangeTextInRange{
    
    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarShouldChangeTextInRange), searchBarShouldChangeTextInRange, OBJC_ASSOCIATION_COPY);
}


//////////////////////

- (void (^)(UISearchBar *searchBar))searchBarSearchButtonClicked{
return objc_getAssociatedObject(self, _cmd);

}
- (void)setSearchBarSearchButtonClicked:(void (^)(UISearchBar *))searchBarSearchButtonClicked{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarSearchButtonClicked), searchBarSearchButtonClicked, OBJC_ASSOCIATION_COPY);
}


- (void (^)(UISearchBar *searchBar))searchBarBookmarkButtonClicked{
    return objc_getAssociatedObject(self, _cmd);
    
}
- (void)setSearchBarBookmarkButtonClicked:(void (^)(UISearchBar *))searchBarBookmarkButtonClicked{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarBookmarkButtonClicked), searchBarBookmarkButtonClicked, OBJC_ASSOCIATION_COPY);
}


- (void (^)(UISearchBar *searchBar))searchBarCancelButtonClicked{
    
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setSearchBarCancelButtonClicked:(void (^)(UISearchBar *))searchBarCancelButtonClicked{
    
    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarCancelButtonClicked), searchBarCancelButtonClicked, OBJC_ASSOCIATION_COPY);
}


- (void (^)(UISearchBar *searchBar))searchBarResultsListButtonClicked{
    
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setSearchBarResultsListButtonClicked:(void (^)(UISearchBar *))searchBarResultsListButtonClicked{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(searchBarResultsListButtonClicked), searchBarResultsListButtonClicked, OBJC_ASSOCIATION_COPY);
}


///////////////////////

- (void (^)(UISearchBar *searchBar,NSInteger selectedScope))selectedScopeButtonIndexDidChange{
    
    return objc_getAssociatedObject(self, _cmd);

}

- (void)setSelectedScopeButtonIndexDidChange:(void (^)(UISearchBar *,NSInteger))selectedScopeButtonIndexDidChange{

    [self setDelegateIfNoDelegateSet];
    
    objc_setAssociatedObject(self, @selector(selectedScopeButtonIndexDidChange), selectedScopeButtonIndexDidChange, OBJC_ASSOCIATION_COPY);
}




@end
