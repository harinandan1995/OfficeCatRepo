//
//  friendsViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 10/4/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface friendsViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>{
    IBOutlet UICollectionView *frndsCollection;
    IBOutlet UIView *navigationView;
    IBOutlet UIView *menuView;
    IBOutlet UIButton *menuButton;
    NSMutableArray *frndsArray;
}

-(IBAction)menuAction:(id)sender;

@end
