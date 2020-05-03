//
//  ProviderViewController.h
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientCell.h"

@interface ProviderViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property NSMutableArray * patients;

@end
