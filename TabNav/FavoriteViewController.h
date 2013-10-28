//
//  FavoriteViewController.h
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NextFavViewController.h"

@interface FavoriteViewController : UIViewController {
    UIButton *buttonFav;
}

@property (nonatomic, strong) IBOutlet UIButton *buttonFav;

- (IBAction) buttonFavPressed:(id)sender;
@end
