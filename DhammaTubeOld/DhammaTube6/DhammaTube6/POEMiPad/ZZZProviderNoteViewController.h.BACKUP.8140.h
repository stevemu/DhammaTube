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
#import "HistoryTableViewController.h"

@interface ZZZProviderNoteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fieldLabel;
<<<<<<< HEAD
-(void)leftBarButtonClicked;

@property BOOL alreadyShiftToLeft;

-(void)shiftThings;
=======
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong) UITableViewController * controller;
>>>>>>> pastmedicalhistory

@end
