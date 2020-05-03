//
//  ProviderNoteMainViewController.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/13/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "ProviderNoteMainViewController.h"
#import "PresentingIssuesTableViewController.h"
#import "VitalSignsTableViewController.h"
#import "ConstitutionalTableViewController.h"
#import "General_HEENTTableViewController.h"
/*#import "ChemistriesMicrobiologiesTableViewController.h"*/

@interface ProviderNoteMainViewController ()

@property UITableViewController * current;
@property NSMutableArray * tableViewControllers;

@end

@implementation ProviderNoteMainViewController
{
    int location;
}

@synthesize current;
@synthesize tableViewControllers;

- (IBAction)next:(id)sender {
    /*UITableViewController * loadview = [[VitalSignsTableViewController alloc] initWithNibName:@"VitalSignsTableViewController" bundle:nil];*/
    
    if (location < tableViewControllers.count - 1){
        NSString * atController = [[self tableViewControllers] objectAtIndex:++location];
        [_note setText:atController];
        
        UITableView * newTable = [[UITableView alloc] initWithFrame:current.view.frame];
        [[self current] setView:newTable];
        
        
        UITableViewController * loadview = [self getController:atController];
        [newTable setDataSource:loadview];
        [newTable setDelegate:loadview];
        NSLog(@"%i",[self childViewControllers].count);
        
        [loadview setView:_table];
        
        [loadview loadView];
        current = loadview;
        
    }
}




-(UITableViewController *)getController:(NSString *)panel{
    if ([panel isEqual:@"Presenting Issues"]){
        return [[PresentingIssuesTableViewController alloc] initWithNibName:@"PresentingIssuesTableViewController" bundle:nil];
    }else if( [panel isEqual:@"Vital Signs"]){
        return [[VitalSignsTableViewController alloc] initWithNibName:@"VitalSignsTableViewController" bundle:nil];
    }else if( [panel isEqual:@"Constitutional"]){
        return [[ConstitutionalTableViewController alloc] initWithNibName:@"ConstitutionalTableViewController" bundle:nil];
    }else if( [panel isEqual:@"General/HEENT"]){
        return [[General_HEENTTableViewController alloc] initWithNibName:@"General_HEENTTableViewController" bundle:nil];
    /*}else if ([panel isEqual:@"Chemistries and Microbiologies"]){
        return [[ChemistriesMicrobiologiesTableViewController alloc] init];*/
    }else;
        return nil;
}

-(void)loadControllers{
    [self setTableViewControllers:[[NSMutableArray alloc] init]];
    [[self tableViewControllers] addObject:@"Presenting Issues"];
    [[self tableViewControllers] addObject:@"Vital Signs"];
    [[self tableViewControllers] addObject:@"Constitutional"];
    [[self tableViewControllers] addObject:@"General/HEENT"];
    [[self tableViewControllers] addObject:@"Chemistries and Microbiologies"];
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        location = 0;
        [self loadControllers];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    current = [[PresentingIssuesTableViewController alloc] initWithNibName:@"PresentingIssuesTableViewController" bundle:nil];
    
    [[self table] setDataSource:current];
    [[self table] setDelegate:current];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
