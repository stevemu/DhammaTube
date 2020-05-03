//
//  MyInfoViewCell.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "MyInfoViewCell.h"

@implementation MyInfoViewCell

@synthesize content;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)loadContent:(UserMetric *)info{
    [self setContent:[[UserMetric alloc]init]];
    [self setContent:info];
    [[self name] setText:info.title];
    [_info setText:info.info];
}

@end
