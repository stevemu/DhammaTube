//
//  MyInfoViewController.h
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *Birthday;
@property (weak, nonatomic) IBOutlet UILabel *MaritalStatus;
@property (weak, nonatomic) IBOutlet UILabel *HomeNumber;
@property (weak, nonatomic) IBOutlet UILabel *cellNumber;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *language;
@property (weak, nonatomic) IBOutlet UILabel *ethnicity;
@property (weak, nonatomic) IBOutlet UILabel *religion;
@property (weak, nonatomic) IBOutlet UILabel *street;
@property (weak, nonatomic) IBOutlet UILabel *adress;
@property (weak, nonatomic) IBOutlet UILabel *city;

@property NSMutableArray * TableComponents;

@end
