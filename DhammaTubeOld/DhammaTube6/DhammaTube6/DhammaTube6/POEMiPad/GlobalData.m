//
//  GlobalData.m
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "GlobalData.h"
#import "VideoViewController.h"

static NSString *currentPlaylistId;
static NSString *currentUsername;
static NSString *currentChannelId;
static NSString *currentVideoId;
static VideoViewController *viewViewController;

@implementation GlobalData

+(void)setViewViewController: (VideoViewController *) val {
    viewViewController = val;
}

+(VideoViewController *)viewViewController {
    return viewViewController;
}

+(void)setCurrentPlayListId: (NSString *) playlistId {
    currentChannelId = playlistId;
}

+(NSString *)currentPlaylistId {
    return currentChannelId;
}

+(void)setCurrentUsername: (NSString *) val {
    currentUsername = val;
}

+(NSString *)currentUsername {
    return currentUsername;
}

+(void)setCurrentChannelId: (NSString *) val {
    currentChannelId = val;
}

+(NSString *)currentChannelId {
    return currentChannelId;
}

+(void)setCurrentVideoId: (NSString *) val {
    currentVideoId = val;
}

+(NSString *)currentVideoId {
    return currentVideoId;
}


@end
