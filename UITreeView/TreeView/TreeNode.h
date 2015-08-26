//
//  TreeNode.h
//  TreeNodePrototype
//
//  Created by Varun Naharia on 26/08/15.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@interface TreeNode : NSObject {
	int index;
	NSString *value;
	TreeNode *parent;
	NSMutableArray *children;
	BOOL inclusive;
	NSArray *flattenedTreeCache;
}

@property (nonatomic) int index;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) TreeNode *parent;
@property (nonatomic, retain, readonly) NSMutableArray *children;
@property (nonatomic) BOOL inclusive;
@property int category_id;
@property int parent_id;
@property int product_count;
@property BOOL isSelected;


- (id)initWithValue:(NSString *)_value;

- (void)addChild:(TreeNode *)newChild;
- (NSUInteger)descendantCount;
- (NSUInteger)levelDepth;
- (NSArray *)flattenElements;
- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate;
- (BOOL)isRoot;
- (BOOL)hasChildren;

@end
