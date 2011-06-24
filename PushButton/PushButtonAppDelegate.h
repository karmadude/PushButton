//
//  PushButtonAppDelegate.h
//  PushButton
//
//  Created by Karmadude on 6/24/11.
//  Copyright 2011 VUnite Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PushButtonsViewController;

@interface PushButtonAppDelegate : NSObject <UIApplicationDelegate> {
    PushButtonsViewController *pushButtons;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) PushButtonsViewController *pushButtons;

@end
