//
//  CheckButton.m
//  MyTreeViewPrototype
//
//  Created by Varun Naharia on 26/08/15.
//
//

#import "CheckButton.h"

@implementation CheckButton

@synthesize category_id,product_count,parent_id,name,isSelected,checkImg,delegate;
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 
 */

    - (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor
    {
        //    self = [super initWithFrame:frame];
        self = [super init];
        if (self) {
            // Initialization code
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            self.userInteractionEnabled = YES;
            [self addTarget:self action:@selector(clickme:) forControlEvents:UIControlEventTouchUpInside];
        }
        return self;
    }

    - (void)drawRect:(CGRect)rect {
        [checkImg removeFromSuperview];
        checkImg= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.height-10, self.frame.size.height-10)];
        if(isSelected)
        {
            checkImg.image=[UIImage imageNamed:@"check_box.png"];
        }
        else
        {
            checkImg.image=[UIImage imageNamed:@"uncheck_box.png"];
        }
        [self addSubview:checkImg];
        
    }

    -(void)clickme:(CheckButton *)sender
    {
//        NSLog(@"%@",sender.superview);
        if (sender.isSelected) {
            sender.isSelected=NO;
            sender.backgroundColor=[UIColor clearColor];
            [sender setNeedsLayout];
            [delegate Checked:NO];
        }
        else
        {
            sender.isSelected=YES;
            sender.backgroundColor=[UIColor whiteColor];
            [sender setNeedsLayout];
            [delegate Checked:YES];
        }
        
        
        //NSLog(@"name:%@, Category_id:%d, parent_id:%d, product_count:%d",sender.name,sender.category_id,sender.parent_id,sender.product_count);
    }

-(void)setDefaultValue:(BOOL)value
{
    isSelected=value;
    if(value)
    {
        checkImg.image=[UIImage imageNamed:@"check_box.png"];
    }
    else
    {
        checkImg.image=[UIImage imageNamed:@"uncheck_box.png"];
    }
    [self setNeedsDisplay];
}



@end
