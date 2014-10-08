//
//  loginViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "loginViewController.h"
#import "UIView+Toast.h"
#import "GlobalFn.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    signin_button.layer.masksToBounds = YES;
    signin_button.layer.cornerRadius = 5;
    signin_button.layer.borderWidth = 0.5;

    email_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    password_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    // Do any additional setup after loading the view.
}

- (void)dismissKeyboard;
{
    [email_textfield resignFirstResponder];
    [password_textfield resignFirstResponder];
}

-(IBAction)loginAction:(id)sender
{
    [email_textfield resignFirstResponder];
    [password_textfield resignFirstResponder];
    if([email_textfield.text isEqualToString:@""] || [password_textfield.text isEqualToString:@""]){
        [self.view makeToast:@"Invalid Details"];
    }
    else{
        NSDictionary *parameters = @{@"password": password_textfield.text , @"emailid":email_textfield.text};
        [GlobalFn GetRequestWithBaseURL:@"http://theofficecat.rohit1729.webfactional.com/" function:@"signin" parameters:parameters completion:^(NSDictionary *json, BOOL success)
         {
             if (success)
             {
                 //NSLog(@"%@",json);
                 if ([json[@"status"] isEqualToString:@"Logging in"]) {
                     /*verifyViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"verifyViewController"];
                     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                     navigationController.navigationBarHidden  = YES;*/
                     NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
                     if (standardUserDefaults) {
                         [standardUserDefaults setObject:email_textfield.text forKey:@"email"];
                         [standardUserDefaults setObject:@"1" forKey:@"loginstatus"];
                         [standardUserDefaults synchronize];
                     }
                     //[self presentViewController:navigationController animated:NO completion:nil];
                 }
                 else{
                     [self.view makeToast:@"Network Error"];
                 }
             }
             else{
                 [self.view makeToast:@"Network Error"];
             }
         }];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
