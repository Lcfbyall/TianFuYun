//
//  UISearchBar+TJSBlock.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (TJSBlock)


//
@property (copy,nonatomic) BOOL (^searchBarShouldBeginEditing)(UISearchBar *searchBar);
@property (copy,nonatomic) void (^searchBarTextDidBeginEditing)(UISearchBar *searchBar);
@property (copy,nonatomic) BOOL (^searchBarShouldEndEditing)(UISearchBar *searchBar);
@property (copy,nonatomic) void (^searchBarTextDidEndEditing)(UISearchBar *searchBar);

//
@property (copy,nonatomic) void (^searchBarTextDidChange)(UISearchBar *searchBar,NSString *searchText);
@property (copy,nonatomic) BOOL (^searchBarShouldChangeTextInRange)(UISearchBar *searchBar,NSRange range,NSString *text);


//
@property (copy,nonatomic) void (^searchBarSearchButtonClicked)(UISearchBar *searchBar);
@property (copy,nonatomic) void (^searchBarBookmarkButtonClicked)(UISearchBar *searchBar);
@property (copy,nonatomic) void (^searchBarCancelButtonClicked)(UISearchBar *searchBar);
@property (copy,nonatomic) void (^searchBarResultsListButtonClicked)(UISearchBar *searchBar);


//
@property (copy,nonatomic) void (^selectedScopeButtonIndexDidChange)(UISearchBar *searchBar,NSInteger selectedScope);



@end
