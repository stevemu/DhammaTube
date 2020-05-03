//
//  PatientCell.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "PatientCell.h"

@implementation PatientCell

@synthesize name;


- (IBAction)link:(id)sender {
    NSLog(@"to %@'s page",name);
}

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
-(void)setPatient: (NSString *) name{
    [self setName:name];
    [[self patientName]setText:name];
}

@end