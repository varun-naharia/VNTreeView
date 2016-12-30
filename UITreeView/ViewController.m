//
//  ViewController.m
//  UITreeView
//
//  Created by Varun Naharia on 26/08/15.
//
//

#import "ViewController.h"
#import "TreeViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dict,cat;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dict=[[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"category" ofType:@"plist"]];
    cat =[[NSMutableDictionary alloc] init];
    cat =[dict valueForKey:@"categoriesList"];
    
    tree = [[UITreeView alloc] initWithFrame:CGRectMake(0, 30, 200, 400) andData:cat];
    
    [self.view addSubview:tree];
    UIFont *font =[UIFont fontWithName:@"Helvetica" size:10];
    [tree setTreeViewFont:font];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 50, 20)];
//    btn.backgroundColor=[UIColor redColor];
//    btn.titleLabel.text=@"Get Selected";
//    [btn addTarget:self action:@selector(btnTap) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnTap
{
    NSLog(@"%@",[tree getSelectedValue]);
}


@end
