//
//  Channel.h
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Channel : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * channel_id;
@property (nonatomic, retain) NSManagedObject *playlists;

@end
