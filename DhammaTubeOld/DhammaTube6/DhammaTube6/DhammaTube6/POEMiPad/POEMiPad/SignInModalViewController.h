//
//  SignInModalViewController.h
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/11/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInModalViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property NSString * Iusername;
@property NSString * Ipassword;

@end
