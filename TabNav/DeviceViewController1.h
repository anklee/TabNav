//
//  DeviceViewController.h
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DeviceViewController1 : UIViewController
{
	IBOutlet UITextField *nameInput;
	IBOutlet UILabel *greeting;
    
	NSMutableData *webData;
	NSMutableString *soapResults;
	NSXMLParser *xmlParser;
	BOOL recordResults;
    
}

@property(nonatomic, strong) IBOutlet UITextField *nameInput;
@property(nonatomic, strong) IBOutlet UILabel *greeting;

@property(nonatomic, strong) NSMutableData *webData;
@property(nonatomic, strong) NSMutableString *soapResults;
@property(nonatomic, strong) NSXMLParser *xmlParser;

-(IBAction)buttonClick: (id) sender;
- (void)getOffesetUTCTimeSOAP;
@end



