//
//  introViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface introViewController : UIViewController{
    IBOutlet UIImageView *introImage1;
    IBOutlet UIButton *introButton;
}

-(IBAction) nextAction:(id)sender;

@end
