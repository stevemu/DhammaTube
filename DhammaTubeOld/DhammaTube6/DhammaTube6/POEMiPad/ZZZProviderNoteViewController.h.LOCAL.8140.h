//
//  ZZZProviderNoteViewController.h
//  ProviderNote3
//
//  Created by Qi Mu on 6/10/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZZIconToDrag.h"
#import "ZZZFieldBackground.h"

@interface ZZZProviderNoteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fieldLabel;
-(void)leftBarButtonClicked;

@property BOOL alreadyShiftToLeft;

-(void)shiftThings;

@end
