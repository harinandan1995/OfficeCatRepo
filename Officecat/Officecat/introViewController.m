//
//  introViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "introViewController.h"
#import "signupViewController.h"

@interface introViewController ()

@end

@implementation introViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(IBAction)nextAction:(id)sender{
    signupViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"signupViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBarHidden  = YES;
    [self presentViewController:navigationController animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
