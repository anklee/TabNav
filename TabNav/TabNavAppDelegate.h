//
//  TabNavAppDelegate.h
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#define kFilename    @"data.sqlite3"
@class PersistenceViewController;
@class FourLines;
@interface TabNavAppDelegate : NSObject <UIApplicationDelegate> {
    UITabBarController *tabBarController;
    sqlite3    *database;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;

@end
