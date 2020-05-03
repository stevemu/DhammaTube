//
//  ViewController.m
//  DhammadipaYoutube
//
//  Created by Qi Mu on 12/26/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"
#import "MagicalRecord/CoreData+MagicalRecord.h"
#import "YoutubeAPICommunicator.h"

@interface ViewController ()

@property (nonatomic, strong) YTPlayerView *playerView;

@property UIButton *playButton;
@property UIButton *stopButton;
@property UIButton *pauseButton;

@property Video *video;

@property NSString *video_id;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view setBackgroundColor:[UIColor whiteColor]];

    CGRect screenRect = [[UIScreen mainScreen] bounds];


    //title

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 570, 500, 100)];
    [titleLabel setText:@"Time Position Remember Player"];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:titleLabel];

    //player view
    self.playerView = [[YTPlayerView alloc] initWithFrame:CGRectMake(10, 100, screenRect.size.width - 20, 500)];
    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];


//    //buttons
//
//    NSInteger buttonWidth = 100;
//    NSInteger buttonHeight = 100;
//
//    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(250, 700, 3 * buttonWidth, buttonHeight)];
//
//    [self.view addSubview:buttonView];
//
//    //play button
//    _playButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [_playButton setTitle:@"play" forState:UIControlStateNormal];
//    [_playButton setBackgroundColor:[UIColor blackColor]];
//    [_playButton addTarget:self action:@selector(playVideo:) forControlEvents:UIControlEventTouchUpInside];
//
//    [buttonView addSubview:_playButton];
//
//    //stop button
//    _stopButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth, 0, 100, 100)];
//    [_stopButton setTitle:@"stop" forState:UIControlStateNormal];
//    [_stopButton setBackgroundColor:[UIColor blackColor]];
//    [_stopButton addTarget:self action:@selector(stopVideo:) forControlEvents:UIControlEventTouchUpInside];
//
//    [buttonView addSubview:_stopButton];
//
//    //stop button
//    _pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * 2, 0, 100, 100)];
//    [_pauseButton setTitle:@"pause" forState:UIControlStateNormal];
//    [_pauseButton setBackgroundColor:[UIColor blackColor]];
//    [_pauseButton addTarget:self action:@selector(pauseVideo:) forControlEvents:UIControlEventTouchUpInside];
//
//    [buttonView addSubview:_pauseButton];
//


    [MagicalRecord setupCoreDataStack];
    
    _video_id = @"6d7E0Ttgde0";

    //communicator object

//    YoutubeAPICommunicator *youtube = [[YoutubeAPICommunicator alloc] init];

//    [youtube getPlaylistsForUser:@""];

}

-(void)viewWillAppear:(BOOL)animated
{
    self.video = [Video MR_findFirstByAttribute:@"video_id" withValue:_video_id];

    if (!self.video) {
        self.video = [Video MR_createEntity];
        self.video.video_id = _video_id;
        self.video.time = @0;
    }

    [self loadVideo];

    [self saveToDB];

}

-(void)loadVideo
{
    NSNumber *time = self.video.time;

//    NSLog(@"load video method: time: %@", time);


    NSDictionary *playerVars = @ {
        @"playsinline" : @1,
        @"start": time,
        @"autoplay": @1
    };


//    NSLog(@"load video: %@", playerVars);

    [self.playerView loadWithVideoId:self.video.video_id playerVars:playerVars];
}

-(void)playVideo:(id)sender
{
    //play video from the time get from the model

//    NSLog(@"play video button pressed, current state of video: %@", self.video);


    NSDictionary *playerVars = @ {
        @"playsinline" : @1,
        @"start": self.video.time
    };

    [self.playerView loadWithVideoId:self.video.video_id playerVars:playerVars];

}

-(void)stopVideo:(id)sender
{
    [self.playerView stopVideo];

    self.video.time = @0;

}

-(void)pauseVideo:(id)sender
{

//    self.video.time = [NSNumber numberWithInteger:self.playerView.duration];

    [self.playerView pauseVideo];
}

#pragma delegate methods

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state
{
    switch (state) {

        case kYTPlayerStatePaused:
            NSLog(@"%@", @"paused");

            //store the location
            self.video.time = [NSNumber numberWithInteger:playerView.currentTime];

            //save the state of model to db

            [self saveToDB];

            break;

        case kYTPlayerStatePlaying:
            break;

        case kYTPlayerStateEnded:
            NSLog(@"ended");
            break;
            
    }

}

-(void)saveToDB {

    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
