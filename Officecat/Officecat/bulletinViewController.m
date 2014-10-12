//
//  bulletinViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 10/11/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "bulletinViewController.h"
#import "ILTranslucentView.h"
#import "bulletinTableViewCell.h"
#import "GlobalFn.h"

@interface bulletinViewController ()

@end

@implementation bulletinViewController

@synthesize xmppStream;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [GlobalFn getColor:1];
    rideArray = [[NSMutableArray alloc] init];
    rideTable.delegate = self;
    rideTable.dataSource = self;
    
    // bottom buttons text colour
    [getRideButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    [shareTaxiButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    [giveRideButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    
    // top translucent view
    ILTranslucentView *translucentView = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [self.view addSubview:translucentView];
    
    //optional:
    translucentView.translucentAlpha = 0.9;
    translucentView.translucentStyle = UIBarStyleBlack;
    translucentView.translucentTintColor = [UIColor clearColor];
    translucentView.backgroundColor = [UIColor clearColor];
    [self.view sendSubviewToBack:translucentView];
    [self.view sendSubviewToBack:navigationView];
    
    // bottom translucent view
    ILTranslucentView *translucentView1 = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 501, 320, 80)];
    [self.view addSubview:translucentView1];
    
    //optional:
    translucentView1.translucentAlpha = 0.9;
    translucentView1.translucentStyle = UIBarStyleBlack;
    translucentView1.translucentTintColor = [UIColor clearColor];
    translucentView1.backgroundColor = [UIColor clearColor];
    
    [self.view sendSubviewToBack:translucentView1];
    [self.view sendSubviewToBack:bottomImage];
    
    
    NSMutableDictionary *help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Harinandan Teja" forKey:@"name"];
    [help setObject:@"profile2.jpg" forKey:@"profilepic"];
    [help setObject:@"India Bulls, Lower Parel" forKey:@"from"];
    [help setObject:@"Kala Ghod, Fort" forKey:@"to"];
    [help setObject:@"Now O'Clock" forKey:@"date"];
    [help setObject:@"6.30 P.M." forKey:@"time"];
    [help setObject:@"0" forKey:@"type"];
    [rideArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Pankaj Saraf" forKey:@"name"];
    [help setObject:@"profile1.jpg" forKey:@"profilepic"];
    [help setObject:@"India Bulls, Lower Parel" forKey:@"from"];
    [help setObject:@"Kala Ghod, Fort" forKey:@"to"];
    [help setObject:@"3 Apr, 2007" forKey:@"date"];
    [help setObject:@"6.30 P.M." forKey:@"time"];
    [help setObject:@"0" forKey:@"type"];
    [rideArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sai Krishna" forKey:@"name"];
    [help setObject:@"profile4.jpg" forKey:@"profilepic"];
    [help setObject:@"India Bulls, Lower Parel" forKey:@"from"];
    [help setObject:@"Kala Ghod, Fort" forKey:@"to"];
    [help setObject:@"3 Apr, 2007" forKey:@"date"];
    [help setObject:@"6.30 P.M." forKey:@"time"];
    [help setObject:@"1" forKey:@"type"];
    [rideArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Rohit Ranjan" forKey:@"name"];
    [help setObject:@"profile3.jpeg" forKey:@"profilepic"];
    [help setObject:@"India Bulls, Lower Parel" forKey:@"from"];
    [help setObject:@"Kala Ghod, Fort" forKey:@"to"];
    [help setObject:@"3 Apr, 2007" forKey:@"date"];
    [help setObject:@"6.30 P.M." forKey:@"time"];
    [help setObject:@"0" forKey:@"type"];
    [rideArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sumanth Vakulabharanam" forKey:@"name"];
    [help setObject:@"profile5.jpeg" forKey:@"profilepic"];
    [help setObject:@"India Bulls, Lower Parel" forKey:@"from"];
    [help setObject:@"Kala Ghod, Fort" forKey:@"to"];
    [help setObject:@"3 Apr, 2007" forKey:@"date"];
    [help setObject:@"6.30 P.M." forKey:@"time"];
    [help setObject:@"0" forKey:@"type"];
    [rideArray addObject:help];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self connect];
    
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [rideArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"infocell";
    
    bulletinTableViewCell *cell = (bulletinTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"bulletinTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *help = [[NSDictionary alloc] init];
    help = rideArray[indexPath.item];
    
    cell.backgroundColor = [GlobalFn getColor:1];
    
    cell.nameLabel.textColor = [GlobalFn getColor:3];
    cell.fromLabel.textColor = [GlobalFn getColor:3];
    cell.toLabel.textColor = [GlobalFn getColor:3];
    cell.dateLabel.textColor = [GlobalFn getColor:3];
    cell.timeLabel.textColor = [GlobalFn getColor:3];
    cell.typeLabel.textColor = [GlobalFn getColor:5];
    
    cell.profilePic.image = [UIImage imageNamed:help[@"profilepic"]];
    cell.nameLabel.text = help[@"name"];
    cell.fromLabel.text = [@"FROM : " stringByAppendingString:help[@"from"]];
    cell.toLabel.text = [@"TO : " stringByAppendingString:help[@"to"]];
    cell.dateLabel.text = [@"Date : " stringByAppendingString:help[@"date"]];
    cell.timeLabel.text = [@"Time : " stringByAppendingString:help[@"time"]];
    if([help[@"type"] isEqualToString:@"0"]){
        cell.typeLabel.text = @"Get ride/Share taxi";
        cell.view.backgroundColor = [GlobalFn getColor:5];
    }
    else{
        cell.typeLabel.text = @"Give ride";
        cell.view.backgroundColor = [GlobalFn getColor:4];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupStream {
    xmppStream = [[XMPPStream alloc] init];
    [xmppStream setHostName:@"119.81.44.122"];
    [xmppStream setHostPort:5222];
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)goOnline {
    XMPPPresence *presence = [XMPPPresence presence];
    [[self xmppStream] sendElement:presence];
}

- (void)goOffline {
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    [[self xmppStream] sendElement:presence];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)connect {
    [self setupStream];
    
    //NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //NSString *myPassword = [[NSUserDefaults standardUserDefaults] stringForKey:@"userPassword"];
    
    NSString *jabberID = @"abc@119.81.44.122";//@"aap@119.81.44.122";//@"aman32605%40hotmail.com@119.81.44.122";
    NSString *myPassword = @"1729";
    
    if (![xmppStream isDisconnected]) {
        return YES;
    }
    
    if (jabberID == nil || myPassword == nil) {
        return NO;
    }
    
    [xmppStream setMyJID:[XMPPJID jidWithString:jabberID]];
    //[xmppStream setMyJID:[XMPPJID jidWithUser:jabberID domain:@"119.81.44.122" resource:@"8f51f0b4"]];
    password = myPassword;
    
    NSError *error = nil;
    if (![xmppStream connectWithTimeout:1 error:&error])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error connecting"
                                                            message:@"See console for error details."
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        return NO;
    }
    
    return YES;
}

- (void)disconnect {
    
    [self goOffline];
    [xmppStream disconnect];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)applicationWillResignActive:(UIApplication *)application {
    [self disconnect];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self connect];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
    if (![xmppStream isConnected])
    {
        NSLog(@"Unable to connect to server. Check xmppStream.hostName");
        [self connect];
    }
}

- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    
    // connection to the server successful
    
    if ([xmppStream isDisconnected]){
        NSLog(@"Is DisConnected");
        [self connect];
    }
    if ([xmppStream isConnecting]){
        NSLog(@"Is Connecting");
    }
    if ([xmppStream isConnecting]){
        NSLog(@"Is Connecting");
    }
    if ([xmppStream isConnected]){
        NSLog(@"Is Connected");
    }
    
    NSError *error = nil;
    [[self xmppStream] authenticateWithPassword:password error:&error];
    NSLog(@"%@",error);
    
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    // authentication successful
    [self goOnline];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
    // message received
    
    NSString *msg = [[message elementForName:@"body"] stringValue];
    NSString *from = [[message attributeForName:@"from"] stringValue];
    NSLog(@"%@ , %@",msg,from);
}

- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence {
    // a buddy went offline/online
    NSString *presenceType = [presence type]; // online/offline
    NSString *myUsername = [[sender myJID] user];
    NSString *presenceFromUser = [[presence from] user];
    
    if (![presenceFromUser isEqualToString:myUsername]) {
        
        if ([presenceType isEqualToString:@"available"]) {
            NSLog(@"Person Online");
            //[chatDelegate newBuddyOnline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, @"119.81.44.122"]];
            
        } else if ([presenceType isEqualToString:@"unavailable"]) {
            NSLog(@"Person Offline");
            //[chatDelegate buddyWentOffline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, @"119.81.44.122"]];
            
        }
        
    }
    
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
