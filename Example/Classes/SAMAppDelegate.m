//
//  SAMAppDelegate.m
//  SAMAddressBar
//
//  Created by Sam Soffes on 7/9/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMAppDelegate.h"
#import "SAMExampleViewController.h"

@implementation SAMAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	SAMExampleViewController *viewController = [[SAMExampleViewController alloc] init];
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];

	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	return YES;
}

@end
