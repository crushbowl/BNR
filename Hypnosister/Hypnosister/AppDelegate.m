//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnosisView.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CGRect firstFrame = self.window.bounds;
    
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:firstFrame];
    
    [self.window addSubview:firstView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}





@end
