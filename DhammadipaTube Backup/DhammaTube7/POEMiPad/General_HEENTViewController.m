//
//  General_HEENTViewController.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/12/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "General_HEENTViewController.h"

@interface General_HEENTViewController ()

@end

@implementation General_HEENTViewController{
    NSString * generalContent;
    NSString * HEENTContent;
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadContent{
    generalContent = @"The patient is exeadingly friendly, is laughing at my Sthetoscope";
    HEENTContent = @"The patients eyes are red, seems to be relaxed and unalert";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    tableView.scrollEnabled = false;
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LargeTextFieldCellAlt"];
    
    if (!cell){
        [tableView registerNib:[UINib nibWithNibName:@"largeTextfieldCellAltFullSize" bundle:nil] forCellReuseIdentifier:@"LargeTextFieldCellAlt"];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"LargeTextFieldCellAlt"];
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0)
        [(LargeTextFieldCellAlt *) cell loadWithLabel:@"General" withContent:generalContent];
    else
        [(LargeTextFieldCellAlt *) cell loadWithLabel:@"HEENT" withContent:HEENTContent];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 163.0f;
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

