//
//  DeviceViewController.h
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface DeviceViewController : UIViewController <UIAccelerometerDelegate>
{
     NSString *request1;
     NSString *request2;
     NSString *request3;
    NSString *request4;
    NSString *request5;
    NSString *request6;
    NSString *request7;
    
     NSString *answer01;
     NSString *answer02;
     NSString *answer03;
     NSString *answer04;
     NSString *answer05;
     NSString *answer06;
     NSString *answer07;
    
    int  guanka;
    
    IBOutlet UIImageView *image;
    
}


@property (weak, nonatomic) IBOutlet UIButton *bt1;
@property (weak, nonatomic) IBOutlet UIButton *bt2;
- (IBAction)newgameon:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *guank;

@property (weak, nonatomic) IBOutlet UILabel *request;
- (IBAction)answer1:(id)sender;
- (IBAction)answer2:(id)sender;
-(void)playSound;
- (void)newgame;
- (void)next;

@end



