//
//  profileUpdateViewController.h
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 20/10/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileUpdateViewController : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController *imagePicker;
    IBOutlet UIImageView *profilepic;
    
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *companyLabel;
    IBOutlet UILabel *emailLabel;
    
    IBOutlet UITextField *professionTextField;
    IBOutlet UITextField *officeAddressTextField;
    IBOutlet UITextField *homeAddressTextField;
    
    IBOutlet UITextField *passwordTextField;
    IBOutlet UITextField *personalEmailTextField;
    
    IBOutlet UIButton *looksGoodButton;
    IBOutlet UIButton *forgetItButton;
    IBOutlet UIButton *editButton;
    IBOutlet UIButton *proPicButton;
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIView *backgroundView;
    
    NSData *proPicData;
    
    NSString *fullName;
    NSString *lastname;
    NSString *firstname;
    NSString *companyName;
    NSString *email;
    NSString *profession;
    NSString *officeAddress;
    NSString *homeAddress;
    NSString *password;
    NSString *personalEmail;
    UIActionSheet *popup;
    
}

-(IBAction)looksGoodButtonAction:(id)sender;
-(IBAction)editButtonAction:(id)sender;
-(IBAction)forgetItButtonAction:(id)sender;
-(IBAction)propicAction:(id)sender;

@end
