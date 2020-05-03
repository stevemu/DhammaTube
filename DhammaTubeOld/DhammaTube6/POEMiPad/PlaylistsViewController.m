//
//  PlaylistsViewController.m
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "PlaylistsViewController.h"
#import "VideoListViewController.h"

@interface PlaylistsViewController ()

@property (nonatomic, retain) NITableViewModel* model;
@property (nonatomic, retain) NITableViewActions* actions;

@property (nonatomic, retain) NSMutableArray *titles;
@property (nonatomic, retain) NSMutableArray *ids;

@end

@implementation PlaylistsViewController
{
}

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:UITableViewStylePlain])) {

        _actions = [[NITableViewActions alloc] initWithTarget:self];

        NIActionBlock tapAction = ^BOOL(id object, UIViewController *controller, NSIndexPath* indexPath) {

            NSString *playlistId = _ids[indexPath.row];

            //set the playlist as global
            [GlobalData setCurrentPlayListId:playlistId];

            //store the playlist id
            [GlobalData setUserDefaultObject:playlistId forKey:@"lastPlaylistId"];


            //if a selection is made, turn off just launch
            [GlobalData setJustLaunched:NO];
            
            return YES;
        };

        //get lists of titles and ids for playlists
        [YoutubeAPICommunicator playlistsWithChannelId:[GlobalData currentChannelId] completion: ^(NSArray *titles, NSArray *ids) {

            NSMutableArray *tableContents = [[NSMutableArray alloc] init];

            _titles = [NSMutableArray arrayWithArray:titles];
            _ids = [NSMutableArray arrayWithArray:ids];


            for (NSString *title in _titles) {

                id temp = [_actions attachToObject:
                           [_actions attachToObject:[NITitleCellObject objectWithTitle:title]
                                    navigationBlock:NIPushControllerAction([VideoListViewController class])]
                                          tapBlock:tapAction];

                [tableContents addObject:temp];
            }

            _model = [[NITableViewModel alloc] initWithListArray:tableContents
                                                        delegate:(id)[NICellFactory class]];
            
            self.tableView.dataSource = self.model;
            
            self.tableView.delegate = [self.actions forwardingTo:self];
            
            [self.tableView reloadData];
        }];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Playlists"];

    //if the app is just launched, load those navigations
    if ([GlobalData isJustLaunched]) {

        //simulate have selected an channel
        NSString *lastPlaylistId = [GlobalData userDefaultObjectForKey:@"lastPlaylistId"];

        //if the app is just launched for the first time, don't load
        if (lastPlaylistId) {
            [GlobalData setCurrentPlayListId:lastPlaylistId];

            //push to video list
            VideoListViewController *list = [[VideoListViewController alloc] init];
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
