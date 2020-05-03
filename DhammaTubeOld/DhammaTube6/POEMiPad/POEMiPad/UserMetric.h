//
//  UserMetric.h
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UserMetric : UIView

@property NSString * title;
@property NSString * info;

- (instancetype)initWithName: (NSString *) name
                    withInfo: (NSString *) info;

@end
