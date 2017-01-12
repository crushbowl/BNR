//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnosisView.h"


@interface AppDelegate () <UIScrollViewDelegate>

@property (strong, nonatomic) BNRHypnosisView *myhypnosisView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    
    //contextual awareness vc v. self.window.rootViewController
    UIViewController *vc = [[UIViewController alloc] init];
    //vc.view.backgroundColor = [UIColor greenColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    scrollView.pagingEnabled = NO;
    scrollView.minimumZoomScale=0.5;
    scrollView.maximumZoomScale=6.0;
    scrollView.contentSize=CGSizeMake(1280, 960);
    scrollView.delegate = self;
    [self.window addSubview:scrollView];
    

    
    
   self.myhypnosisView = [[BNRHypnosisView alloc]initWithFrame:screenRect];
    [scrollView addSubview:self.myhypnosisView];
    
    screenRect.origin.x += screenRect.size.width;
    
    scrollView.contentSize = bigRect.size;
    
    self.window.rootViewController = vc;
    [self.window.rootViewController.view addSubview:scrollView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.myhypnosisView;
}




@end
