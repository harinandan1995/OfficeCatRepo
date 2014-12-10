//
//  newPaymentViewController.m
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 09/12/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "newPaymentViewController.h"
#import "GlobalFn.h"

@interface newPaymentViewController ()

@end

@implementation newPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    paymentTypeView.backgroundColor = [GlobalFn getColor:8];
    savedCardsButton.backgroundColor = [GlobalFn getColor:8];
    debitCardButton.backgroundColor = [GlobalFn getColor:8];
    creditCardButton.backgroundColor = [GlobalFn getColor:8];
    
    [savedCardsButton setTitleColor:[GlobalFn getColor:11] forState:UIControlStateNormal];
    [debitCardButton setTitleColor:[GlobalFn getColor:11] forState:UIControlStateNormal];
    [creditCardButton setTitleColor:[GlobalFn getColor:11] forState:UIControlStateNormal];
    
    backgroundView.backgroundColor = [GlobalFn getColor:9];
    selectedPaymentTypeView.backgroundColor = [GlobalFn getColor:12];
    
    [savedCardsView.layer setCornerRadius:8.0f];
    savedCardsView.backgroundColor = [GlobalFn getColor:10];
    savedCardTypeLabel.backgroundColor = [GlobalFn getColor:10];
    savedCardNumberLabel.backgroundColor = [GlobalFn getColor:10];
    savedValidThruLabel.backgroundColor = [GlobalFn getColor:10];
    savedValidThruLabel.text = @"VALID \n THRU";
    savedExpiryDateLabel.backgroundColor = [GlobalFn getColor:10];
    
    payUsingDebitCardLabel.textColor = [GlobalFn getColor:11];
    debitCardView.backgroundColor = [GlobalFn getColor:10];
    [debitCardView.layer setCornerRadius:3.0f];
    debitExpiryDateLabel.backgroundColor = [GlobalFn getColor:10];
    [debitExpiryDateLabel setTextColor:[GlobalFn getColor:11]];
    debitSaveCardLabel.backgroundColor = [GlobalFn getColor:10];
    [debitSaveCardLabel setTextColor:[GlobalFn getColor:11]];
    debitMakePaymentButton.backgroundColor = [GlobalFn getColor:4];
    debitCardNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    debitCvvTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    payUsingCreditCardLabel.textColor = [GlobalFn getColor:11];
    creditCardView.backgroundColor = [GlobalFn getColor:10];
    [creditCardView.layer setCornerRadius:3.0f];
    creditExpiryDateLabel.backgroundColor = [GlobalFn getColor:10];
    [creditExpiryDateLabel setTextColor:[GlobalFn getColor:11]];
    creditSaveCardLabel.backgroundColor = [GlobalFn getColor:10];
    [creditSaveCardLabel setTextColor:[GlobalFn getColor:11]];
    creditMakePaymentButton.backgroundColor = [GlobalFn getColor:4];
    creditCardNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    creditCvvTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [firstView.layer setCornerRadius:2.5f];
    [secondView.layer setCornerRadius:2.5f];
    [thirdView.layer setCornerRadius:2.5f];
    secondView.backgroundColor = [GlobalFn getColor:12];
    
    creditCardView.center = CGPointMake(debitCardButton.center.x + 400, debitCardView.center.y);
    savedCardsView.center = CGPointMake(debitCardButton.center.x - 400, debitCardView.center.y);
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)dismissKeyboard;
{
    [debitCardNumberTextField resignFirstResponder];
    [debitExpiryDateTextField resignFirstResponder];
    [debitCvvTextField resignFirstResponder];
    [debitNameOnCardTextField resignFirstResponder];
    
    [creditCardNumberTextField resignFirstResponder];
    [creditExpiryDateTextField resignFirstResponder];
    [creditCvvTextField resignFirstResponder];
    [creditNameOnCardTextField resignFirstResponder];
}

