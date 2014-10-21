//
//  paymentViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 10/21/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "paymentViewController.h"
#import "ILTranslucentView.h"
#import "GlobalFn.h"

@interface paymentViewController ()

@end

@implementation paymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // transparent view
    ILTranslucentView *translucentView = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 0, 320, 67)];
    [self.view addSubview:translucentView];
    translucentView.translucentAlpha = 0.9;
    translucentView.translucentStyle = UIBarStyleBlack;
    translucentView.translucentTintColor = [UIColor clearColor];
    translucentView.backgroundColor = [UIColor clearColor];
    [self.view sendSubviewToBack:translucentView];
    self.view.backgroundColor = [GlobalFn getColor:0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
