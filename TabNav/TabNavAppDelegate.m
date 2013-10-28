//
//  TabNavAppDelegate.m
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TabNavAppDelegate.h"
#import "FourLines.h"
#import "PersistenceViewController.h"
@implementation TabNavAppDelegate


@synthesize window=_window;
@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
   [_window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
    return YES;

}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
     NSLog(@"BACK");

}


@end
