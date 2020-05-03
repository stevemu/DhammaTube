//
//  UserMetric.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "UserMetric.h"

@implementation UserMetric

@synthesize title;
@synthesize info;

- (instancetype)initWithName: (NSString *) name
                    withInfo: (NSString *) info
{
    self = [super init];
    if (self) {
        [self setTitle:name];
        [self setInfo:info];
    }
    return self;
}

@end
