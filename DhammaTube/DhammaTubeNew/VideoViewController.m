//
//  ViewController.m
//  DhammadipaYoutube
//
//  Created by Qi Mu on 12/26/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "VideoViewController.h"
#import "Video.h"
#import "CoreData+MagicalRecord.h"
#import "YoutubeAPICommunicator.h"

@interface VideoViewController ()

@property (nonatomic, strong) YTPlayerView *playerView;

@property UIButton *playButton;
@property UIButton *stopButton;
@property UIButton *pauseButton;

@property Video *video;

@end

@implementation VideoViewController
{
    UILabel *titleLabel;

    NSInteger heightOfPlayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.splitViewController.delegate = self;

//    NSLog(@"%@", self.splitViewController);


    // Do any additional setup after loading the view, typically from a nib.

    [self.view setBackgroundColor:[UIColor whiteColor]];
    heightOfPlayer = 460;

    //title

    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 500, 500, 100)];
    [titleLabel setText:@"Choose a video on the left"];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:titleLabel];

    //player view

    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];

    if (UIDeviceOrientationIsLandscape(orientation))
        self.playerView = [[YTPlayerView alloc] initWithFrame:CGRectMake(0, 64, 704, heightOfPlayer)];
    else
        self.playerView = [[YTPlayerView alloc] initWithFrame:CGRectMake(0, 64, 768, heightOfPlayer)];


    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];

    [self loadVieoFromLastLaunch];


}

-(void)loadVieoFromLastLaunch {
    //find the id of last played video
    NSString *lastVideoId = [GlobalData userDefaultObjectForKey:@"lastVideoId"];

    //if a video has been selected before, load it
    if (lastVideoId) {
        self.video = [Video MR_findFirstByAttribute:@"video_id" withValue:lastVideoId];
        [self loadVideoWithVideo:self.video];
        [self saveToDB];
    } else {
        [self.playerView setBackgroundColor:[UIColor blackColor]];
    }
}

-(void)loadVideoWithVideo:(Video *)video
{
    self.video = video; //save the video here

    if (self.video) {
        NSNumber *time = video.time;

        NSDictionary *playerVars = @ {
            @"playsinline" : @1,
            @"start": time ? time : @0,
            @"autoplay": @1
        };

        [self.playerView loadWithVideoId:video.video_id playerVars:playerVars];
        
        [self updateUI];
    }

}

-(void)updateUI {

    [titleLabel setText:self.video.title];

}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {

    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [self changeToLandscape];

    } else if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [self changeToPortrait];

    }

}

-(void)changeToLandscape {

    [self.playerView setFrame:CGRectMake(0, 64, 704, 500)];

}

-(void)changeToPortrait {

    [self.playerView setFrame:CGRectMake(0, 64, 768, 500)];

}

#pragma delegate methods

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state
{
    switch (state) {

        case kYTPlayerStatePaused:
            NSLog(@"%@", @"paused");
            self.video.time = [NSNumber numberWithInteger:playerView.currentTime];  //store the location

            [self saveToDB]; //save the state of model to db
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



-(BOOL)shouldAutorotate {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISplitViewControllerDelegate

-(void)awakeFromNib
{
    self.splitViewController.delegate = self;
}

- (BOOL)splitViewController:(UISplitViewController *)svc
   shouldHideViewController:(UIViewController *)vc
              inOrientation:(UIInterfaceOrientation)orientation
{
    return UIInterfaceOrientationIsPortrait(orientation);
}


-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
//NSLog(@"here");
    [barButtonItem setTitle:@"Browse Talks"];
    self.navigationItem.leftBarButtonItem = barButtonItem;

}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    self.navigationItem.leftBarButtonItem = nil;
}


@end
