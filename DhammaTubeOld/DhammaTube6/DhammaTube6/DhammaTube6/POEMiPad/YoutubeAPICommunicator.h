//
//  YoutubeAPICommunicator.h
//  PositionRememberingYoutubePlayer
//
//  Created by Qi Mu on 12/27/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoutubeAPICommunicator : NSObject

+ (void) playlistsWithChannelId:(NSString *)channelId completion:(void(^)(NSArray *, NSArray *))completion;

+ (void) channelIdWithUsername:(NSString *)username
              completionBlock:(void(^)(NSString *))completion;

+ (void) videosWithPlaylistId:(NSString *)playlistId completion:(void(^)(NSArray *, NSArray *))completion;

@end
