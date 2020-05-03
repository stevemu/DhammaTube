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

@interface MenuViewController ()

@property (nonatomic, retain) NITableViewModel* model;
@property (nonatomic, retain) NITableViewActions* actions;

@property (nonatomic, strong) NSMutableArray *usernames;
@property (nonatomic, strong) NSMutableArray *channelIds;


@end

@implementation MenuViewController
{
}

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:UITableViewStylePlain])) {

        _actions = [[NITableViewActions alloc] initWithTarget:self];

        NSArray *tableContents = [self createTableContentsWithUsers];

        _model = [[NITableViewModel alloc] initWithSectionedArray:tableContents
                                                    delegate:(id)[NICellFactory class]];
    }
    return self;
}

-(NSArray *)createTableContentsWithUsers {

    NIActionBlock tapAction = ^BOOL(id object, UIViewController *controller, NSIndexPath* indexPath) {

        [GlobalData setCurrentUsername:_usernames[indexPath.row]];
        [GlobalData setCurrentChannelId:_channelIds[indexPath.row]];

        return YES;
    };

    NSMutableArray *tableContents = [[NSMutableArray alloc] init];

    //dummy play lists

    //titles

    _usernames = [[NSMutableArray alloc] init];

    [_usernames addObject:@"bauscym"];

    //playlists ids

    _channelIds = [[NSMutableArray alloc] init];

    [_channelIds addObject:@"UC10gOUiIlfStwK3MyC8UG0w"];

    for (NSString *username in _usernames) {

        id temp = [_actions attachToObject:
                   [_actions attachToObject:[NITitleCellObject objectWithTitle:username]
                            navigationBlock:NIPushControllerAction([PlaylistsViewController class])]
                                  tapBlock:tapAction];

        [tableContents addObject:temp];

    }

    return [NSArray arrayWithArray:tableContents];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Youtube Usernames"];

    self.tableView.dataSource = _model;
    self.tableView.delegate = [self.actions forwardingTo:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NIIsSupportedOrientation(toInterfaceOrientation);
}


@end
