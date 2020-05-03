//
//  ViewController.h
//  DhammadipaYoutube
//
//  Created by Qi Mu on 12/26/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"
#import "Video.h"
#import "VideoSelectionDelegate.h"

@interface VideoViewController : UIViewController <YTPlayerViewDelegate, UISplitViewControllerDelegate, VideoSelectionDelegate>

-(void)loadVideoWithVideo:(Video *)video;

-(void)selectedVideo:(Video *)video;

-(void)loadVideoWithVideoId:(NSString *)videoId;

//-(void)playVideo:(id)sender;
//-(void)stopVideo:(id)sender;

@end

