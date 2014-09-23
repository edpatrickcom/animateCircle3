//
//  epAnimatedCircleLayer.m
//  animateCircle3
//
//  Created by edp on 9/23/14.
//  Copyright (c) 2014 edp. All rights reserved.
//

#import "epAnimatedCircleLayer.h"

@interface epAnimatedCircleLayer ()


@end





@implementation epAnimatedCircleLayer

// angle is the variable that the animation will interpolate over

@dynamic angle;


// drawing properties

@synthesize strokeColor    = _strokeColor;
@synthesize strokeWidth    = _strokeWidth;
@synthesize updateDuration = _updateDuration;
@synthesize circleWidth    = _circleWidth;





// important default values

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.bounds = CGRectMake(0, 0, 300, 300);
        
        _strokeColor    = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
        _strokeWidth    = 5;
        _updateDuration = 2.0;
        _circleWidth    = 100;
        
        
    }
    
    return self;
}




// make sure that the keypath value "angle" causes display to run


+ (BOOL)needsDisplayForKey:(NSString *)key {
    
    if ([@"angle" isEqualToString:key]) {
        
        return YES;
        
    } else {
        
        return [super needsDisplayForKey:key];
        
    }
    
}




- (void)display {
    
    
    // this is the value set in the model layer
    // it is the last value set
    //
    // NSLog(@"angle %.1f", self.angle);
    
    
    // this is the value in the presentation layer
    // it will interpolate between the initial value
    // and the value that was just set

    NSLog(@"angle %.1f", [[self presentationLayer] angle]);
    
    
    // get interpolated angle value
    
    float theAngle = [self.presentationLayer angle];

    
    
    //create drawing context
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    
    
    
    //// Variable Declarations
    
    CGFloat drawAngle    = theAngle;
    
    //// Oval Drawing
    
    CGRect ovalRect = CGRectMake(0, 0, _circleWidth, _circleWidth);
    
    UIBezierPath* ovalPath = UIBezierPath.bezierPath;
    
    [ovalPath
     addArcWithCenter: CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
     radius: CGRectGetWidth(ovalRect) / 2
     startAngle: -drawAngle * M_PI/180
     endAngle: 0 * M_PI/180
     clockwise: YES];
    
    [_strokeColor setStroke];
    
    ovalPath.lineWidth = _strokeWidth;
    
    [ovalPath stroke];

    
    
    
    
    //set backing image
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();

    
    
    
    

    
    
    
}




- (id<CAAction>)actionForKey:(NSString *)event {
    
    NSLog(@"actionForKey");
    
    if ([event isEqualToString:@"angle"]) {
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:event];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.duration = _updateDuration;
        
        // this can be used but starting from the current angle
        // in the presentation layer is a little better
        //
        // animation.fromValue = @(self.angle);
        
        animation.fromValue = @([[self presentationLayer] angle]);
        
        
        return animation;
        
        
    } else {
        
        return [super actionForKey:event];
        
    }
    
    
}




@end
