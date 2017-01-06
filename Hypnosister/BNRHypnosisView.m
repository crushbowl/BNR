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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
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
    
    // draw colored shadows by calling the function CGContextSetShadowWithColor, passing a graphics context, offset values, a blur value, and a CGColor object.
    //CGContextSetShadowWithColor(context, CGSizeMake(2.0f, 2.0f), 1.0f, [[UIColor colorWithRed:25.0 green:0.0 blue:0.0 alpha:.6] CGColor]);
    
    //CGContextSetShadowWithColor(context, CGSizeMake(0.0, 0.0), 0.0, nil);
    
    // draw the rect, including the shadow
    //CGContextFillRect(context, rect);
    
    CGRect rectangle = CGRectMake(bounds.size.width/4.0, bounds.size.height/4.0, bounds.size.width/2.0, bounds.size.height/2.0);
    CGContextSaveGState(context);
   
    UIBezierPath *newPath = [UIBezierPath bezierPath];
    [newPath moveToPoint:CGPointMake(center.x, rectangle.origin.y)];
    
    [newPath addLineToPoint:CGPointMake(rectangle.origin.x, rectangle.origin.y + rectangle.size.height)];
    [newPath addLineToPoint:CGPointMake(rectangle.origin.x + rectangle.size.width,  rectangle.origin.y + rectangle.size.height)];
    
    [newPath closePath];
    [newPath addClip];
    // You obtain this graphics context in your drawRect: method by calling the UIKit function UIGraphicsGetCurrentContext
    
    
    CGFloat location[2] = {0.0, 1.0};
    CGFloat components[8] = {0.0, 1.0, 0.0, 1.0,
        1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, location, 2);
    
    CGPoint startPoint = CGPointMake(center.x, rectangle.origin.y);
    CGPoint endPoint = CGPointMake(center.x, rectangle.origin.y + rectangle.size.height);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    CGContextRestoreGState(context);
    /// Gold Challenge: Shadows
    
    
    //for the shadow, save the state then draw the shadow
    // CGContextSaveGState(context);
    
    const CGFloat shadowBlur = 3.0f;
    const CGSize shadowOffset = CGSizeMake(4.0f, 7.0f);
    
    CGContextSetShadow(context, shadowOffset, shadowBlur);
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    
    [logoImage drawInRect:CGRectMake(bounds.origin.x + bounds.size.width/4.0, bounds.origin.y + bounds.size.height/4.0, 200, 300)];
    
    CGContextStrokePath(context);
    
    CGContextSetShadow(context, CGSizeMake(4, 7), 30);
    
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
