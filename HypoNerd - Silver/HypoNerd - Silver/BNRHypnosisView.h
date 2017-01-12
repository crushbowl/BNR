//
//  BNRHypnosisView.h
//  Hypnosister
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRHypnosisView : UIView

@property (strong, nonatomic) UIColor *circleColor;


-(instancetype)initWithFrame:(CGRect)frame;
-(void)drawRect:(CGRect)rect;


@end
