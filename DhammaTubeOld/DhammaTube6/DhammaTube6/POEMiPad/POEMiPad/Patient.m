//
//  Patient.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "Patient.h"

@implementation Patient

@synthesize name;

- (instancetype)initWithName
{
    self = [super init];
    if (self) {
        [self setName:name];
    }
    return self;
}

@end
