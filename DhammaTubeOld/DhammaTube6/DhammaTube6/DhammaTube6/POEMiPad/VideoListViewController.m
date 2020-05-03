//
//  VideoListViewController.m
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "VideoListViewController.h"

@interface VideoListViewController ()

@property (nonatomic, retain) NITableViewModel* model;
@property (nonatomic, retain) NITableViewActions* actions;
//@property (nonatomic, retain) NSMutableArray *videos;

@property (nonatomic, retain) NSMutableArray *titles;
@property (nonatomic, retain) NSMutableArray *ids;

@end

@implementation VideoListViewController
{
}


- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:UITableViewStylePlain])) {

        _actions = [[NITableViewActions alloc] initWithTarget:self];

        NIActionBlock tapAction = ^BOOL(id object, UIViewController *controller, NSIndexPath* indexPath) {

            VideoViewController *detailView = [GlobalData viewViewController];
            [detailView loadVideoWithVideoId:_ids[indexPath.row]];

            //set the playlist as global

            [GlobalData setCurrentVideoId:_ids[indexPath.row]];

            return YES;
        };

        //get lists of titles and ids for playlists
        [YoutubeAPICommunicator videosWithPlaylistId:[GlobalData currentPlaylistId] completion:^(NSArray *titles, NSArray *ids) {

            NSMutableArray *tableContents = [[NSMutableArray alloc] init];

            _titles = [NSMutableArray arrayWithArray:titles];
            _ids = [NSMutableArray arrayWithArray:ids];

            for (NSString *title in _titles) {

                id temp = [_actions attachToObject:[NITitleCellObject objectWithTitle:title]
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
    [self setTitle:@"Videos"];

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
