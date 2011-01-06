//
//  LoadingViewAnimationsAppDelegate.h
//  LoadingViewAnimations
//
//  Created by Q on 18.11.10.
//  Copyright (c) 2010 PQ-Developing.com. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface UIWebViewTutorialAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    UINavigationController *navigationController;
    
    RootViewController *root;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@end

