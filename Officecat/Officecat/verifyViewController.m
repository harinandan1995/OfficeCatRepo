//
//  verifyViewController.m
//  Officecat
//
//  Created by Harinandan Teja on 9/26/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "verifyViewController.h"
#import "UIView+Toast.h"
#import "GlobalFn.h"

@interface verifyViewController ()

@end

@implementation verifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    loadingView.hidden = YES;
    addressTable.delegate = self;
    addressTable.dataSource = self;
    addressTable.hidden = YES;
    addressTable.layer.masksToBounds = YES;
    addressTable.layer.borderWidth = 1;
    addressTable.layer.cornerRadius = 5;
    
    getstarted_button.layer.masksToBounds = YES;
    getstarted_button.layer.cornerRadius = 5;
    getstarted_button.layer.borderWidth = 0.5;
    
    password_textfield.enabled = NO;
    companyname_textfield.enabled = NO;
    companyaddress_textfield.enabled = YES;
    
    emailid = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    
    password_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    verify_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Code" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    companyname_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Company Name" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    companyaddress_textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Company Address" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    codeSentLabel.text = [@"Verification code sent to " stringByAppendingString:emailid];
    // Do any additional setup after loading the view.
}

- (void)dismissKeyboard;
{
    [verify_textfield resignFirstResponder];
    [password_textfield resignFirstResponder];
    [companyname_textfield resignFirstResponder];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(IBAction)nextAction:(id)sender
{
    [password_textfield resignFirstResponder];
    [companyaddress_textfield resignFirstResponder];
    [companyname_textfield resignFirstResponder];
    if([password_textfield.text isEqualToString:@""] || [companyaddress_textfield.text isEqualToString:@""] || [companyname_textfield.text isEqualToString:@""]){
        [self.view makeToast:@"Invalid Email"];
    }
    else{
        NSDictionary *parameters = @{@"password": password_textfield.text , @"company_name":@"Microsoft" , @"company_location":@"Mumbai" , @"emailid":@"hari.katam@gmail.com"};
        [GlobalFn GetRequestWithBaseURL:@"http://theofficecat.rohit1729.webfactional.com/" function:@"register_2" parameters:parameters completion:^(NSDictionary *json, BOOL success)
         {
             if (success)
             {
                 //NSLog(@"%@",json);
                 if ([json[@"status"] isEqualToString:@"request got updated"]) {
                     verifyViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"verifyViewController"];
                     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                     navigationController.navigationBarHidden  = YES;
                     NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
                     if (standardUserDefaults) {
                         [standardUserDefaults setObject:companyaddress_textfield.text forKey:@"com_add"];
                         [standardUserDefaults setObject:companyname_textfield.text forKey:@"com_name"];
                         [standardUserDefaults synchronize];
                     }
                     //[self presentViewController:navigationController animated:NO completion:nil];
                 }
                 else{
                     [self.view makeToast:@"Network Error"];
                 }
             }
             else{
                 [self.view makeToast:@"Network Error"];
             }
         }];
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length >= 4 && range.length == 0)
    {
        return NO; // return NO to not change text
            }
    else
    {
        return YES;
    }
}

-(IBAction)codechanged:(id)sender{
    if (verify_textfield.text.length == 4){
        loadingView.hidden = NO;
        [loadingView startAnimating];
        NSDictionary *parameters = @{@"code": verify_textfield.text , @"emailid":emailid};
        [GlobalFn GetRequestWithBaseURL:@"http://theofficecat.rohit1729.webfactional.com/" function:@"verify" parameters:parameters completion:^(NSDictionary *json, BOOL success)
         {
             if (success)
             {
                 [loadingView stopAnimating];
                 loadingView.hidden = YES;
                 //NSLog(@"%@",json);
                 if ([json[@"status"] isEqualToString:@"Verification code matched"]) {
                     password_textfield.enabled = YES;
                     companyname_textfield.enabled = YES;
                     companyaddress_textfield.enabled = YES;
                     [self.view makeToast:@"Code Matched"];
                 }
                 else{
                     [self.view makeToast:@"Network Error"];
                 }
             }
             else{
                 [loadingView stopAnimating];
                 loadingView.hidden = YES;
                 [self.view makeToast:@"Network Error"];
             }
         }];
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [suggestionsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"InfoCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //rounded edges of a post
    [cell.layer setCornerRadius:0.0f];
    [cell.layer setMasksToBounds:YES];
    [cell.layer setBorderWidth:0.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = suggestionsArray[indexPath.row][@"name"];
    cell.textLabel.font=[cell.textLabel.font fontWithSize:10];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"akjsdaksjd");
    [companyaddress_textfield resignFirstResponder];
    NSMutableDictionary *help = suggestionsArray[indexPath.row];
    NSLog(@"%@",help[@"name"]);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(IBAction)addressAction:(id)sender;
{
    [suggestionsArray removeAllObjects];
    if([companyaddress_textfield.text isEqualToString:@""] ) {
        addressTable.hidden = YES;
    }
    else
    {
        addressTable.hidden = NO;
    }
    
    [self geocodeAddress:companyaddress_textfield.text];
    [addressTable reloadData];
}

- (void)geocodeAddress:(NSString *)address{
    suggestionsArray = [[NSMutableArray alloc] init];
    NSString *geocodingBaseUrl = @"http://maps.googleapis.com/maps/api/geocode/json?";
    NSString *url = [NSString stringWithFormat:@"%@address=%@&sensor=false", geocodingBaseUrl,address];
    url = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    NSURL *queryUrl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL: queryUrl];
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:nil];
    for(NSDictionary *help in json[@"results"]){
        NSMutableDictionary *helpDict = [[NSMutableDictionary alloc] init];
        [helpDict setValue:help[@"formatted_address"] forKey:@"name"];
        [helpDict setValue:help[@"geometry"][@"location"][@"lat"] forKey:@"lat"];
        [helpDict setValue:help[@"geometry"][@"location"][@"lng"] forKey:@"lng"];
        //NSLog(@"LAt is %@",helpDict[@"lat"]);
        //NSLog(@"Address is %@",help);
        [suggestionsArray addObject:helpDict];
    }
    //NSLog(@"%@",json[@"results"]);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
