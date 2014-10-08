//
//  signupViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "signupViewController.h"
#import "ServerCall.h"
#import "GlobalFn.h"
#import "UIView+Toast.h"
#import "verifyViewController.h"

@interface signupViewController ()

@end

@implementation signupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    sendCode_button.layer.masksToBounds = YES;
    sendCode_button.layer.cornerRadius = 5;
    sendCode_button.layer.borderWidth = 0.5;
    
    email_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    firstname_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Firstname" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    lastname_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Lastname" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    // Do any additional setup after loading the view.
}

- (void)dismissKeyboard;
{
    [firstname_textfield resignFirstResponder];
    [lastname_textfield resignFirstResponder];
    [email_textfield resignFirstResponder];
}

-(IBAction)sendCodeAction:(id)sender{
    [email_textfield resignFirstResponder];
    [firstname_textfield resignFirstResponder];
    [lastname_textfield resignFirstResponder];
    if([email_textfield.text isEqualToString:@""] || [firstname_textfield.text isEqualToString:@""] || [lastname_textfield.text isEqualToString:@""] ){
        [self.view makeToast:@"Invalid Details"];
    }
    else{
        NSDictionary *parameters = @{@"first_name": firstname_textfield.text , @"last_name":lastname_textfield.text , @"emailid":email_textfield.text};
        //NSDictionary *parameters = @{@"sender_email": @"rohitranjan1729@gmail.com" , @"last_name":@"katam" , @"ride_note":@"new+note"};
        [GlobalFn GetRequestWithBaseURL:@"http://theofficecat.rohit1729.webfactional.com/" function:@"register" parameters:parameters completion:^(NSDictionary *json, BOOL success)
         {
             if (success)
             {
                 //NSLog(@"%@",json);
                 if ([json[@"status"] isEqualToString:@"Code sent successfully"]) {
                     verifyViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"verifyViewController"];
                     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                     navigationController.navigationBarHidden  = YES;
                     NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
                     if (standardUserDefaults) {
                         [standardUserDefaults setObject:email_textfield.text forKey:@"email"];
                         [standardUserDefaults setObject:firstname_textfield.text forKey:@"firstname"];
                         [standardUserDefaults setObject:lastname_textfield.text forKey:@"lastname"];
                         [standardUserDefaults synchronize];
                     }
                     [self presentViewController:navigationController animated:NO completion:nil];
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
