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
    
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Red", @"Green", @"Blue", nil]];
    // CGFloat x =
    segmentedControl.frame = CGRectMake(100, 200, 250, 50);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor blackColor];
    segmentedControl.layer.cornerRadius = 5.0;
    [segmentedControl addTarget:self action:@selector(changeColor:) forControlEvents: UIControlEventValueChanged];
    
    //backgroundView.circleColor = [UIColor redColor];
    
    [self.view addSubview:segmentedControl];
    
    [self changeColor:segmentedControl];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
    
}


- (void) changeColor: (UISegmentedControl *) sender{
    
    BNRHypnosisView *hypnosisView = (BNRHypnosisView *) self.view;
    UISegmentedControl *segment = sender;
    NSInteger index = [segment selectedSegmentIndex];
    
    if (index == 0) {
        hypnosisView.circleColor = [UIColor redColor];
    } else if (index == 1){
        hypnosisView.circleColor = [UIColor greenColor];
    } else if (index == 2) {
        hypnosisView.circleColor = [UIColor blueColor];
    }
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
