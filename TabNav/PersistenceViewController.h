//
//  PersistenceViewController.h
//  Persistence
//
//  Created by jeff on 4/23/09.
//  Copyright Jeff LaMarche 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

#define kFilename    @"data.sqlite3"
@interface PersistenceViewController : UIViewController {
    UITextField *field1;
    UITextField *field2;
    UITextField *field3;
    UITextField *field4;    
    
    sqlite3    *database;
}
-(IBAction)backTap:(id)sender;
-(IBAction)go:(id)sender;
@property (nonatomic, strong) IBOutlet UITextField *field1;
@property (nonatomic, strong) IBOutlet UITextField *field2;
@property (nonatomic, strong) IBOutlet UITextField *field3;
@property (nonatomic, strong) IBOutlet UITextField *field4;
- (NSString *)dataFilePath;
- (void)applicationWillTerminate:(NSNotification *)notification;
@end

