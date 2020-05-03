//
//  MyInfoViewController.m
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import "MyInfoViewController.h"
#import "UserMetric.h"
#import "MyInfoPicCell.h"
#import "MyInfoViewCell.h"
#import "SWRevealViewController.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

@synthesize TableComponents;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTableComponents];
    
    //start here
    //these code to cooperate with the side menu
    
	
	self.title = NSLocalizedString(@"My Info", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"subMenuButton_half"]
                                                                         style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    
    //end here
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadTableComponents{
    [self setTableComponents:[[NSMutableArray alloc] init]];
    [TableComponents addObject:[[UserMetric alloc] initWithName:@"Age" withInfo:@"14"]];
    [TableComponents addObject:[[UserMetric alloc] initWithName:@"Height" withInfo:@"5'2''"]];
    [TableComponents addObject:[[UserMetric alloc] initWithName:@"Weight" withInfo:@"140 Lbs"]];
    [TableComponents addObject:[[UserMetric alloc] initWithName:@"BP" withInfo:@"500"]];
    [TableComponents addObject:[[UserMetric alloc] initWithName:@"Heart Rate" withInfo:@"72"]];
    [TableComponents addObject:[[UserMetric alloc] initWithName:@"Chromosomes" withInfo:@"23"]];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    tableView.scrollEnabled = false;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int cells = 1;
    
    cells += TableComponents.count;
    
    
    return cells;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfoPicCell"];
        
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"profileAvatarCell" bundle:nil] forCellReuseIdentifier:@"MyInfoPicCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfoPicCell"];
        }
        [cell setBackgroundColor: [UIColor blueColor]];
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfoViewCell"];
        
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"profileFavoriteCell" bundle:nil] forCellReuseIdentifier:@"MyInfoViewCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfoViewCell"];
        }
    }
    
    NSLog(@"%@",[cell class]);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        return 105.0f;
    }else{
        return 81.0f;
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        [(MyInfoPicCell *) cell setProfilePic:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myInfoAvatar"]]];
        NSLog(@"%@",[cell class]);
    }
    else{
        NSLog(@"%@",[cell class]);
        [(MyInfoViewCell *) cell loadContent:((UserMetric *)TableComponents[indexPath.row - 1])];
    }
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
