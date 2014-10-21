//
//  getRideViewController.h
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 10/10/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface getRideViewController : UIViewController{
    IBOutlet UIImageView *backgroundView;
    IBOutlet UITextField *officeAddressTextField;
    IBOutlet UITextField *homeAddressTextField;
    IBOutlet UITextField *timeDatePicker;
    IBOutlet UITextField *anythingElseTextField;
    IBOutlet UIButton *goGetItButton;
    IBOutlet UIButton *forgetItButton;
    IBOutlet UIButton *backButton;
    
    IBOutlet UISwitch *femaleSwitch;
    IBOutlet UISwitch *taxiSwitch;
    IBOutlet UISwitch *privateCarSwitch;
    IBOutlet UISwitch *bothSwitch;
}

-(IBAction)taxiSwitchAction:(id)sender;
-(IBAction)privateCarSwitchAction:(id)sender;
-(IBAction)bothSwitchAction:(id)sender;

@end
