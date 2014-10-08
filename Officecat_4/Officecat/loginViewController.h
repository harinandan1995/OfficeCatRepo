//
//  loginViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController{
    IBOutlet UITextField *email_textfield;
    IBOutlet UITextField *password_textfield;
    
    IBOutlet UIButton *signin_button;
    IBOutlet UIButton *forgotpass_button;
    IBOutlet UIButton *singup_button;
}

-(IBAction)loginAction:(id)sender;

@end
