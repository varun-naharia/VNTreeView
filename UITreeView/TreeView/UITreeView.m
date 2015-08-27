//
//  UITreeView.m
//  UITreeView
//
//  Created by Varun Naharia on 26/08/15.
//  
//

#import "UITreeView.h"


@implementation UITreeView

@synthesize cat,treeViewFont,selectedArray;

-(id)initWithFrame:(CGRect)frame andData:(NSMutableDictionary *)dict
{
    
    self = [super initWithFrame:frame];
    self.delegate=self;
    self.dataSource=self;
    treeNode = [[TreeNode alloc] initWithValue:@"Root"];
    selectedArray= [[NSMutableArray alloc] init];
    if (self) {
        // Initialization code
        cat = [dict copy];
       [self createNode:cat andSuperView:treeNode];
        self.separatorStyle= UITableViewCellSeparatorStyleNone;
        treeViewFont = [UIFont fontWithName:@"Ariel" size:20];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)createNode:(NSMutableDictionary *)parentdict andSuperView:(TreeNode *)treenode
{
    NSMutableDictionary *childdict = [[NSMutableDictionary alloc] init];
    
    TreeNode *node1 ;
//    if(![parentdict isKindOfClass:[NSNull class]]) ***** if below dosen't work ****
    if(![parentdict isEqual:@""])
    {
        if([parentdict valueForKey:@"name"] )
        {
            
            int count = (int)[[parentdict valueForKey:@"name"] count];
            for (int y = 0; y<count; y++) {
               // NSLog(@"%@",[[parentdict valueForKey:@"name"] objectAtIndex:y]);
                node1 = [[TreeNode alloc] initWithValue:[[parentdict valueForKey:@"name"] objectAtIndex:y]];
                node1.category_id = [[[parentdict valueForKey:@"category_id"] objectAtIndex:y] intValue];
                node1.parent_id = [[[parentdict valueForKey:@"parent_id"] objectAtIndex:y] intValue];
                node1.product_count = [[[parentdict valueForKey:@"product_count"] objectAtIndex:y] intValue];
                [treenode addChild:node1];
                
                
                
                childdict =[[parentdict valueForKey:@"categories"] objectAtIndex:y];
                [self createNode:childdict andSuperView:node1];
                
            }
            
        }
        
        
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [treeNode descendantCount];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
   	TreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
    TreeViewCell *cell = [[TreeViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:CellIdentifier
                                                           level:[node levelDepth] - 1
                                                        expanded:node.inclusive
                                                        isSelected:node.isSelected];
    cell.valueLabel.text = node.value;
    cell.valueLabel.font = treeViewFont;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.delegate=self;
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
   
    NSLog(@"%d",node.category_id);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%d",cell.isSelected);
    
    if (!node.hasChildren) return;
    
    node.inclusive = !node.inclusive;
    [treeNode flattenElementsWithCacheRefresh:YES];
    [tableView reloadData];
}


-(void)setTreeViewFont:(UIFont *)font
{
//    NSLog(@"%@",font);
    treeViewFont = font;
    [self reloadData];
}
-(void)CellChecked:(BOOL)value andCell:(UITableViewCell *)cell
{
    NSIndexPath *indexPath = [self indexPathForCell:cell];
//    NSLog(@"%@",indexPath.description);
    TreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
    node.isSelected=value;
    
    if(value)
    {
        [selectedArray addObject:[NSString stringWithFormat:@"%d",node.category_id]];
    }
    else
    {
        [selectedArray removeObject:[NSString stringWithFormat:@"%d",node.category_id]];
    }
    NSLog(@"%@",selectedArray);
}

-(NSMutableArray *)getSelectedValue
{
    return selectedArray;
}


@end
