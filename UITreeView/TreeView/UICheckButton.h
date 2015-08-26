//
//  UICheckButton.h
//  MyTreeViewPrototype
//
//  Created by Varun Naharia on 26/08/15.
//
//

#import <UIKit/UIKit.h>

@protocol CheckBoxDelegate

- (void)Checked:(BOOL)value;

@end

@interface UICheckButton : UIButton

@property int category_id;
@property(strong)NSString *name;
@property int parent_id;
@property int product_count;
@property BOOL isSelected;
@property(strong)UIImageView *checkImg;
@property (nonatomic, assign) id <CheckBoxDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor;
-(void)setDefaultValue:(BOOL)value;

@end

