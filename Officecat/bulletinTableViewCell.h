//
//  bulletinTableViewCell.h
//  Officecat
//
//  Created by Harinandan Teja on 10/11/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bulletinTableViewCell : UITableViewCell{
}
@property (nonatomic,strong) IBOutlet UIImageView *profilePic;
@property (nonatomic,strong) IBOutlet UIView *view;
@property (nonatomic,strong) IBOutlet UILabel *nameLabel;
@property (nonatomic,strong) IBOutlet UILabel *fromLabel;
@property (nonatomic,strong) IBOutlet UILabel *toLabel;
@property (nonatomic,strong) IBOutlet UILabel *dateLabel;
@property (nonatomic,strong) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong) IBOutlet UILabel *typeLabel;

@end
