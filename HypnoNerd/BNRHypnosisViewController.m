//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Hodge, Janelle on 1/9/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    self.view = backgroundView;
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

        if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
            self.tabBarItem.title= @"Hypnotize";
            UIImage *image = [UIImage imageNamed:@"Hypno.png"];
            
            self.tabBarItem.image = image;
        }
        return self;
}

@end
