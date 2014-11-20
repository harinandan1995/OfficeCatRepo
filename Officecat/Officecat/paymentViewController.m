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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    // setting initial properties
    debitView.hidden = YES;
    payUsingDebit.hidden = YES;
    image1.hidden = YES;
    image2.hidden = YES;
    image3.hidden = YES;
    
    
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
    
    creditView.backgroundColor = [GlobalFn getColor:1];
    creditView.layer.masksToBounds = YES;
    creditView.layer.cornerRadius = 10;
    payButton2.backgroundColor =[GlobalFn getColor:4];
    expiryDateTextView.backgroundColor = [GlobalFn getColor:1];
    
    debitView.backgroundColor = [GlobalFn getColor:1];
    debitView.layer.masksToBounds = YES;
    debitView.layer.cornerRadius = 10;
    payButton3.backgroundColor =[GlobalFn getColor:4];
    
    // Do any additional setup after loading the view.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)dismissKeyboard;
{
    [cardNumberTextField2 resignFirstResponder];
    [nameOnCardTextField2 resignFirstResponder];
    [cvvTextField2 resignFirstResponder];
    [nameOnCardTextField2 resignFirstResponder];
}

-(IBAction)netBankButtonAction:(id)sender
{
    if(netBankView.hidden){
        netBankButton.enabled = NO;
        netBankView.hidden = NO;
        payUsingNet.hidden = NO;
        [UIView animateWithDuration:0.3
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             netBankView.alpha = 1.0;
                             payUsingNet.alpha = 1.0;
                             debitView.alpha = 0.0;
                             payUsingDebit.alpha = 0.0;
                             image1.alpha = 0.0;
                             image2.alpha = 0.0;
                             image3.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             netBankButton.enabled = YES;
                             debitView.hidden = YES;
                         }
         ];
    }
}

-(IBAction)debitBankButtonAction:(id)sender
{
    if(debitView.hidden){
        debitButton.enabled = NO;
        debitView.hidden = NO;
        payUsingDebit.hidden = NO;
        [UIView animateWithDuration:0.3
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             debitView.alpha = 1.0;
                             payUsingDebit.alpha = 1.0;
                             netBankView.alpha = 0.0;
                             payUsingNet.alpha = 0.0;
                             image1.alpha = 1.0;
                             image2.alpha = 1.0;
                             image3.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             debitButton.enabled = YES;
                             netBankView.hidden = YES;
                             image1.hidden = NO;
                             image2.hidden = NO;
                             image3.hidden = NO;
                         }
         ];
    }
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
