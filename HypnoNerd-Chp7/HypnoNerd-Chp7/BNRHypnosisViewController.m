//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Hodge, Janelle on 1/9/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()<UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(backgroundView.bounds.origin.x + backgroundView.bounds.size.width/10.0, (backgroundView.bounds.origin.y + backgroundView.bounds.size.height/10.0), (backgroundView.bounds.size.width)*0.80, backgroundView.bounds.size.height/18.0);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"   Hypnotize Me...";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

        if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
            self.tabBarItem.title= @"Hypnotize";
            UIImage *image = [UIImage imageNamed:@"Hypno.png"];
            
            self.tabBarItem.image = image;
        }
        return self;
}


- (void) drawHypnoticMessage: (NSString *) message {

    for(int i = 0; i <20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random() % width;
        
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
        
    }
    
}


@end
