//
//  verifyViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 9/26/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface verifyViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITextField *verify_textfield;
    IBOutlet UITextField *password_textfield;
    IBOutlet UITextField *companyname_textfield;
    IBOutlet UITextField *companyaddress_textfield;
    IBOutlet UIButton *getstarted_button;
    IBOutlet UILabel *codeSentLabel;
    IBOutlet UIActivityIndicatorView *loadingView;
    IBOutlet UITableView *addressTable;
    NSMutableArray *suggestionsArray;
    NSString *emailid;
}

-(IBAction)addressAction:(id)sender;
-(IBAction)nextAction:(id)sender;
-(IBAction)codechanged:(id)sender;

@end
