//
//  SceneViewController.m
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//
#import "DeviceViewController1.h"
#import "SceneViewController.h"

@implementation SceneViewController
@synthesize webservie;

-(void)viewDidLoad
{
    
  DeviceViewController1  *servie = [[DeviceViewController1 alloc]initWithNibName:@"DeviceViewController1" bundle:nil];
    self.webservie = servie;
    [self.view addSubview:servie.view ];
    
   
    
    

}

@end
