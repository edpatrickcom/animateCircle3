//
//  ViewController.m
//  animateCircle3
//
//  Created by edp on 9/23/14.
//  Copyright (c) 2014 edp. All rights reserved.
//

#import "ViewController.h"
#import "epAnimatedCircleLayer.h"


@interface ViewController ()

@property (strong,nonatomic) epAnimatedCircleLayer *circleLayer;

@end





@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    // add circle layer
    
    self.circleLayer = [[epAnimatedCircleLayer alloc] init];
    
    self.circleLayer.position = CGPointMake(self.view.bounds.size.width / 2, 350);
    self.circleLayer.strokeWidth = 10;
    self.circleLayer.strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    self.circleLayer.updateDuration = 3.0;
    self.circleLayer.circleWidth = 200;
    self.circleLayer.backgroundColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0] CGColor];
    
    [self.view.layer addSublayer:self.circleLayer];

    
    // set the angle to something
    
    [self.circleLayer setArcAngle:360];

    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
