//
//  ZZZMasterViewController.m
//  Zobreus
//
//  Created by Qi Mu on 5/30/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "ZZZSideBarViewController.h"
#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "ZZZProviderNoteViewController.h"
#import "SignInModalViewController.h"
#import "MyInfoViewController.h"
#import "ZZZSettingViewController.h"
#import "ProviderViewController.h"

@interface ZZZSideBarViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation ZZZSideBarViewController {
    NSArray *navigations;
}

- (void)awakeFromNib
{
   // self.clearsSelectionOnViewWillAppear = NO;
    ///self.preferredContentSize = CGSizeMake(320.0, 600.0);
    //self.contentSizeForViewInPopover = CGSizeMake(100, 600);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    navigations = @[@"Personal", @"Biometrics", @"Providers", @"Consultants", @"Studies", @"Goals", @"Calendar", @"Messages"];
	// Do any additional setup after loading the view, typically from a nib.
    /*self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (ZZZDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];*/
   // _name = @"James Jean";
    self.title = @"MENU";
    NSLog(@"here");
    
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subMenuUserAvatar"]];
    
    //UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] init];
    //leftButton.title = @"test";
    //self.navigationItem.leftBarButtonItem == leftButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //UIImage *pattern = [UIImage imageNamed:@"editButton"];
    //[cell setBackgroundColor:[UIColor colorWithPatternImage:pattern]];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return [[self.fetchedResultsController sections] count];
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    //return [sectionInfo numberOfObjects];
    return [navigations count];
}

-(UIImage *)getNavIconFromSubscript:(int)sub {
    UIImage *icon;
    
    switch (sub) {
        case 3:
            icon = [UIImage imageNamed:@"personalIconWhite"];
            break;
        case 4:
            icon = [UIImage imageNamed:@"biometricsIconWhite"];
            break;
        case 5:
            icon = [UIImage imageNamed:@"providersIconWhite"];
            break;
        case 6:
            icon = [UIImage imageNamed:@"consultingIconWhite"];
            break;
        case 7:
            icon = [UIImage imageNamed:@"NavPersonalWhite"];
            break;
        case 8:
            icon = [UIImage imageNamed:@"goalsIconWhite"];
            break;
        case 9:
            icon = [UIImage imageNamed:@"calendarIconWhite"];
        
        
        default:
            icon = [UIImage imageNamed:@"NavPersonalWhite"];
            break;
    }
    
    return icon;
}


-(UIColor *)getNavBgColorFromSubscript:(int)sub {
    UIColor *color;
    
    
    switch (sub) {
        case 1:
            color = [UIColor colorWithRed:77/255.0f green:36/255.0f blue:63/255.0f alpha:1.0f];
            break;
        case 2:
            color = [UIColor colorWithRed:4/255.0f green:135/255.0f blue:185/255.0f alpha:1.0f];
            break;
            
        case 3:
            color = [UIColor colorWithRed:181/255.0f green:177/255.0f blue:128/255.0f alpha:1.0f];
            break;
            
        case 4:
            color = [UIColor colorWithRed:232/255.0f green:176/255.0f blue:4/255.0f alpha:1.0f];
            break;
            
        case 5:
            color = [UIColor colorWithRed:206/255.0f green:67/255.0f blue:28/255.0f alpha:1.0f];
            break;
            
        case 6:
            color = [UIColor colorWithRed:59/255.0f green:172/255.0f blue:65/255.0f alpha:1.0f];
            break;
            
        case 7:
            color = [UIColor colorWithRed:93/255.0f green:50/255.0f blue:121/255.0f alpha:1.0f];
            break;
            
        case 8:
            color = [UIColor colorWithRed:49/255.0f green:50/255.0f blue:44/255.0f alpha:1.0f];
            break;
            
        default:
            color = [UIColor colorWithRed:00/255.0f green:36/255.0f blue:63/255.0f alpha:1.0f];
            break;
    }
    
    return color;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //bug: goals and calendar icon do not display initially
    
    if (indexPath.row >= 2) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nav"];
        //cell.textLabel.text = navigations[indexPath.row-1];
        
        UIColor *backgroundColor = [self getNavBgColorFromSubscript:indexPath.row];
        [cell.contentView setBackgroundColor: backgroundColor];
        
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:1];
        [imageView setImage:[self getNavIconFromSubscript:indexPath.row]];
        
        
        UILabel *label;
        label = (UILabel *)[cell viewWithTag:2];
        label.text = [NSString stringWithFormat:@"%@", navigations[indexPath.row-2]];
        
        
        
        return cell;
        
    } else if (indexPath.row == 1) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"search"];
        cell.textLabel.text = @"Search";
        
        
        
        return cell;
        
        
        
    } else if (indexPath.row  == 0 ) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profile"];
        cell.textLabel.text = @"Profile";
        
        
        return cell;
        
    }
    
    /*
    else {
    
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nav"];
        cell.textLabel.text = @"test";
        return cell;
    }*/
    
    return nil;
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    //self.detailViewController.detailItem = object;
}

#pragma mark - Fetched results controller



- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */


@end
