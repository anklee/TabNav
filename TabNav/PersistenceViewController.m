//
//  PersistenceViewController.m
//  Persistence
//
//  Created by jeff on 4/23/09.
//  Copyright Jeff LaMarche 2009. All rights reserved.
//

#import "PersistenceViewController.h"
#import "FourLines.h"

@implementation PersistenceViewController
@synthesize field1;
@synthesize field2;
@synthesize field3;
@synthesize field4;
- (NSString *)dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"back");
    for (int i = 1; i <= 4; i++)
    {
        NSString *fieldName = [[NSString alloc]
                               initWithFormat:@"field%d", i];
        UITextField *field = [self valueForKey:fieldName];
        
        char *errorMsg;
        char *update = "INSERT OR REPLACE INTO FIELDS (ROW, FIELD_DATA) VALUES (?, ?);";
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i);
            sqlite3_bind_text(stmt, 2, [field.text UTF8String], -1, NULL);
        }
        if (sqlite3_step(stmt) != SQLITE_DONE)
            NSAssert1(0, @"Error updating table: %s", errorMsg);
        sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    NSLog(@"save data ok");
}
-(void)go:(id)sender{
    for (int i = 1; i <= 4; i++)
    {
        NSString *fieldName = [[NSString alloc]
                               initWithFormat:@"field%d", i];
        UITextField *field = [self valueForKey:fieldName];
        
        char *errorMsg;
      
        char *update = "INSERT OR REPLACE INTO FIELDS (ROW, FIELD_DATA) VALUES (?, ?);";
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i);
            sqlite3_bind_text(stmt, 2, [field.text UTF8String], -1, NULL);
        }
        if (sqlite3_step(stmt) != SQLITE_DONE)
            NSAssert1(0, @"Error updating table: %s", errorMsg);
        sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    NSLog(@"save data ok");
}

#pragma mark -
- (void)viewDidLoad {
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    
    char *errorMsg;
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS (ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    if (sqlite3_exec (database, [createSQL  UTF8String],
                      NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert1(0, @"Error creating table: %s", errorMsg);
    }
    
    NSString *query = @"SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2( database, [query UTF8String],
                           -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int row = sqlite3_column_int(statement, 0);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            
            NSString *fieldName = [[NSString alloc]
                                   initWithFormat:@"field%d", row];
            NSString *fieldValue = [[NSString alloc]
                                    initWithUTF8String:rowData];
            UITextField *field = [self valueForKey:fieldName];
            field.text = fieldValue;
        }
        sqlite3_finalize(statement);
    } 
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillTerminate:)
                                                 name:UIApplicationWillTerminateNotification 
                                               object:app];
    [super viewDidLoad];
}

-(IBAction)backTap:(id)sender
{
    [field1 resignFirstResponder];
    [field2 resignFirstResponder];

    [field3 resignFirstResponder];

    [field4 resignFirstResponder];

}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.field1 = nil;
    self.field2 = nil;
    self.field3 = nil;
    self.field4 = nil;
    [super viewDidUnload];
}
@end
