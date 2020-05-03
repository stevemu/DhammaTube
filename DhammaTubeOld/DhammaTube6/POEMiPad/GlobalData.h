//
//  GlobalData.h
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoViewController.h"
#import "Video.h"

@interface GlobalData : NSObject

+(void)setCurrentPlayListId: (NSString *) playlistId;
+(NSString *)currentPlaylistId;
+(void)setCurrentUsername: (NSString *) val;
+(NSString *)currentUsername;
+(void)setCurrentChannelId: (NSString *) val;
+(NSString *)currentChannelId;
+(void)setCurrentVideoId: (NSString *) val;
+(NSString *)currentVideoId;

+(void)setViewViewController: (VideoViewController *) val;
+(VideoViewController *)viewViewController;

+(void)setJustLaunched: (BOOL) val;
+(BOOL)isJustLaunched;

+(void)setUserDefaultObject:(id)object forKey:(NSString *)key;
+(id)userDefaultObjectForKey:(NSString *)key;
+(Video *)videoWithId:(NSString *)videoId title:(NSString *)title;

@end
