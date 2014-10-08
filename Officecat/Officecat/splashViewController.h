//
//  splashViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 9/22/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface splashViewController : UIViewController{
    IBOutlet UIActivityIndicatorView *splash_loading;
    IBOutlet UIImageView *splash_logo;
    NSTimer *splash_timer;
}

@end
