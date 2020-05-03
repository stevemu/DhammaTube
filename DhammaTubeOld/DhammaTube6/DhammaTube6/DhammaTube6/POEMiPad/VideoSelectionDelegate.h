//
//  VideoSelectionDelegate.h
//  DhammaTube
//
//  Created by Qi Mu on 12/28/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"

@protocol VideoSelectionDelegate <NSObject>

@required

-(void)selectedVideo:(Video *)video;

@end
