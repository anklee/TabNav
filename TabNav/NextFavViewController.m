//
//  NextFavViewController.m
//  TabNav
//
//  Created by user on 11-8-3.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NextFavViewController.h"


@implementation NextFavViewController



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    //[super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString  *ur = [[NSUserDefaults standardUserDefaults]stringForKey:@"url"];
    
    
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:ur]];
    
    NSLog(@"%@",ur);
    [self.view addSubview: webView];
    [webView loadRequest:request];
    
    
    UIBarButtonItem *temporaryBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = temporaryBarButtonItem;
    

}

-(void)goBack
{
    [webView goBack];
}

-(void)hello
{
    self.view = nil;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
