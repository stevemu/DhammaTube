//
//  YoutubeAPICommunicator.h
//  PositionRememberingYoutubePlayer
//
//  Created by Qi Mu on 12/27/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoutubeAPICommunicator : NSObject

-(NSArray *)getPlaylistsForUser:(NSString *)user;



@end
