//
//  ViewController.h
//  UITreeView
//
//  Created by Varun Naharia on 26/08/15.
//  
//

#import <UIKit/UIKit.h>
#import "TreeView.h"

@interface ViewController : UIViewController
{
    TreeView *tree;
}

@property(nonatomic,retain)NSMutableDictionary *dict;
@property(nonatomic,retain)NSMutableDictionary *cat;

@end

