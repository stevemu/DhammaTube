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

@interface VideoViewController : UIViewController <YTPlayerViewDelegate, UISplitViewControllerDelegate>

-(void)loadVideoWithVideo:(Video *)video;


@end

