//
//  friendsViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 10/4/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "friendsViewController.h"
#import "GlobalFn.h"

@interface friendsViewController ()

@end

@implementation friendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    frndsArray = [[NSMutableArray alloc] init];
    navigationView.backgroundColor = [GlobalFn getColor:6];
    self.view.backgroundColor = [GlobalFn getColor:0];
    menuView.backgroundColor = [GlobalFn getColor:2];
    frndsCollection.dataSource = self;
    frndsCollection.delegate = self;
    frndsCollection.backgroundColor = [GlobalFn getColor:0];
    
    NSMutableDictionary *help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Harinandan Teja" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"0" forKey:@"read"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Pankaj Saraf" forKey:@"name"];
    [help setObject:@"profile1.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sai Krishna" forKey:@"name"];
    [help setObject:@"profile4.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Rohit Ranjan" forKey:@"name"];
    [help setObject:@"profile3.jpeg" forKey:@"email"];
    [help setObject:@"Hey there wassupHarinandan Teja ,Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sumanth Vakulabharanam" forKey:@"name"];
    [help setObject:@"profile5.jpeg" forKey:@"email"];
    [help setObject:@"Hey there wassup Harinandan Teja ,Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [frndsArray addObject:help];
    
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Selectedf image scrolling collection view
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//Count of number of images selected
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return frndsArray.count;
    //return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* const SwitchCellID = @"memberCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SwitchCellID forIndexPath:indexPath];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"memberCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSDictionary *help = [[NSDictionary alloc] init];
    help = frndsArray[indexPath.item];
    NSLog(@"%lu, %@ ,%@",indexPath.item,help[@"email"],help[@"lastMsg"]);
    
    cell.backgroundColor = [GlobalFn getColor:3];
    cell.layer.masksToBounds = YES;
    cell.layer.borderColor = [[GlobalFn getColor:2] CGColor];
    cell.layer.borderWidth = 5;
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    nameLabel.textColor = [GlobalFn getColor:4];
    nameLabel.text = help[@"name"];
    
    UILabel *msgLabel = (UILabel *)[cell viewWithTag:2];
    msgLabel.textColor = [GlobalFn getColor:5];
    msgLabel.text = help[@"lastMsg"];
    
    UIImageView *DisplayPic = (UIImageView *)[cell viewWithTag:3];
    DisplayPic.image = [UIImage imageNamed:help[@"email"]];
    return cell;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(IBAction)menuAction:(id)sender
{
    menuButton.enabled = NO;
    if(menuView.hidden){
        menuView.hidden = NO;
        [UIView animateWithDuration:0.3
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y-480);
                             menuView.alpha = 1.0;
                             frndsCollection.center = CGPointMake(frndsCollection.center.x+78,
                                                                  frndsCollection.center.y);
                         }
                         completion:^(BOOL finished){
                             menuButton.enabled = YES;
                             //menuView.hidden = YES;
                         }
         ];

        
    }
    else{
        [UIView animateWithDuration:0.3
                         animations:^{
                             //menuView.center = CGPointMake(menuView.center.x,                                                           menuView.center.y+480);
                             menuView.alpha = 0.0;
                             frndsCollection.center = CGPointMake(frndsCollection.center.x-78,
                                                                  frndsCollection.center.y);
                         }
                         completion:^(BOOL finished){
                             menuButton.enabled = YES;
                             menuView.hidden = YES;
                         }
         ];
    }
    
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
