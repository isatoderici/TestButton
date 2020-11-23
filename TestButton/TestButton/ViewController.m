//
//  ViewController.m
//  TestButton
//
//  Created by Isabela Toderici on 11/22/20.
//

#import "ViewController.h"
#import "PlainButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PlainButton *button = [[PlainButton alloc] initWithFrame:CGRectMake(100, 200, 130, 50)];
    [button setLargeImage:[UIImage imageNamed:@"Bold"]];
    [button setTitle:@"Test Button" forState:UIControlStateNormal];
    [self.view addSubview:button];
}


@end
