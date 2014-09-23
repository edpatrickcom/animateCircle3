//
//  epAnimatedCircleLayer.h
//  animateCircle3
//
//  Created by edp on 9/23/14.
//  Copyright (c) 2014 edp. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface epAnimatedCircleLayer : CALayer

@property (nonatomic) float arcAngle;

@property (strong,nonatomic) UIColor *strokeColor;
@property (nonatomic) float strokeWidth;
@property (nonatomic) float circleWidth;

@property (nonatomic) float updateDuration;



@end
