//
//  splashViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "splashViewController.h"
#import "introViewController.h"
#import "GlobalFn.h"

@interface splashViewController ()

@end

@implementation splashViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [GlobalFn getColor:6];
    [splash_loading startAnimating];
    splash_timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(afterLoading) userInfo:nil repeats:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    //splash_loading.tintColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}

//change satus bar color
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)afterLoading{
    [splash_loading stopAnimating];
    [splash_timer invalidate];
    introViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"introViewController"];
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
