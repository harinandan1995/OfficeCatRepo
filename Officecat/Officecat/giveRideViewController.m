//
//  giveRideViewController.m
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 10/10/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "giveRideViewController.h"
#import "ILTranslucentView.h"
#import "GlobalFn.h"

@interface giveRideViewController ()

@end

@implementation giveRideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    // transparent view
    ILTranslucentView *translucentView = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [self.view addSubview:translucentView];
    translucentView.translucentAlpha = 0.9;
    translucentView.translucentStyle = UIBarStyleBlack;
    translucentView.translucentTintColor = [UIColor clearColor];
    translucentView.backgroundColor = [UIColor clearColor];
    [self.view sendSubviewToBack:translucentView];
    [self.view sendSubviewToBack:backgroundView];
    
    // placeholders colors
    
    officeAddressTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Office Address" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    homeAddressTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Home Address" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    notesTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Notes" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    [goGetItButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    [forgetItButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    goGetItButton.backgroundColor = [UIColor blackColor];
    forgetItButton.backgroundColor = [UIColor blackColor];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)dismissKeyboard;
{
    [officeAddressTextField resignFirstResponder];
    [homeAddressTextField resignFirstResponder];
    [notesTextField resignFirstResponder];
}

@end
