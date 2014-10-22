//
//  profileUpdateViewController.m
//  Officecat
//
//  Created by Sumanth Vakulabharanam on 20/10/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "profileUpdateViewController.h"
#import "GlobalFn.h"
#import "ILTranslucentView.h"
#import "UIView+Toast.h"

@interface profileUpdateViewController ()

@end

@implementation profileUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    looksGoodButton.hidden = YES;
    forgetItButton.hidden = YES;
    scrollView.backgroundColor = [GlobalFn getColor:0];
    self.view.backgroundColor = [GlobalFn getColor:0];
    backgroundView.backgroundColor = [GlobalFn getColor:0];
    
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(320, 650)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    professionTextField.enabled = NO;
    officeAddressTextField.enabled = NO;
    homeAddressTextField.enabled = NO;
    passwordTextField.enabled = NO;
    personalEmailTextField.enabled = NO;
    
    [self setUserDefaultValues];
    
    // transparent view
    ILTranslucentView *translucentView = [[ILTranslucentView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [self.view addSubview:translucentView];
    translucentView.translucentAlpha = 0.9;
    translucentView.translucentStyle = UIBarStyleBlack;
    translucentView.translucentTintColor = [UIColor clearColor];
    translucentView.backgroundColor = [UIColor clearColor];
    [self.view sendSubviewToBack:translucentView];
    [self.view sendSubviewToBack:backgroundView];
    
    looksGoodButton.backgroundColor = [GlobalFn getColor:4];
    nameLabel.textColor = [GlobalFn getColor:4];
    [editButton setTitleColor:[GlobalFn getColor:2] forState:UIControlStateNormal];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Initialize action sheet when image is pressed
    popup = [[UIActionSheet alloc] initWithTitle:@"Select profilepic options:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
             @"Take a picture",
             @"Choose from gallery",
             @"Remove",
             nil];
    popup.tag = 1;
    popup.window.tintColor = [UIColor blackColor];
    popup.window.backgroundColor = [UIColor redColor];
    
    //Image picker for selcting images from gallery/camera
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;

    profilepic.image = [UIImage imageNamed:@"nopic.jpg"];
    proPicData = UIImageJPEGRepresentation([UIImage imageNamed:@"nopic.jpg"], 0.5);
    // Do any additional setup after loading the view.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setUserDefaultValues {
    // getting user details
    firstname = [[NSUserDefaults standardUserDefaults] stringForKey:@"firstname"];
    lastname = [[NSUserDefaults standardUserDefaults] stringForKey:@"lastname"];
    fullName = [firstname stringByAppendingString:[NSString stringWithFormat:@" %@",lastname]];
    companyName = [[NSUserDefaults standardUserDefaults] stringForKey:@"com_name"];
    email = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    profession = [[NSUserDefaults standardUserDefaults] stringForKey:@"profession"];
    officeAddress = [[NSUserDefaults standardUserDefaults] stringForKey:@"officeAddress"];
    homeAddress = [[NSUserDefaults standardUserDefaults] stringForKey:@"homeAddress"];
    password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    personalEmail = [[NSUserDefaults standardUserDefaults] stringForKey:@"personalEmail"];
    
    // setting the default values
    nameLabel.text = fullName;
    companyLabel.text = companyName;
    emailLabel.text = email;
    professionTextField.text = profession;
    officeAddressTextField.text = officeAddress;
    homeAddressTextField.text = homeAddress;
    passwordTextField.text = password;
    personalEmailTextField.text = personalEmail;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Action when profile pic button is pressed
-(IBAction)propicAction:(id)sender;
{
    looksGoodButton.hidden = NO;
    forgetItButton.hidden = NO;
    [scrollView setContentSize:CGSizeMake(320, 700)];
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)pop clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (pop.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                {
                    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    imagePicker.allowsEditing = YES;
                    [self presentViewController:imagePicker animated:YES completion:Nil];
                    
                }
                    break;
                case 1:
                {
                    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                    imagePicker.allowsEditing = YES;
                    [self presentViewController:imagePicker animated:YES completion:Nil];
                }
                    break;
                case 2:
                {
                    profilepic.image = [UIImage imageNamed:@"nopic.jpg"];
                    proPicData = UIImageJPEGRepresentation([UIImage imageNamed:@"nopic.jpg"], 0.5);
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:Nil];
    UIImage *proPic =[info objectForKey:UIImagePickerControllerOriginalImage];
    proPicData = UIImageJPEGRepresentation(proPic, 0.1);
    //NSLog(@"%@",proPicData);
    profilepic.image = proPic;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)dismissKeyboard;
{
    [professionTextField resignFirstResponder];
    [officeAddressTextField resignFirstResponder];
    [homeAddressTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    [personalEmailTextField resignFirstResponder];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(IBAction)looksGoodButtonAction:(id)sender
{
    
    looksGoodButton.hidden = YES;
    forgetItButton.hidden = YES;
    [scrollView setContentSize:CGSizeMake(320, 650)];

    // storing user defaults
    editButton.hidden = NO;
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [standardUserDefaults setObject:nameLabel.text forKey:@"fullName"];
        [standardUserDefaults setObject:companyLabel.text forKey:@"companyName"];
        [standardUserDefaults setObject:emailLabel.text forKey:@"email"];
        [standardUserDefaults setObject:professionTextField.text forKey:@"profession"];
        [standardUserDefaults setObject:officeAddressTextField.text forKey:@"officeAddress"];
        [standardUserDefaults setObject:homeAddressTextField.text forKey:@"homeAddress"];
        [standardUserDefaults setObject:passwordTextField.text forKey:@"password"];
        [standardUserDefaults setObject:personalEmailTextField.text forKey:@"personalEmail"];
        [standardUserDefaults synchronize];
    }
    
    professionTextField.enabled = NO;
    officeAddressTextField.enabled = NO;
    homeAddressTextField.enabled = NO;
    passwordTextField.enabled = NO;
    personalEmailTextField.enabled = NO;
    
    //create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    //Set Params
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:60];
    [request setHTTPMethod:@"POST"];
    
    //Create boundary, it can be anything
    NSString *boundary = @"------VohpleBoundary4QuqLuM1cE5lMwCy";
    
    // set Content-Type in HTTP header
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    //Populate a dictionary with all the regular values you would like to send.
    /*NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    [parameters setValue:emailLabel.text forKey:@"id"];
    
    [parameters setValue:@"750623234" forKey:@"phonenumber"];
    
    [parameters setValue:@"Harinandan Teja" forKey:@"first_name"];
    
    [parameters setValue:@"Katam" forKey:@"last_name"];
    
    [parameters setValue:@"30-08-2014" forKey:@"dob"];
    
    
    // add params (all params are strings)
    for (NSString *param in parameters) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [parameters objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    */
    NSString *FileParamConstant = @"profile_image";
    NSLog(@"Profile Updated");
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg",FileParamConstant,emailLabel.text] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[@"Content-Type:image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:proPicData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:body];
    
    [request setURL:[NSURL URLWithString:@"http://theofficecat.rohit1729.webfactional.com/upload"]];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Image Return String: %@", returnString);
    
    if ([returnString rangeOfString:@"Profile updated"].location == NSNotFound) {
        [self.view makeToast:@"Network Error"];
    } else {
        [self.view makeToast:@"Post added"];
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(IBAction)editButtonAction:(id)sender
{
    looksGoodButton.hidden = NO;
    forgetItButton.hidden = NO;
    [scrollView setContentSize:CGSizeMake(320, 700)];
    editButton.hidden = YES;
    professionTextField.enabled = YES;
    officeAddressTextField.enabled = YES;
    homeAddressTextField.enabled = YES;
    passwordTextField.enabled = YES;
    personalEmailTextField.enabled = YES;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(IBAction)forgetItButtonAction:(id)sender
{
    looksGoodButton.hidden = YES;
    forgetItButton.hidden = YES;
    [scrollView setContentSize:CGSizeMake(320, 650)];

    editButton.hidden = NO;
    professionTextField.enabled = NO;
    officeAddressTextField.enabled = NO;
    homeAddressTextField.enabled = NO;
    passwordTextField.enabled = NO;
    personalEmailTextField.enabled = NO;
    [self setUserDefaultValues];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
