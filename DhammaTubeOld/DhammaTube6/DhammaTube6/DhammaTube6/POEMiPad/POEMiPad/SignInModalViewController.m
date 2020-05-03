//
//  SignInModalViewController.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/11/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "SignInModalViewController.h"
#import "SWRevealViewController.h"

@interface SignInModalViewController ()

@end

@implementation SignInModalViewController
@synthesize Iusername;
@synthesize Ipassword;
- (IBAction)logIn:(id)sender {
    [self setIusername:[_userName text]];
    [self setIpassword:[_password text]];
    
    [_userName setText:@""];
    [_password setText:@""];
    
    NSLog(@"%@ %@",Iusername,Ipassword);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //start here
    //these code to cooperate with the side menu
    
    self.title = NSLocalizedString(@"Log In", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"subMenuButton_half"] style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    //end here
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