-(IBAction)debitCardButtonAction:(id)sender
{
    if(selectedPaymentTypeView.center.x > debitCardButton.center.x){
        int relposx = debitCardButton.center.x;
        debitCardButton.enabled = NO;
        [UIView animateWithDuration:0.5
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             selectedPaymentTypeView.center = CGPointMake(debitCardButton.center.x, selectedPaymentTypeView.center.y);
                             debitCardView.center = CGPointMake(debitCardButton.center.x, debitCardView.center.y);
                             creditCardView.center = CGPointMake(relposx + 400, creditCardView.center.y);
                             savedCardsView.center = CGPointMake(relposx - 400, creditCardView.center.y);
                             debitCardView.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             debitCardButton.enabled = YES;
                             thirdView.backgroundColor = [UIColor whiteColor];
                             secondView.backgroundColor = [GlobalFn getColor:12];
                             //debitView.hidden = YES;
                         }
         ];
    }
    else if(selectedPaymentTypeView.center.x < debitCardButton.center.x){
        int relposx = debitCardButton.center.x;
        debitCardButton.enabled = NO;
        [UIView animateWithDuration:0.5
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             selectedPaymentTypeView.center = CGPointMake(debitCardButton.center.x, selectedPaymentTypeView.center.y);
                             debitCardView.center = CGPointMake(debitCardButton.center.x, debitCardView.center.y);
                             creditCardView.center = CGPointMake(relposx + 400, creditCardView.center.y);
                             savedCardsView.center = CGPointMake(relposx - 400, savedCardsView.center.y);
                             debitCardView.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             debitCardButton.enabled = YES;
                             firstView.backgroundColor = [UIColor whiteColor];
                             secondView.backgroundColor = [GlobalFn getColor:12];
                             //debitView.hidden = YES;
                         }
         ];
    }
}

-(IBAction)creditCardButtonAction:(id)sender
{
    if(selectedPaymentTypeView.center.x == debitCardButton.center.x){
        int relposx = debitCardButton.center.x;
        creditCardButton.enabled = NO;
        [UIView animateWithDuration:0.5
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             selectedPaymentTypeView.center = CGPointMake(creditCardButton.center.x, selectedPaymentTypeView.center.y);
                             creditCardView.center = CGPointMake(debitCardButton.center.x, creditCardView.center.y);
                             debitCardView.center = CGPointMake(relposx - 400, debitCardView.center.y);
                             savedCardsView.center = CGPointMake(relposx - 800, savedCardsView.center.y);
                             savedCardsView.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             creditCardButton.enabled = YES;
                             secondView.backgroundColor = [UIColor whiteColor];
                             thirdView.backgroundColor = [GlobalFn getColor:12];
                             //debitView.hidden = YES;
                         }
         ];
    }
    else if(selectedPaymentTypeView.center.x < debitCardButton.center.x){
        int relposx = debitCardButton.center.x;
        creditCardButton.enabled = NO;
        [UIView animateWithDuration:0.5
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             selectedPaymentTypeView.center = CGPointMake(creditCardButton.center.x, selectedPaymentTypeView.center.y);
                             creditCardView.center = CGPointMake(debitCardButton.center.x, creditCardView.center.y);
                             debitCardView.center = CGPointMake(relposx - 400, debitCardView.center.y);
                             savedCardsView.center = CGPointMake(relposx - 800, savedCardsView.center.y);
                             savedCardsView.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             creditCardButton.enabled = YES;
                             firstView.backgroundColor = [UIColor whiteColor];
                             thirdView.backgroundColor = [GlobalFn getColor:12];
                             //debitView.hidden = YES;
                         }
         ];
    }
}

-(IBAction)savedCardsButtonAction:(id)sender
{
    if(selectedPaymentTypeView.center.x == debitCardButton.center.x){
        int relposx = debitCardButton.center.x;
        savedCardsButton.enabled = NO;
        [UIView animateWithDuration:0.5
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             selectedPaymentTypeView.center = CGPointMake(savedCardsButton.center.x, selectedPaymentTypeView.center.y);
                             savedCardsView.center = CGPointMake(debitCardButton.center.x, savedCardsView.center.y);
                             debitCardView.center = CGPointMake(relposx + 400, debitCardView.center.y);
                             creditCardView.center = CGPointMake(relposx + 800, creditCardView.center.y);
                             debitCardView.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             savedCardsButton.enabled = YES;
                             secondView.backgroundColor = [UIColor whiteColor];
                             firstView.backgroundColor = [GlobalFn getColor:12];
                             //debitView.hidden = YES;
                         }
         ];
    }
    else if(selectedPaymentTypeView.center.x > debitCardButton.center.x){
        int relposx = debitCardButton.center.x;
        savedCardsButton.enabled = NO;
        [UIView animateWithDuration:0.5
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             selectedPaymentTypeView.center = CGPointMake(savedCardsButton.center.x, selectedPaymentTypeView.center.y);
                             savedCardsView.center = CGPointMake(debitCardButton.center.x, savedCardsView.center.y);
                             debitCardView.center = CGPointMake(relposx + 400, debitCardView.center.y);
                             creditCardView.center = CGPointMake(relposx + 800, creditCardView.center.y);
                             savedCardsView.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             savedCardsButton.enabled = YES;
                             thirdView.backgroundColor = [UIColor whiteColor];
                             firstView.backgroundColor = [GlobalFn getColor:12];
                             //debitView.hidden = YES;
                         }
         ];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
