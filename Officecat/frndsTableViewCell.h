//
//  frndsTableViewCell.h
//  Officecat
//
//  Created by Harinandan Teja on 10/16/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface frndsTableViewCell : UITableViewCell
@property (nonatomic,strong) IBOutlet UIImageView *profilePic;
@property (nonatomic,strong) IBOutlet UILabel *nameLabel;
@property (nonatomic,strong) IBOutlet UILabel *msgLabel;
@property (nonatomic,strong) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong) IBOutlet UILabel *numberLabel;
@property (nonatomic,strong) IBOutlet UIImageView *seenImage;
@end
