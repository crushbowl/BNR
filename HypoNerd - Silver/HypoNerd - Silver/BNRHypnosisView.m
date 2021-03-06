//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"


@interface BNRHypnosisView ()



@end


@implementation BNRHypnosisView



-(void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    // CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Find the center point of the bounds [rectangle]
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    // Create a UIBezierPath object
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius // <== this is currentRadius
                    startAngle:0.0
                      endAngle:M_PI *2
                     clockwise:YES];
    }
    
    // Configure the line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    
    [self.circleColor setStroke];
    
    [path stroke];
    
    
}




- (instancetype)initWithFrame:(CGRect)frame {
    
    
    if (self = [super initWithFrame:frame]) {
        
        // Set ALL BNRHypnosisViews to start with a clear background color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green =  (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
    
}

-(void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
