//
//  LoadingViewAnimationsAppDelegate.m
//  LoadingViewAnimations
//
//  Created by Q on 18.11.10.
//  Copyright (c) 2010 PQ-Developing.com. All rights reserved.
//


#import "UIWebViewTutorialAppDelegate.h"
#import "RootViewController.h"

@implementation UIWebViewTutorialAppDelegate


@synthesize window;

@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {
    [root release];
    
    [window release];
    [navigationController release];
    [super dealloc];
}

@end

