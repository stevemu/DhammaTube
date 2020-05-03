//
//  PatientCell.h
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientCell : UITableViewCell

@property NSString * name;
@property (weak, nonatomic) IBOutlet UILabel *patientName;

-(void)setPatient:(NSString *) name;

@end
