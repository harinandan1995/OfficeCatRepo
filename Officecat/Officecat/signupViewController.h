//
//  signupViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signupViewController : UIViewController{
    IBOutlet UITextField *firstname_textfield;
    IBOutlet UITextField *lastname_textfield;
    IBOutlet UITextField *email_textfield;
    
    IBOutlet UIButton *sendCode_button;
    IBOutlet UIButton *signin_button;
    IBOutlet UIButton *why_button;
}

-(IBAction)sendCodeAction:(id)sender;

@end
