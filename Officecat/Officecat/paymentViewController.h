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
    IBOutlet UIView *debitView;
    IBOutlet UIView *creditView;
    IBOutlet UIButton *payButton1;
}

@end
