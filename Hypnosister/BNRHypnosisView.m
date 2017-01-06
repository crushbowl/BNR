//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView


-(void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    
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
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
    /// Gold Challenge: Shadows 
    // You obtain this graphics context in your drawRect: method by calling the UIKit function UIGraphicsGetCurrentContext
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //for the shadow, save the state then draw the shadow
    // CGContextSaveGState(context);
    
    const CGFloat shadowBlur = 5.0f;
    const CGSize shadowOffset = CGSizeMake(10.0f, 10.0f);
    
    CGContextSetShadow(context, shadowOffset, shadowBlur);
    
    // draw colored shadows by calling the function CGContextSetShadowWithColor, passing a graphics context, offset values, a blur value, and a CGColor object.
    //CGContextSetShadowWithColor(context, CGSizeMake(2.0f, 2.0f), 1.0f, [[UIColor colorWithRed:25.0 green:0.0 blue:0.0 alpha:.6] CGColor]);
    
    //CGContextSetShadowWithColor(context, CGSizeMake(0.0, 0.0), 0.0, nil);
    
    // draw the rect, including the shadow
    //CGContextFillRect(context, rect);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    
    [logoImage drawInRect:CGRectMake(bounds.origin.x + bounds.size.width/4.0, bounds.origin.y + bounds.size.height/4.0, 200, 300)];
    
    CGContextStrokePath(context);
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // Set ALL BNRHypnosisViews to start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
    
}


@end
