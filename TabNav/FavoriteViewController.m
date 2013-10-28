//
//  FavoriteViewController.m
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "FavoriteViewController.h"


@implementation FavoriteViewController
@synthesize buttonFav;
- (void) viewDidLoad
{
    self.navigationItem.title = @"My first app";
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc]
                                      initWithTitle:@"GO"
                                      style:UIBarButtonItemStyleBordered
                                      target:self
                                      action:@selector(buttonFavPressed:)];
    self.navigationItem.rightBarButtonItem = refreshButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                     initWithTitle:@"back"
                                     style:UIBarButtonItemStylePlain
                                     target:self
                                     action:nil];
    self.navigationItem.backBarButtonItem = cancelButton;
    [super viewDidLoad];
}

- (void) viewDidUnload
{
    self.buttonFav = nil;
    [super viewDidUnload];
}


- (IBAction) buttonFavPressed:(id)sender
{
    NextFavViewController *anotherViewController = [[NextFavViewController alloc] initWithNibName:@"NextFavViewController" bundle:nil];
	[self.navigationController pushViewController:anotherViewController animated:YES];
}

@end
