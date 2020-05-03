
/*

 Copyright (c) 2013 Joan Lluch <joan.lluch@sweetwilliamsl.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 Original code:
 Copyright (c) 2011, Philip Kluz (Philip.Kluz@zuui.org)
 
*/

#import "RearViewController.h"

#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "ZZZProviderNoteViewController.h"
#import "SignInModalViewController.h"
#import "MyInfoViewController.h"
#import "ZZZSettingViewController.h"
#import "ProviderViewController.h"

//add new view controller headers here

//test

//#import "MapViewController.h"

@interface RearViewController()

@end

@implementation RearViewController

@synthesize rearTableView = _rearTableView;


#pragma mark - View lifecycle


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = NSLocalizedString(@"Rear View", nil);
}


#pragma marl - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
	
	if (nil == cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
	}
	
	if (row == 0)
	{
		cell.textLabel.text = @"Front View Controller";
	}
	else if (row == 1)
	{
		cell.textLabel.text = @"Provider Note";
	}
	else if (row == 2)
	{
		cell.textLabel.text = @"Log In";
	}
	else if (row == 3)
	{
		cell.textLabel.text = @"My Info";
	}
    else if (row == 4)
	{
		cell.textLabel.text = @"Setting";
	}
    else if (row == 5)
	{
		cell.textLabel.text = @"Provider View";
	}
    
    //add here more when more menu items comes in
    
    
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //a instant of storyboard that contains all the views Sebastian made
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"Sebastian" bundle:[NSBundle mainBundle]];

    
	// Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
    SWRevealViewController *revealController = self.revealViewController;
    
    // We know the frontViewController is a NavigationController
    UINavigationController *frontNavigationController = (id)revealController.frontViewController;  // <-- we know it is a NavigationController
    NSInteger row = indexPath.row;

	// Here you'd implement some of your own logic... I simply take for granted that the first row (=0) corresponds to the "FrontViewController".
    
    //row 0 of original code
    
	if (row == 0)
	{
		// Now let's see if we're not attempting to swap the current frontViewController for a new instance of ITSELF, which'd be highly redundant.        
        if ( ![frontNavigationController.topViewController isKindOfClass:[FrontViewController class]] )
        {
			FrontViewController *frontViewController = [[FrontViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
			[revealController pushFrontViewController:navigationController animated:YES];
        }
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
    
	// ... and the second row (=1) corresponds to the "ProviderNoteViewController".
	else if (row == 1)
	{
		// Now let's see if we're not attempting to swap the current frontViewController for a new instance of ITSELF, which'd be highly redundant.
        if ( ![frontNavigationController.topViewController isKindOfClass:[ZZZProviderNoteViewController class]] )
        {
			ZZZProviderNoteViewController *mapViewController = [[ZZZProviderNoteViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
			[revealController pushFrontViewController:navigationController animated:YES];
		}
        
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
    //log in
	else if (row == 2)
	{
        // Now let's see if we're not attempting to swap the current frontViewController for a new instance of ITSELF, which'd be highly redundant.
        if ( ![frontNavigationController.topViewController isKindOfClass:[SignInModalViewController class]] )
        {
            UIViewController *temp = [storyboard instantiateViewControllerWithIdentifier:@"Sign.In"];
            //SignInModalViewController *temp = [[SignInModalViewController alloc] init];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:temp];
            [revealController pushFrontViewController:navigationController animated:YES];
        }
        // Seems the user attempts to 'switch' to exactly the same controller he came from!
        else
        {
            [revealController revealToggle:self];
        }
        
        
       // [revealController setFrontViewPosition:FrontViewPositionRightMost animated:YES];
	}
    //my info
	else if (row == 3)
	{
        //start here, just copy here from end when we add new items, The only things need to be changed is the line is:
                                        //UIViewController *temp = [storyboard instantiateViewControllerWithIdentifier:@"Patient.Profile"];
        if ( ![frontNavigationController.topViewController isKindOfClass:[MyInfoViewController class]] )
        {
            UIViewController *temp = [storyboard instantiateViewControllerWithIdentifier:@"Patient.Profile"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:temp];
            [revealController pushFrontViewController:navigationController animated:YES];
        }
        // Seems the user attempts to 'switch' to exactly the same controller he came from!
        else
        {
            [revealController revealToggle:self];
        }
    
        //copy end here
    
    }
    //setting
	else if (row == 4)
	{
        //start here, just copy here from end when we add new items, The only things need to be changed is the line is:
        //UIViewController *temp = [storyboard instantiateViewControllerWithIdentifier:@"Patient.Profile"];
        if ( ![frontNavigationController.topViewController isKindOfClass:[ZZZSettingViewController class]] )
        {
            UIViewController *temp = [storyboard instantiateViewControllerWithIdentifier:@"Settings"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:temp];
            [revealController pushFrontViewController:navigationController animated:YES];
        }
        // Seems the user attempts to 'switch' to exactly the same controller he came from!
        else
        {
            [revealController revealToggle:self];
        }
        
        //copy end here
        
    }
    //provider view
	else if (row == 5)
	{
        //start here, just copy here from end when we add new items, The only things need to be changed is the line is:
        //UIViewController *temp = [storyboard instantiateViewControllerWithIdentifier:@"Patient.Profile"];
        if ( ![frontNavigationController.topViewController isKindOfClass:[ProviderViewController class]] )
        {
            UIViewController *temp = [storyboard instantiateViewControllerWithIdentifier:@"Provider.View"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:temp];
            [revealController pushFrontViewController:navigationController animated:YES];
        }
        // Seems the user attempts to 'switch' to exactly the same controller he came from!
        else
        {
            [revealController revealToggle:self];
        }
        
        //copy end here
        
    }
    
    
}


//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSLog( @"%@: REAR", NSStringFromSelector(_cmd));
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    NSLog( @"%@: REAR", NSStringFromSelector(_cmd));
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    NSLog( @"%@: REAR", NSStringFromSelector(_cmd));
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    NSLog( @"%@: REAR", NSStringFromSelector(_cmd));
//}

@end