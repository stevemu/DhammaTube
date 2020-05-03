//
//  MenuViewController.m
//  DhammaTube
//
//  Created by Qi Mu on 12/28/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "MenuViewController.h"
#import "Video.h"

@interface MenuViewController ()

@property (nonatomic, retain) NITableViewModel* model;
@property (nonatomic, retain) NITableViewActions* actions;
@property (nonatomic, retain) NSMutableArray *videos;

@end

@implementation MenuViewController
{
    NIActionBlock tapAction;
}

//-(NSMutableArray *)videos {
//
//    if (!_videos) {
//        _videos = [[NSMutableArray alloc] init];
//    } else
//        return _videos;
//
//    return _videos;
//}

-(void)initVideoData {

    _videos = [[NSMutableArray alloc] init];

    NSArray *videoDatas = @[
                        @[@"2014 8-Day Immeasurable mind Meditation Retreat-1/8", @"91gdBEM9W20"],
                        @[@"2014 8-Day Immeasurable mind Meditation Retreat-2/8", @"75V0xBLHloQ"]

    ];

    for (NSArray *videoArr in videoDatas) {


        Video *video;

        NSString *title = videoArr[0];
        NSString *videoid = videoArr[1];

        //find the model

        video = [Video MR_findFirstByAttribute:@"video_id" withValue:videoid];

        //create it
        if (!video) {
            video = [Video MR_createEntity];
            video.video_id = videoid;
            video.title = title;
        }

        [_videos addObject:video];

    }


    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];


}

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:UITableViewStylePlain])) {
        [self initVideoData];

        _actions = [[NITableViewActions alloc] initWithTarget:self];

        tapAction = ^BOOL(id object, UIViewController *controller, NSIndexPath* indexPath) {

            [self.navigationController dismissViewControllerAnimated:YES completion:nil];

            [_delegate selectedVideo:_videos[indexPath.row]];


            return YES;
        };

        NSArray *tableContents = [self createTableContents];

        _model = [[NITableViewModel alloc] initWithSectionedArray:tableContents
                                                    delegate:(id)[NICellFactory class]];
    }
    return self;
}

-(NSArray *)createTableContents {

    NSMutableArray *tableContents = [[NSMutableArray alloc] init];

    for (Video *video in _videos) {

        NSString *title = video.title;

        id temp = [_actions attachToObject:[NITitleCellObject objectWithTitle:title]
                                  tapBlock:tapAction];

        [tableContents addObject:temp];

    }


    return [NSArray arrayWithArray:tableContents];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Talks"];

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
