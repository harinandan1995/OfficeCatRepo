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

@synthesize xmppStream;

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
    [help setObject:@"aap" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Pankaj Saraf" forKey:@"name"];
    [help setObject:@"profile1.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"aman" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sai Krishna" forKey:@"name"];
    [help setObject:@"profile4.jpg" forKey:@"email"];
    [help setObject:@"Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"ance" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Rohit Ranjan" forKey:@"name"];
    [help setObject:@"profile3.jpeg" forKey:@"email"];
    [help setObject:@"Hey there wassupHarinandan Teja ,Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"as" forKey:@"id"];
    [frndsArray addObject:help];
    help = [[NSMutableDictionary alloc] init];
    [help setObject:@"Sumanth Vakulabharanam" forKey:@"name"];
    [help setObject:@"profile5.jpeg" forKey:@"email"];
    [help setObject:@"Hey there wassup Harinandan Teja ,Hey there wassup" forKey:@"lastMsg"];
    [help setObject:@"1" forKey:@"read"];
    [help setObject:@"avan" forKey:@"id"];
    [frndsArray addObject:help];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Setting up xmpp
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    if([xmppStream isDisconnected]){
        [self connect];
    }
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
    //NSLog(@"%lu, %@ ,%@",indexPath.item,help[@"email"],help[@"lastMsg"]);
    
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
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
