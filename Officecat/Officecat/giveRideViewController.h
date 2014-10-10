//
//  giveRideViewController.h
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 10/10/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface giveRideViewController : UIViewController{
    IBOutlet UIImageView *backgroundView;
    IBOutlet UITextField *officeAddressTextField;
    IBOutlet UITextField *homeAddressTextField;
    IBOutlet UITextField *notesTextField;
    IBOutlet UIButton *goGetItButton;
    IBOutlet UIButton *forgetItButton;
}

@end
