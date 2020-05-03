//
//  Video.h
//  DhammaTube
//
//  Created by Qi Mu on 12/29/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Video : NSManagedObject

@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * video_id;
@property (nonatomic, retain) NSManagedObject *playlist;

@end
