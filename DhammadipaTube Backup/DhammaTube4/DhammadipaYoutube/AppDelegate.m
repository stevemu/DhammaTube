//
//  AppDelegate.m
//  DhammadipaYoutube
//
//  Created by Qi Mu on 12/26/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "AppDelegate.h"
#import "VideoViewController.h"
#import "MenuViewController.h"

//#define MR_SHORTHAND 1
#import "MagicalRecord/CoreData+MagicalRecord.h"

#import "Video.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    UISplitViewController *splitViewController;
    VideoViewController *detailedViewController;
    MenuViewController *masterViewController;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    CGRect sr = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:sr];

    //magical records

    [MagicalRecord setupCoreDataStack];


    //split view

    splitViewController = [[UISplitViewController alloc] init];
    masterViewController = [[MenuViewController alloc] init];
    detailedViewController = [[VideoViewController alloc] init];

    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:detailedViewController];

    splitViewController.viewControllers = [NSArray arrayWithObjects:rootNav, detailNav, nil];
    splitViewController.delegate = detailedViewController;
    masterViewController.delegate = detailedViewController; //so that left and pass things to right

    self.window.rootViewController = splitViewController;
    [self.window makeKeyAndVisible];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


@end
