animateCircle3
==============

How to animate a custom property in a CALayer


Initialize

```
    // alloc and init

    self.circleLayer = [[epAnimatedCircleLayer alloc] init];
    
    
    // set the look and feel
    
    self.circleLayer.position = CGPointMake(self.view.bounds.size.width / 2, 350);
    self.circleLayer.strokeWidth = 10;
    self.circleLayer.strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    self.circleLayer.circleWidth = 200;
    self.circleLayer.backgroundColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0] CGColor];


    // set the duration of the animation
    
    self.circleLayer.updateDuration = 3.0;
    
```


Add the animated circle layer to your view

```

    [self.view.layer addSublayer:self.circleLayer];

```





