//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by jeff on 4/17/09.
//  Copyright 2009 Jeff LaMarche. All rights reserved.
//

#import "CustomPickerViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation CustomPickerViewController
@synthesize picker;
@synthesize winLabel;
@synthesize column1;
@synthesize column2;
@synthesize column3;
//@synthesize column4;
//@synthesize column5;
@synthesize button;
-(void)showButton
{
    button.hidden = NO;
}
-(void)playWinSound
{
  //  NSString *path = [[NSBundle mainBundle] pathForResource:@"win"
  //                                                  ofType:@"wav"];
  //  SystemSoundID soundID;
  //  AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path]
 //                                    , &soundID);
  //  AudioServicesPlaySystemSound (soundID);
    winLabel.text = @"WIN!";
    [self performSelector:@selector(showButton) withObject:nil 
               afterDelay:1.5];
}
-(IBAction)spin:(id)sender
{
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for (int i = 0; i < 3; i++)
    {
        int newValue = random() % [self.column1 count];
        
        if (newValue == lastVal)
            numInRow++;
        else
            numInRow = 1;
        
        lastVal = newValue;
        [picker selectRow:newValue inComponent:i animated:YES];
        [picker reloadComponent:i];
        if (numInRow >= 3)
            win = YES;
    }
    button.hidden = YES;
  /*  NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch"
                                                     ofType:@"wav"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path]
                                     , &soundID);
    AudioServicesPlaySystemSound (soundID);
   */
    
    if (win)
        [self performSelector:@selector(playWinSound) 
                   withObject:nil 
                   afterDelay:.3];
    else
        [self performSelector:@selector(showButton) 
                   withObject:nil 
                   afterDelay:.3];
    
    winLabel.text = @"";
}

- (void)viewDidLoad {
    
    UIImage *seven = [UIImage imageNamed:@"Austria.png"];
    UIImage *bar = [UIImage imageNamed:@"Canada.png"];
    UIImage *crown = [UIImage imageNamed:@"Brazil.png"];
    UIImage *cherry = [UIImage imageNamed:@"Chile.png"];
    UIImage *lemon = [UIImage imageNamed:@"Belgium.png"];
    UIImage *apple = [UIImage imageNamed:@"Cameroon.png"];
    
   

    
    for (int i = 1; i <= 3; i++)
    {
        UIImageView *sevenView = [[UIImageView alloc] initWithImage:seven];
        UIImageView *barView = [[UIImageView alloc] initWithImage:bar];
        UIImageView *crownView = [[UIImageView alloc] initWithImage:crown];
        UIImageView *cherryView = [[UIImageView alloc] 
                                   initWithImage:cherry];
        UIImageView *lemonView = [[UIImageView alloc] initWithImage:lemon];
        UIImageView *appleView = [[UIImageView alloc] initWithImage:apple];
        
        
        sevenView.frame = CGRectMake(0, 0, 100, 100);
        barView.frame = CGRectMake(0, 0, 100, 100);
        crownView.frame = CGRectMake(0, 0, 100, 100);
        cherryView.frame = CGRectMake(0, 0, 100, 100);
        lemonView.frame = CGRectMake(0, 0, 100, 100);
        appleView.frame = CGRectMake(0, 0, 100, 100);
        
        NSArray *imageViewArray = [[NSArray alloc] initWithObjects: 
                                   sevenView, barView, crownView, cherryView, lemonView, 
                                   appleView, nil];
        
        NSString *fieldName = 
        [[NSString alloc] initWithFormat:@"column%d", i];
        [self setValue:imageViewArray forKey:fieldName];
        
    }
    
    srandom(time(NULL));
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.picker = nil;
    self.winLabel = nil;
    self.column1 = nil;
    self.column2 = nil;
    self.column3 = nil;
    //self.column4 = nil;
    //self.column5 = nil;
    self.button = nil;
    [super viewDidUnload];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView 
numberOfRowsInComponent:(NSInteger)component
{
    return [self.column1 count];
}
#pragma mark Picker Delegate Methods

- (UIView *)pickerView:(UIPickerView *)pickerView 
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *arrayName = [[NSString alloc] initWithFormat:@"column%d", 
                           component+1];
    NSArray *array = [self valueForKey:arrayName];
    return [array objectAtIndex:row];
}
@end
