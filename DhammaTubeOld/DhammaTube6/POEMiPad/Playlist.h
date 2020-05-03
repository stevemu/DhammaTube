//
//  Playlist.h
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Channel, Video;

@interface Playlist : NSManagedObject

@property (nonatomic, retain) NSString * playlist_id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Channel *channel;
@property (nonatomic, retain) Video *videos;

@end
