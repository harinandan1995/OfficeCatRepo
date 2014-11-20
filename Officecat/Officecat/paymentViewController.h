//
//  paymentViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 10/21/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface paymentViewController : UIViewController{
    IBOutlet UIButton *creditButton;
    IBOutlet UIButton *debitButton;
    IBOutlet UIButton *netBankButton;
    IBOutlet UIView *middleView;
    
    IBOutlet UIView *netBankView;
    IBOutlet UIButton *payButton1;
    
    IBOutlet UIView *debitView;
    IBOutlet UITextField *cardNumberTextField2;
    IBOutlet UITextField *cvvTextField2;
    IBOutlet UITextField *nameOnCardTextField2;
    IBOutlet UIButton *payButton2;
    
    IBOutlet UIView *creditView;
    IBOutlet UITextField *cardNumberTextField3;
    IBOutlet UITextField *cvvTextField3;
    IBOutlet UITextField *nameOnCardTextField3;
    IBOutlet UIButton *payButton3;
    
    IBOutlet UITextView *expiryDateTextView;
    IBOutlet UILabel *payUsingNet;
    IBOutlet UILabel *payUsingCredit;
    IBOutlet UILabel *payUsingDebit;
    
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    IBOutlet UIImageView *image3;
}

-(IBAction)netBankButtonAction:(id)sender;
-(IBAction)creditBankButtonAction:(id)sender;
-(IBAction)debitBankButtonAction:(id)sender;

@end
