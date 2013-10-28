//
//  ControlViewController.m
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ControlViewController.h"


@implementation ControlViewController
@synthesize controllers;

- (void) viewDidLoad
{
    
    
 
    self.navigationItem.title = @"WEB";
    NSMutableArray *array = [[NSMutableArray alloc] init];

    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:46.0 / 255.0 green:149.0 / 255.0 blue:206.0 / 255.0 alpha:0.6];
    
    self.navigationController.navigationBar.clipsToBounds = NO;
 
    
    NextFavViewController *nextFavViewController = [[NextFavViewController alloc] initWithNibName:@"NextFavViewController" bundle:nil];
    nextFavViewController.title = @"WEB";


    [array addObject:nextFavViewController];
    NSLog(@"have you viewDidLoad?");
    self.controllers = array;
    [super viewDidLoad];
}

- (void) viewDidUnload
{
    self.controllers = nil;
    [super viewDidUnload];
}


#pragma mark -
#pragma mark Table Data Source Methods

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.controllers count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    NSUInteger row = [indexPath row];
    NextFavViewController *controller = [controllers objectAtIndex:row];
	cell.textLabel.text = controller.title;  //@"haha";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    NextFavViewController *anotherViewController = [[NextFavViewController alloc] initWithNibName:@"NextFavViewController" bundle:nil];
	[self.navigationController pushViewController:anotherViewController animated:YES];
}

@end
