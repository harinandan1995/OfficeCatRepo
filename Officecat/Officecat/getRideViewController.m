//
//  getRideViewController.m
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 10/10/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "getRideViewController.h"
#import "ILTranslucentView.h"
#import "GlobalFn.h"

@interface getRideViewController ()

@end

@implementation getRideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [GlobalFn getColor:0];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [backButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    
    // transparent view
    ILTranslucentView *translucentView = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 0, 320, 67)];
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
    anythingElseTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Anything Else? Shout it Now!" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    [goGetItButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    [forgetItButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    goGetItButton.backgroundColor = [UIColor blackColor];
    forgetItButton.backgroundColor = [UIColor blackColor];
    
    femaleSwitch.tintColor = [GlobalFn getColor:1];
    femaleSwitch.onTintColor = [GlobalFn getColor:2];
    taxiSwitch.tintColor = [GlobalFn getColor:1];
    taxiSwitch.onTintColor = [GlobalFn getColor:2];
    privateCarSwitch.tintColor = [GlobalFn getColor:1];
    privateCarSwitch.onTintColor = [GlobalFn getColor:2];
    bothSwitch.tintColor = [GlobalFn getColor:1];
    bothSwitch.onTintColor = [GlobalFn getColor:2];
    
    femaleSwitch.transform = CGAffineTransformMakeScale(0.6, 0.6);
    taxiSwitch.transform = CGAffineTransformMakeScale(0.6, 0.6);
    privateCarSwitch.transform = CGAffineTransformMakeScale(0.6, 0.6);
    bothSwitch.transform = CGAffineTransformMakeScale(0.6, 0.6);
    
    femaleSwitch.on = NO;
    privateCarSwitch.on = NO;
    bothSwitch.on = NO;
    
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)dismissKeyboard;
{
    [officeAddressTextField resignFirstResponder];
    [homeAddressTextField resignFirstResponder];
    [anythingElseTextField resignFirstResponder];
    
}

-(IBAction)taxiSwitchAction:(id)sender
{
    if (taxiSwitch.on) {
        privateCarSwitch.on = NO;
        bothSwitch.on = NO;
    }
}

-(IBAction)privateCarSwitchAction:(id)sender
{
    if (privateCarSwitch.on) {
        taxiSwitch.on = NO;
        bothSwitch.on = NO;
    }
}

-(IBAction)bothSwitchAction:(id)sender
{
    if (bothSwitch.on) {
        taxiSwitch.on = NO;
        privateCarSwitch.on = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
