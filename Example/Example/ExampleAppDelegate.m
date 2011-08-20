//
//  ExampleAppDelegate.m
//  Example
//
//  Created by Andy Smart on 20/08/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "ExampleAppDelegate.h"
#import "ExampleTableViewController.h"

@implementation ExampleAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ExampleTableViewController *vc = [[ExampleTableViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] 
                                   initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    [nav release];
    [vc release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
