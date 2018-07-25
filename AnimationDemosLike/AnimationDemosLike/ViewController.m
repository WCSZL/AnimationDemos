//
//  ViewController.m
//  AnimationDemosLike
//
//  Created by wxw on 2018/7/25.
//  Copyright © 2018年 wxw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    CALayer *layer01 = [WWDrawLineHelper drowAnLineWithPointA:CGPointZero toPointB:CGPointMake(20, 200)];
     [self.view.layer addSublayer:layer01];
    
    CALayer *layer02 = [WWDrawLineHelper drowAnLineWithPointA:CGPointZero toPointB:CGPointMake(70, 300) lineWidth:1 lineColor:[UIColor redColor]];
    [self.view.layer addSublayer:layer02];
    
    CALayer *layer03 = [WWDrawLineHelper drawAnLineWithPointA:CGPointZero toPointB:CGPointMake(120, 400) lineWidth:1 lineColor:[UIColor blueColor] timeInterval:5.f];
    [self.view.layer addSublayer:layer03];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
