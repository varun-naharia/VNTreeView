//
//  UITreeView.h
//  UITreeView
//
//  Created by Varun Naharia on 26/08/15.
//  
//

#import <UIKit/UIKit.h>
#import "TreeNode.h"
#import "TreeViewCell.h"


@interface UITreeView : UITableView<UITableViewDataSource,UITableViewDelegate,CellSelectedDelegate>{
    TreeNode *treeNode;
}

@property(nonatomic,retain)NSMutableDictionary *cat;
@property(nonatomic,retain)UIFont *treeViewFont;
@property(nonatomic,retain)NSMutableArray *selectedArray;

-(id)initWithFrame:(CGRect)frame andData:(NSMutableDictionary *)dict;
-(void)setTreeViewFont:(UIFont *)font;
-(NSMutableArray *)getSelectedValue;
@end
