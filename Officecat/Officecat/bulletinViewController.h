//
//  bulletinViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 10/11/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPP.h"

@interface bulletinViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UIImageView *navigationView;
    IBOutlet UIImageView *bottomImage;
    IBOutlet UITableView *rideTable;
    IBOutlet UIButton *getRideButton;
    IBOutlet UIButton *shareTaxiButton;
    IBOutlet UIButton *giveRideButton;
    IBOutlet UIButton *menuButton;
    IBOutlet UIView *menuView;
    UIRefreshControl *refreshControl;
    NSMutableArray *rideArray;
    NSString *password;
}

@property (nonatomic , readonly) XMPPStream *xmppStream;
-(IBAction)menuAction:(id)sender;
-(IBAction)chatAction:(id)sender;

@end
