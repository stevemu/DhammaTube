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

static BOOL justLaunched;

@implementation GlobalData

//for navigating dynamically

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

+(void)setJustLaunched: (BOOL) val {

    justLaunched = val;
}

+(BOOL)isJustLaunched {
    return justLaunched;
}

+(void)setUserDefaultObject:(id)object forKey:(NSString *)key {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];

}

+(id)userDefaultObjectForKey:(NSString *)key {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id object = [defaults objectForKey:key];
    return object;

}

+(Video *)videoWithId:(NSString *)videoId title:(NSString *)title {

    Video *video = [Video MR_findFirstByAttribute:@"video_id" withValue:videoId];

    //create the video if it has not been created before
    if (!video) {
        video = [Video MR_createEntity];
        video.video_id = videoId;
        video.time = @0;
    }

    video.title = title;

    return video;
}

@end
