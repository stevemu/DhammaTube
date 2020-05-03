//
//  FHView.m
//  POEMiPad
//
//  Created by Qi Mu on 9/9/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "SocialHistoryView.h"
#import "SocialHistoryIncident.h"
#import "SocialHistoryCell.h"
#import "PersonalIncident.h"
#import "NSDate+ZZZDateUtilities.h"

@implementation SocialHistoryView {
    UtilityBar * searchBar;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self feedData];
        
        searchBar = [[UtilityBar alloc] initWithOrigin:CGPointMake(0, 0)
                                             withWidth:[[UIScreen mainScreen] bounds].size.width
                                          withDelegate:self];
        
        CGSize referenceSize = [[UIScreen mainScreen] bounds].size;
        
        
        _table = [UITableView new];
        
        [_table setFrame:CGRectMake(0, 50,
                                    referenceSize.width,
                                    referenceSize.height)];
        
        [self addSubview:[searchBar view]];
        [self addSubview:_table];
        
        [_table setBackgroundColor:[UIColor clearColor]];
        
        [_table setDataSource:self];
        [_table setDelegate:self];
        
    }
    return self;
}

-(void)feedData {
    
    //waiting
    
    _models = [SocialHistoryIncident MR_findAll];
    
}

-(void)searchFor:(NSString *)input {
    
    //refeed model depending on the input
    
    //if the input becomes empty, display all model
    if ([input isEqualToString:@""]) {
        _models = [SocialHistoryIncident MR_findAll];
    } else {
        
        //find those model start with the input
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"condition contains [cd] %@", input];
        
        _models = [SocialHistoryIncident MR_findAllWithPredicate:predicate];
        
    }
    
    [_table reloadData];
    
    
}


/*
//toggle the state of checked and unchecked of the allergy incident for the cell
-(void)toggle:(SocialHistoryIncident *)incident {
    
    
    
//    if ([incident.isChecked intValue] == 1) {
//        
//        incident.isChecked = @0;
//        
//        
//    } else if ([incident.isChecked intValue] == 0) {
//        
//        incident.isChecked = @1;
//        
//    }
    
    //save
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    
}*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    [tableView registerClass:[SocialHistoryCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_models count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //[cell setSelectionStyle: UITableViewCellEditingStyleNone];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [(MedicationCell *)cell setModel:_models[indexPath.row]];
    //
    //get a reference of the cell will be displaying
    SocialHistoryCell *thisCell = (SocialHistoryCell*)cell;
    //
    //    //get the incident for this cell
    SocialHistoryIncident *incidentModel  = _models[indexPath.row];
    
    //
    PersonalIncident *personalIncident = [incidentModel.personalincident allObjects][0];
    //
    //    //get fields
    NSString *title = incidentModel.condition;
    //BOOL *checked = [incidentModel.isChecked boolValue];

    //get fromDateToADate String
    NSString *from = [NSDate YYYYStringFromDate:personalIncident.startDate];
    NSString *to = @"Present";
    NSString *fromWithDash = [from stringByAppendingString:@" - "];
    NSString *fromWithDashTo = [fromWithDash stringByAppendingString:to];
    
    [thisCell loadWithLabel:title checked:YES forView:self withFromToDate:fromWithDashTo];
    
    //dummy one - default
    
    //NSString *date = [NSDate MMDDYYYYhhmmStringFromDate:incidentModel.startDate];
    
    //[thisCell loadWithLabel:incidentModel.procedure checked:[incidentModel.isChecked boolValue] forView:self withFromToDate:date];

    /*
     *
     * original
     *
     */
//    //
//    //get a reference of the cell will be displaying
//    SocialHistoryCell *thisCell = cell;
//    //
//    //    //get the incident for this cell
//    SocialHistoryIncident *incidentModel  = _models[indexPath.row];
//    
//    //
//    PersonalIncident *personalIncident = [incidentModel.personalincident allObjects][0];
//    //
//    //    //get fields
//    NSString *title = incidentModel.condition;
//    BOOL *checked = [incidentModel.isChecked boolValue];
//
//    //get fromDateToADate String
//    NSString *from = [NSDate YYYYStringFromDate:personalIncident.startDate];
//    NSString *to = @"Present";
//    NSString *fromWithDash = [from stringByAppendingString:@" - "];
//    NSString *fromWithDashTo = [fromWithDash stringByAppendingString:to];
//    
//    [thisCell loadWithLabel:title checked:checked forView:self withFromToDate:fromWithDashTo];

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [[_cellType alloc] height];
    return 80;
}




@end
