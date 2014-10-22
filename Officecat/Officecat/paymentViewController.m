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
    self.view.backgroundColor = [GlobalFn getColor:0];
    // transparent view
    ILTranslucentView *translucentView = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 0, 320, 67)];
    [self.view addSubview:translucentView];
    translucentView.translucentAlpha = 0.9;
    translucentView.translucentStyle = UIBarStyleBlack;
    translucentView.translucentTintColor = [UIColor clearColor];
    translucentView.backgroundColor = [UIColor clearColor];
    [self.view sendSubviewToBack:translucentView];
    
    ILTranslucentView *translucentView2 = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 152, 320, 72)];
    [self.view addSubview:translucentView2];
    translucentView2.translucentAlpha = 0.9;
    translucentView2.translucentStyle = UIBarStyleBlack;
    translucentView2.translucentTintColor = [GlobalFn getColor:7];
    translucentView2.backgroundColor = [UIColor clearColor];
    [self.view sendSubviewToBack:translucentView2];
    
    netBankView.backgroundColor = [GlobalFn getColor:1];
    netBankView.layer.masksToBounds = YES;
    netBankView.layer.cornerRadius = 10;
    payButton1.backgroundColor =[GlobalFn getColor:4];
    
    // Do any additional setup after loading the view.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
