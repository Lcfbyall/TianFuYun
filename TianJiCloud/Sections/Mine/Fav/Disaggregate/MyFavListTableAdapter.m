//
//  MyFavListTableAdapter.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/8.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "MyFavListTableAdapter.h"

#import "TJSProductInfoModel.h"
#import "ProductListCell.h"

#import "TJSProductListCellFactory.h"
#import "TJSProductListCellLayoutConfig.h"

@interface MyFavListTableAdapter ()

@property (nonatomic,weak)  UITableView *tableView;

@property (nonatomic,strong) TJSProductListCellFactory *cellFactory;

@end

@implementation MyFavListTableAdapter

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    self = [super init];
    if(self){
        
        _tableView = tableView;
    
        _cellFactory = [[TJSProductListCellFactory alloc]init];
        
        [self setupTableView];
    }
    
    return self;
}


- (void)setupTableView{

   
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    id<MyFavListInteractor> interactor = self.interactor;
    
    return [[interactor items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    TJSBaseTableViewCell *cell = nil;
    
    id model = [[self.interactor items] objectAtIndex:indexPath.row];
    
    cell = [((TJSProductListCellFactory *)self.cellFactory)
            cellInTable:tableView
            forProductInfoModel:model];
    
    //cell 的 delegate 给 vc ,self.cellDelegate就是vc
    [(ProductListCell *)cell setDelegate:self.cellDelegate];
    
    [cell tjs_bindDataToCellWithValue:model];
    
    return cell;
    
}

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        TJSProductInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.row];
        
        [self.interactor deleteProduct:model callback:NULL];
    }
}
 */



#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    id modelInArray    = [[self.interactor items] objectAtIndex:indexPath.row];
    TJSProductInfoModel *model = (TJSProductInfoModel *)modelInArray;
    
    id<TJSProductCellLayoutConfig> layoutConfig =[TJSProductListCellLayoutConfig  sharedLayoutConfig];
    
    cellHeight = [layoutConfig contentSize:model cellWidth:SCREEN_WIDTH].height;
    
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    ProductListCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
    TJSProductInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.row];
    
    if([cell.delegate conformsToProtocol:@protocol(TJSBaseTableViewCellDelegate)] && [cell.delegate respondsToSelector:@selector(onTapCell:)]){
        
        [cell.delegate onTapCell:model];
    }    
}


// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    return UITableViewCellEditingStyleDelete;
}

/*
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED{

    return @"取消收藏";
}
 */

// supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{


     //UITableViewRowAction是iOS8才有的，title不想要打了空格占着大小
     UITableViewRowAction *rowAction = [UITableViewRowAction
     rowActionWithStyle:UITableViewRowActionStyleDefault
     title:@"取消收藏"
     handler:^(UITableViewRowAction*_Nonnull action,NSIndexPath*_Nonnull indexPath)
     {
     
         //if (editingStyle == UITableViewCellEditingStyleDelete) {
             
             TJSProductInfoModel *model = [[self.interactor items] objectAtIndex:indexPath.row];
             
             [self.interactor deleteProduct:model callback:NULL];
         //}
     
     }];
    
    rowAction.backgroundColor = ThemeService.main_color_01;
 
    return @[rowAction];
    
}


// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}


// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED{


}
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath __TVOS_PROHIBITED{


}



@end



