//
//  bulletinViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 10/11/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bulletinViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UIImageView *navigationView;
    IBOutlet UIImageView *bottomImage;
    IBOutlet UITableView *rideTable;
    IBOutlet UIButton *getRideButton;
    IBOutlet UIButton *shareTaxiButton;
    IBOutlet UIButton *giveRideButton;
    NSMutableArray *rideArray;
}

@end
