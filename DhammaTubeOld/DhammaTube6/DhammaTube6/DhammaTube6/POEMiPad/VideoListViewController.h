//
//  VideoListViewController.h
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoSelectionDelegate.h"

@interface VideoListViewController : UITableViewController

@property (nonatomic, assign) id<VideoSelectionDelegate> delegate;

@end
