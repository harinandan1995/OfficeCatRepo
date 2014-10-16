//
//  frndsViewController.h
//  Officecat
//
//  Created by Harinandan Teja on 10/16/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface frndsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *menuButton;
    IBOutlet UITableView *frndsTable;
    NSMutableArray *frndsArray;
}

@end
