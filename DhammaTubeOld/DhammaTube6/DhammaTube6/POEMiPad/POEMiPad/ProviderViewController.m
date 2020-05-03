
//
//  ProviderViewController.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "ProviderViewController.h"
#import "SWRevealViewController.h"

@interface ProviderViewController ()

@end

@implementation ProviderViewController

@synthesize patients;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadPatients];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadPatients];
    
    
    //start here
    //these code to cooperate with the side menu
    
	
	self.title = NSLocalizedString(@"PROVIDER VIEW", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"subMenuButton_half"]
                                                                         style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    
    //end here
    
    
}
/*-(void)viewWillAppear:(BOOL)animated{
 [self loadPatients];
 [super viewWillAppear:animated];
 }*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadPatients{
    [self setPatients:[[NSMutableArray alloc]init]];
    [patients addObject:@"Qi Mu"];
    [patients addObject:@"Rajesh Sukhu"];
    [patients addObject:@"Oghosa Ohiomoba"];
    [patients addObject:@"Patrick Ohiomoba"];
    [patients addObject:@"Sebastian Aguirre"];
    [patients addObject:@"George Reyes"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [self loadPatients];
    NSLog(@"%i fasdf\n",patients.count);
    return (patients.count);
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCell"];
    
    if (!cell){
        [tableView registerNib:[UINib nibWithNibName:@"providerViewCellFullSize" bundle:nil] forCellReuseIdentifier:@"PatientCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCell"];
    }
    //[cell setBackgroundColor: [UIColor blueColor]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [(PatientCell *) cell setPatient:patients[indexPath.row]];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 86.0f;
}
@end
