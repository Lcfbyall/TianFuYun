//
//  TJSProductSearchVCProtocol.h
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/29.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSProductSearchVCProtocol_h
#define TJSProductSearchVCProtocol_h

@protocol ProductSearchVCConfig <NSObject>

- (void)searchBarTextDidChange:(UISearchBar *)searchBar
                    searchText:(NSString *)searchText;

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;


@end


#endif /* TJSProductSearchVCProtocol_h */
