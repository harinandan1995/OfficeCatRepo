//
//  frndsViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 10/16/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "frndsViewController.h"
#import "ILTranslucentView.h"
#import "frndsTableViewCell.h"
#import "GlobalFn.h"

@interface frndsViewController ()

@end

@implementation frndsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [GlobalFn getColor:0];
    frndsTable.delegate = self;
    frndsTable.dataSource = self;
    
    ILTranslucentView *translucentView = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    [self.view addSubview:translucentView];
    
    //optional:
    translucentView.translucentAlpha = 0.9;
    translucentView.translucentStyle = UIBarStyleBlack;
    translucentView.translucentTintColor = [GlobalFn getColor:2];
    translucentView.backgroundColor = [UIColor clearColor];
    [self.view sendSubviewToBack:translucentView];
    
    frndsArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Harinandan Teja" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"0" forKey:@"read"];
    [help setObject:@"aap" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Pankaj Saraf" forKey:@"name"];
    [help setObject:@"profile1.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"aman" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sai Krishna" forKey:@"name"];
    [help setObject:@"profile4.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"ance" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Rohit Ranjan" forKey:@"name"];
    [help setObject:@"profile3.jpeg" forKey:@"email"];
    [help setObject:@"Hey there wassup Harinandan Teja ,Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"as" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sumanth Vakulabharanam" forKey:@"name"];
    [help setObject:@"profile5.jpeg" forKey:@"email"];
    [help setObject:@"Hey there wassup Harinandan Teja ,Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Manish Poddar" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Yeah i saw that one too" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Manish Poddar" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Yeah i saw that one too" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];

    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Manish Poddar" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Yeah i saw that one too" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];

    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Manish Poddar" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Yeah i saw that one too" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];

    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Manish Poddar" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Yeah i saw that one too" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];

    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Manish Poddar" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Yeah i saw that one too" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];

    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Manish Poddar" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"email"];
    [help setObject:@"Yeah i saw that one too" forKey:@"lastMsg"];
    [help setObject:@"10:54pm" forKey:@"time"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];

    
    //[self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view.
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [frndsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"infocell";
    
    frndsTableViewCell *cell = (frndsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"frndsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
        cell.backgroundColor = [GlobalFn getColor:0];
        cell.nameLabel.textColor = [GlobalFn getColor:2];
        cell.msgLabel.textColor = [UIColor whiteColor];
        cell.timeLabel.textColor = [UIColor whiteColor];
        cell.profilePic.layer.masksToBounds = YES;
        cell.profilePic.layer.cornerRadius = 35;
        //cell.profilePic.layer.borderWidth = 1.0;
        cell.profilePic.layer.borderColor = [[GlobalFn getColor:2] CGColor];
        cell.numberLabel.layer.masksToBounds = YES;
        cell.numberLabel.layer.cornerRadius = 8;
        cell.numberLabel.backgroundColor = [GlobalFn getColor:0];
        cell.numberLabel.textColor = [GlobalFn getColor:2];
        cell.numberLabel.layer.borderWidth = 1.0;
        cell.numberLabel.layer.borderColor = [[GlobalFn getColor:2] CGColor];
    }
    
    NSDictionary *help = frndsArray[indexPath.row];
    cell.nameLabel.text = help[@"name"];
    cell.msgLabel.text = help[@"lastMsg"];
    cell.numberLabel.text = @"3";
    cell.timeLabel.text = help[@"time"];
    cell.profilePic.image = [UIImage imageNamed:help[@"email"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"asdas");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
