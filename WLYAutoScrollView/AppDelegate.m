//
//  AppDelegate.m
//  WLYAutoScrollView
//
//  Created by Afluy on 16/4/25.
//  Copyright © 2016年 helios. All rights reserved.
//

#import "AppDelegate.h"
#import "WLYDemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    WLYDemoViewController *vc = [[WLYDemoViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
