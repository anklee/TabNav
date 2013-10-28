//
//  ControlViewController.h
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NextFavViewController.h"

@interface ControlViewController : UITableViewController {
    NSArray *controllers;
}
@property (nonatomic, strong) NSArray *controllers;
@end
