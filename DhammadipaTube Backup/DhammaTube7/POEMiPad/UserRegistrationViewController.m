//
//  RegistrationViewController.m
//  POEMiPad
//
//  Created by Qi Mu on 7/2/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "UserRegistrationViewController.h"
#import "ZZZLabel.h"

@interface UserRegistrationViewController ()

@end

@implementation UserRegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView {
    [super loadView];
    
    //bacground view, will add all things in this
    
    UIImageView * background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 373.5, 682.5)];
    [background setImage:[UIImage imageNamed:@"registrationModalSmall"]];
    [background setUserInteractionEnabled:YES]; //otherwise, the button would not work
    [self setView:background];
    
    
    //add close button
    //CLOSEBUTTON
    //create button and set button
    UIButton * close = [[UIButton alloc] initWithFrame:CGRectMake(331, 28, 18, 30)];
    [close setImage:[UIImage imageNamed:@"exitButton"] forState:UIControlStateNormal];
    //connect it to an action
    [close addTarget:self action:@selector(closePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [background addSubview:close];
    
    
    //Registration title label
    ZZZLabel *registrationLabel = [[ZZZLabel alloc] initWithFrame:CGRectMake(117, 62.5, 160.5, 35) withTextSize:22];
    
    [registrationLabel setText:@"Registration"];
    
    [background addSubview:registrationLabel];
    
    
    //add the big user icon
    CGRect iconRect = CGRectMake(279/2, 218/2, 193/2, 193/2);
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:iconRect];
    [iconImageView setImage:[UIImage imageNamed:@"patientIconGrey"]];
    [background addSubview:iconImageView];
    
    
    
    
    
    //first name text field
    
    
    
    
    //add the first name textfield
    CGRect firstNameRect = CGRectMake(104/2, 464/2, 557/2, 55/2);
    UITextField *firstNameTextField = [[UITextField alloc] initWithFrame:firstNameRect];
    firstNameTextField.placeholder = @"First Name";
    [firstNameTextField setBackgroundColor:[UIColor whiteColor]];
    [firstNameTextField.layer setBorderColor:[UIColor grayColor].CGColor];
    [firstNameTextField.layer setBorderWidth:1.0];
    [firstNameTextField.layer setCornerRadius:14.f];
    firstNameTextField.font = [UIFont systemFontOfSize:14.f];
    
    //the view inside the textfield, on the left
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    
    //add the icon in the left view
    UIImageView *smallPersonIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personalIconGrey"]];
    smallPersonIcon.frame = CGRectMake(20, 0, 33/2, 35/2);
    [leftView addSubview:smallPersonIcon];
    
    
    firstNameTextField.leftView = leftView;
    firstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    //finally add the whole thing to background
    [background addSubview:firstNameTextField];

    
    
    
    
    //last name text field
    
    
    
    
    
    CGRect lastNameRect = CGRectMake(104/2, 547/2, 557/2, 55/2);
    UITextField *lastNameTextField = [[UITextField alloc] initWithFrame:lastNameRect];
    lastNameTextField.placeholder = @"Last Name";
    [lastNameTextField setBackgroundColor:[UIColor whiteColor]];
    [lastNameTextField.layer setBorderColor:[UIColor grayColor].CGColor];
    [lastNameTextField.layer setBorderWidth:1.0];
    [lastNameTextField.layer setCornerRadius:14.f];
    lastNameTextField.font = [UIFont systemFontOfSize:14.f];
    
    //the view inside the textfield, on the left
    leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    
    //assigning
    lastNameTextField.leftView = leftView;
    lastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    //finally add the whole thing to background
    [background addSubview:lastNameTextField];
    
    
    
    
    
    
    
    //birthday text field
    
    /*
    
    
    //add the first name textfield
    CGRect firstNameRect = CGRectMake(104/2, 464/2, 557/2, 55/2);
    UITextField *firstNameTextField = [[UITextField alloc] initWithFrame:firstNameRect];
    firstNameTextField.placeholder = @"First Name";
    [firstNameTextField setBackgroundColor:[UIColor whiteColor]];
    [firstNameTextField.layer setBorderColor:[UIColor grayColor].CGColor];
    [firstNameTextField.layer setBorderWidth:1.0];
    [firstNameTextField.layer setCornerRadius:14.f];
    firstNameTextField.font = [UIFont systemFontOfSize:14.f];
    
    //the view inside the textfield, on the left
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    
    //add the icon in the left view
    UIImageView *smallPersonIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personalIconGrey"]];
    smallPersonIcon.frame = CGRectMake(20, 0, 33/2, 35/2);
    [leftView addSubview:smallPersonIcon];
    
    
    firstNameTextField.leftView = leftView;
    firstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    //finally add the whole thing to background
    [background addSubview:firstNameTextField];
    */
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//set the size of the modal - coded need for the modal to work properly

-(void)viewWillLayoutSubviews {
    //[super viewWillLayoutSubviews];
    self.view.superview.bounds = CGRectMake(0, 0, 376, 682.5); //intended modal size
    //makes the round corner work
    self.view.superview.backgroundColor = [UIColor clearColor];
    //self.view.layer.cornerRadius = 1.0f;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closePressed{
    
    //add closing procedure
    [self dismissViewControllerAnimated:YES completion:nil]; //close the panel
}

@end
