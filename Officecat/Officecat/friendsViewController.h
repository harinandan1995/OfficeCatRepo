//
//  friendsViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 10/4/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPP.h"

@interface friendsViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>{
    IBOutlet UICollectionView *frndsCollection;
    IBOutlet UIView *navigationView;
    IBOutlet UIView *menuView;
    IBOutlet UIButton *menuButton;
    NSString *password;
    NSMutableArray *frndsArray;
}

-(IBAction)menuAction:(id)sender;
@property (nonatomic,strong) XMPPStream *xmppStream;

@end
