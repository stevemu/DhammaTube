//
//  ZZZMasterViewController.h
//  Zobreus
//
//  Created by Qi Mu on 5/30/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZZZDetailViewController;

#import <CoreData/CoreData.h>

@interface ZZZSideBarViewController : UITableViewController <NSFetchedResultsControllerDelegate>

//@property (strong, nonatomic) ZZZDetailViewController *detailViewController;

//@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
//@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property NSString *name;

-(UIColor *)getNavBgColorFromSubscript:(int)sub;

@end
