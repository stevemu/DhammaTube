//
//  MenuViewController.m
//  DhammaTube
//
//  Created by Qi Mu on 12/28/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "MenuViewController.h"
#import "Video.h"
#import "PlaylistsViewController.h"

@interface MenuViewController () <NIMutableTableViewModelDelegate>

@property (nonatomic, strong) NIMutableTableViewModel* model;
@property (nonatomic, strong) NIMutableTableViewModel* actions;
@property (nonatomic, strong) NSIndexPath* indexPathForDeletion;

@property (nonatomic, strong) NSMutableArray *usernames;
@property (nonatomic, strong) NSMutableDictionary *channelIds;

@property (nonatomic, retain) NITableViewActions* actions2;


@end

@implementation MenuViewController {
    UIAlertView *confirmationAlertView;
    UIAlertView *input;
}

-(void)initializeUsernamesAndChannelList {

    //clear user default
//    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];

    //get user names from persistance storage
    _usernames = [GlobalData userDefaultObjectForKey:@"usernames"];
    _channelIds = [GlobalData userDefaultObjectForKey:@"channelIds"];

    //if cannot find anything, create at least one
    if (!_usernames || !_channelIds) {

        //titles
        _usernames = [[NSMutableArray alloc] init];
        _channelIds = [[NSMutableDictionary alloc] init];

        //add chuang yen monastery channel info
        [_usernames addObject:@"bauscym"];
        [_channelIds setValue:@"UC10gOUiIlfStwK3MyC8UG0w" forKey:@"bauscym"];

        [self saveLists];

    }

}

-(void)saveLists {
    //save those two to persistance
    [GlobalData setUserDefaultObject:_usernames forKey:@"usernames"];
    [GlobalData setUserDefaultObject:_channelIds forKey:@"channelIds"];
}

-(void)awakeFromNib
{
//NSLog(@"awake from nib");
    [self initializeUsernamesAndChannelList]; //initialize the two basic array

    _model = [[NIMutableTableViewModel alloc] initWithDelegate:self];

    [_model setSectionIndexType:NITableViewModelSectionIndexNone
                    showsSearch:NO
                   showsSummary:NO];

    //add data from user list
    for (NSString *username in _usernames) {
        [self.model addSectionWithTitle:@""];
        NSMutableArray *objects = [[NSMutableArray alloc] init];
        [objects addObject:[NITitleCellObject objectWithTitle:username]];

        [self.model addObjectsFromArray:objects];
        [self.model updateSectionIndex];
    }


    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddButton:)];

}

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:UITableViewStylePlain])) {
//        NSLog(@"%@", @"in init");

    }
    return self;
}

- (void)didTapAddButton:(UIBarButtonItem *)buttonItem {

    //input a new youtube username
    input = [[UIAlertView alloc] initWithTitle:@"Add new channel" message:@"Enter a youtube username" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    input.alertViewStyle = UIAlertViewStylePlainTextInput;
    [input show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    //add a new row (or really section)
    if (alertView == input) {

        //Ok is pressed
        if (buttonIndex == 1) {

            //new username
            NSString *username = [[alertView textFieldAtIndex:0] text];

            //get the channel id
            [YoutubeAPICommunicator channelIdWithUsername:username completionBlock:^(NSString *channelId) {

                //add username and channel id to the array
                [_usernames addObject:username];
                [_channelIds setValue:channelId forKey:username];
                [self saveLists]; //save it

                //add the username to the table

                NSIndexSet* indexSet = [self.model addSectionWithTitle:@""];


                NSMutableArray *objects = [NSMutableArray array];
                [objects addObject:[NITitleCellObject objectWithTitle:username]];

                NSArray* indexPaths = [self.model addObjectsFromArray:objects];

                [self.model updateSectionIndex];

                [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                [self.tableView scrollToRowAtIndexPath:indexPaths.lastObject atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                [self.tableView reloadData];

            }];
            
        }

    } else if (alertView == confirmationAlertView) {

        if (alertView.cancelButtonIndex != buttonIndex) {
            [self deleteCellAtSavedIndexPath];

        }

    }

}

-(void)deleteCellAtSavedIndexPath {

    // If the user hits "OK" then let's delete the object from the model.


    NSInteger *sectionToBeDeleted = self.indexPathForDeletion.section;

    [self.model removeSectionAtIndex:sectionToBeDeleted];

    NSIndexSet *s = [NSIndexSet indexSetWithIndex:sectionToBeDeleted];
        [self.tableView deleteSections:s withRowAnimation:UITableViewRowAnimationFade];


    //remove it from the array and save it
    [_usernames removeObjectAtIndex:sectionToBeDeleted];
    [self saveLists];
    [self.model updateSectionIndex];

    // Now that we've deleted the object we no longer need this index path.
    self.indexPathForDeletion = nil;

}

#pragma mark - NIMutableTableViewModelDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%d", indexPath.section);

    NSString *username = _usernames[indexPath.section]; //get the user name
    NSString *channelId = [_channelIds valueForKey:username]; //get the channel id

    [GlobalData setUserDefaultObject:channelId forKey:@"lastChannelId"]; //save the session data
    [GlobalData setCurrentChannelId:channelId]; //make it global
    [GlobalData setJustLaunched:NO]; //if a selection is made, turn off just launch

    //push the play list controller
    PlaylistsViewController *playlist = [[PlaylistsViewController alloc] init];
    [self.navigationController pushViewController:playlist animated:YES];

}

- (BOOL)tableViewModel:(NIMutableTableViewModel *)tableViewModel
         canEditObject:(id)object
           atIndexPath:(NSIndexPath *)indexPath
           inTableView:(UITableView *)tableView {
    // We want every cell to be editable.

    //cannot delete bauscym
    if (indexPath.section == 0) {
        return NO;
    }

    return YES;
}

- (BOOL)tableViewModel:(NIMutableTableViewModel *)tableViewModel
    shouldDeleteObject:(id)object
           atIndexPath:(NSIndexPath *)indexPath
           inTableView:(UITableView *)tableView {

    self.indexPathForDeletion = indexPath;

    [self deleteCellAtSavedIndexPath];
//    confirmationAlertView = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you that sure you want to delete this channel?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
//    [confirmationAlertView show];

    return NO;
}

- (UITableViewCell *)tableViewModel:(NITableViewModel *)tableViewModel
                   cellForTableView:(UITableView *)tableView
                        atIndexPath:(NSIndexPath *)indexPath
                         withObject:(id)object {

    return [NICellFactory tableViewModel:tableViewModel cellForTableView:tableView atIndexPath:indexPath withObject:object];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Youtube Channels"];

    self.tableView.dataSource = _model;




}

-(void)viewDidAppear:(BOOL)animated
{

}

-(void)preload
{
    //if the app is just launched, load those navigations
    if ([GlobalData isJustLaunched]) {

        //simulate have selected an channel
        NSString *lastChannelId = [GlobalData userDefaultObjectForKey:@"lastChannelId"];

        //if the app is not launching for the first time, don't load
        if (lastChannelId) {
            [GlobalData setCurrentChannelId:lastChannelId];

            //push to play list list
            PlaylistsViewController *list = [[PlaylistsViewController alloc] init];
            [self.navigationController pushViewController:list animated:YES];

        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NIIsSupportedOrientation(toInterfaceOrientation);
}


@end
