//
//  TreeViewCell.h
//  TreeViewPrototype
//
//  Created by Varun Naharia on 26/08/15.
//

#import <Foundation/Foundation.h>
#import "UICheckButton.h"

@protocol CellSelectedDelegate

- (void)CellChecked:(BOOL)value andCell:(UITableViewCell *)cell ;

@end

@interface TreeViewCell : UITableViewCell<CheckBoxDelegate> {
	UILabel *valueLabel;
	UIImageView *arrowImage;
	
	int level;
	BOOL expanded;
}

@property (nonatomic, retain) UILabel *valueLabel;
@property (nonatomic, retain) UIImageView *arrowImage;
@property (nonatomic) int level;
@property (nonatomic) BOOL expanded;
@property(strong)UICheckButton *btnCheckBox;
@property(nonatomic)BOOL isSelected;
@property (nonatomic, assign) id <CellSelectedDelegate> delegate;

@property(nonatomic,retain)UIButton *btnCheck;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded
            isSelected:(BOOL)value;

@end
