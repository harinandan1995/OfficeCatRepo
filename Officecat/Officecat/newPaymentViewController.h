//
//  newPaymentViewController.h
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 09/12/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newPaymentViewController : UIViewController{
    IBOutlet UIView* paymentTypeView;
    IBOutlet UIButton* savedCardsButton;
    IBOutlet UIButton* debitCardButton;
    IBOutlet UIButton* creditCardButton;
    IBOutlet UIView* backgroundView;
    IBOutlet UIView* selectedPaymentTypeView;
    
    IBOutlet UIView* savedCardsView;
    IBOutlet UILabel* savedCardTypeLabel;
    IBOutlet UILabel* savedCardNumberLabel;
    IBOutlet UILabel* savedValidThruLabel;
    IBOutlet UILabel* savedExpiryDateLabel;
    IBOutlet UILabel* savedTypeImageView;
    
    IBOutlet UILabel* payUsingDebitCardLabel;
    IBOutlet UIView* debitCardView;
    IBOutlet UITextField* debitCardNumberTextField;
    IBOutlet UITextField* debitExpiryDateTextField;
    IBOutlet UILabel* debitExpiryDateLabel;
    IBOutlet UITextField* debitCvvTextField;
    IBOutlet UITextField* debitNameOnCardTextField;
    IBOutlet UILabel* debitSaveCardLabel;
    IBOutlet UIButton* debitMakePaymentButton;
    
    IBOutlet UILabel* payUsingCreditCardLabel;
    IBOutlet UIView* creditCardView;
    IBOutlet UITextField* creditCardNumberTextField;
    IBOutlet UITextField* creditExpiryDateTextField;
    IBOutlet UILabel* creditExpiryDateLabel;
    IBOutlet UITextField* creditCvvTextField;
    IBOutlet UITextField* creditNameOnCardTextField;
    IBOutlet UILabel* creditSaveCardLabel;
    IBOutlet UIButton* creditMakePaymentButton;
    
    IBOutlet UIView* firstView;
    IBOutlet UIView* secondView;
    IBOutlet UIView* thirdView;
}

-(IBAction)debitCardButtonAction:(id)sender;
-(IBAction)creditCardButtonAction:(id)sender;
-(IBAction)savedCardsButtonAction:(id)sender;

@end
