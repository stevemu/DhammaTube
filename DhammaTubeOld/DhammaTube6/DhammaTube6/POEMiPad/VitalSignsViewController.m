//
//  VitalSignsViewController.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/12/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "VitalSignsViewController.h"
#import "SmallTextFieldCell.h"

@interface VitalSignsViewController ()

@end

@implementation VitalSignsViewController
{
    NSMutableDictionary * signs;
    NSMutableArray * signsKeys;
}

-(void)loadDictionary{
    signs = [[NSMutableDictionary alloc] init];
    [signs setObject:@"76 bpm" forKey:@"Heart Rate"];
    [signs setObject:@"110/180" forKey:@"Blood Pressure"];
    [signs setObject:@"97 F" forKey:@"Temperature"];
    [signs setObject:@"6'1''" forKey:@"Height"];
    [signs setObject:@"220 lbs" forKey:@"Weight"];
    
    signsKeys = [[NSMutableArray alloc]initWithArray:[signs allKeys]];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadDictionary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    [tableView setScrollEnabled:false];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return signs.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SmallTextFieldCell"];
        
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"smallTextfieldCellFullSize" bundle:nil] forCellReuseIdentifier:@"SmallTextFieldCell"];
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"SmallTextFieldCell"];
            
        }
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [(SmallTextFieldCell *) cell loadWithLabel:signsKeys[indexPath.row] WithContent:signs[signsKeys[indexPath.row]]];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65.0f;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end