//
//  FortSiegeAppDelegate.h
//  FortSiege
//
//  Created by Andrew Butcher on 2/1/11.
//  Copyright West Virginia University 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface FortSiegeAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
