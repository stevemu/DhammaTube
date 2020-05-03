//
//  MyInfoViewCell.h
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserMetric.h"

@interface MyInfoViewCell : UITableViewCell

@property UserMetric * content;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *info;

- (void)loadContent:(UserMetric *)info;

@end
