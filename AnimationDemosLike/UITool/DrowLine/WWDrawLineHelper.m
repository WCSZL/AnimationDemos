//
//  WWDrowLineHelper.m
//  AnimationDemosLike
//
//  Created by wxw on 2018/7/25.
//  Copyright © 2018年 wxw. All rights reserved.
//

#import "WWDrawLineHelper.h"

@interface WWDrawLineHelper()<CAAnimationDelegate>

// 不用全局 , 可能会造成'画笔'是同一支.
//@property (nonatomic,strong) UIBezierPath *bPath;
//@property (nonatomic,strong) CAShapeLayer *sLayer;
@end

@implementation WWDrawLineHelper

+ (instancetype)shareSelf{
    
    static WWDrawLineHelper *_helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_helper) {
            _helper = [[WWDrawLineHelper alloc]init];
        }
    });
    return _helper;
}
- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

/** *01 两点划线 默认 线宽0.5 -线色black */
+ (CALayer *)drowAnLineWithPointA:(CGPoint)pointA toPointB:(CGPoint)pointB{
    
    CALayer *layer = [WWDrawLineHelper drowAnLineWithPointA:pointA toPointB:pointB lineWidth:0.5 lineColor:[UIColor blackColor]];
    return layer;
}

/** *02 两点划线 线宽-线色 */
+ (CALayer *)drowAnLineWithPointA:(CGPoint)pointA toPointB:(CGPoint)pointB lineWidth:(CGFloat)width lineColor:(UIColor *)color{
    CALayer *layer = [WWDrawLineHelper drawAnLineWithPointA:pointA toPointB:pointB lineWidth:width lineColor:color needAnimation:NO timeInterval:0];
    return layer;

}

/** *03 两点划线 线宽-线色-耗时 */
+ (CALayer *)drawAnLineWithPointA:(CGPoint)pointA toPointB:(CGPoint)pointB lineWidth:(CGFloat)width lineColor:(UIColor *)color timeInterval:(NSTimeInterval)time{
    CALayer *layer = [WWDrawLineHelper drawAnLineWithPointA:pointA toPointB:pointB lineWidth:width lineColor:color needAnimation:YES timeInterval:time];
    return layer;
}


/** *base0 两点划线 线宽-线色 -是否动画 - 动画时间 */
+ (CALayer *)drawAnLineWithPointA:(CGPoint)pointA toPointB:(CGPoint)pointB lineWidth:(CGFloat)width lineColor:(UIColor *)color needAnimation:(BOOL)isNeedAni timeInterval:(NSTimeInterval)time{
    
    [SuspensionHelper addTimeAndText:@"DrawLayer:begin"];
    //路径
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    // 起笔之点
    [linePath moveToPoint:pointA];
    // 连接到点
    [linePath addLineToPoint:pointB];
    
    
    //外形
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    
    lineLayer.lineWidth = width;
    lineLayer.path = linePath.CGPath;
    //lineLayer.fillColor = nil; // 默认为blackColor
    lineLayer.strokeColor = color.CGColor; //画色
    
    
    
    if (isNeedAni) {
       
        CABasicAnimation *basicAnimation = [WWDrawLineHelper createStrokeEndAnimationWith:time];
        [lineLayer addAnimation:basicAnimation forKey:@"strokeEnd"];//strokeEnd 这个属性 0.0 ~ 1.0
    }
    
    [SuspensionHelper addTimeAndText:@"DrawLayer:end"];
    
    return lineLayer;
    
}

+ (CABasicAnimation *)createStrokeEndAnimationWith:(NSTimeInterval)time {
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.duration = time;
    
    //错误 , 需要看动画key
    //        NSValue *v1 = [NSValue valueWithCGPoint:pointA];
    //        NSValue *v2 = [NSValue valueWithCGPoint:pointB];
    
    NSValue *v1 = [NSNumber numberWithInteger:0];
    NSValue *v2 = [NSNumber numberWithInteger:1];
    
    basicAnimation.fromValue = v1;
    basicAnimation.toValue   = v2;
    
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut ];//kCAMediaTimingFunctionLinear];
    //        basicAnimation.autoreverses = NO;//是否自动回到动画开始状态
    basicAnimation.removedOnCompletion = NO;//让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode属性为kCAFillModeForwards
    basicAnimation.fillMode = kCAFillModeForwards;
    
    basicAnimation.delegate = [WWDrawLineHelper shareSelf];
    //[lineLayer addAnimation:basicAnimation forKey:@"strokeEnd"];//strokeEnd 这个属性 0.0 ~ 1.0
    return basicAnimation;
    //非直接控制 lineLayer.strokeEnd = 1.0;
}

- (void)animationDidStart:(CAAnimation *)anim{
     [SuspensionHelper addTimeAndText:@"DrawLayer:Animation - start"];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [SuspensionHelper addTimeAndText:@"DrawLayer:Animation - end"];
}


/*
 CALayer *layer        = [[CALayer alloc]init];
 layer.backgroundColor = [UIColor brownColor].CGColor;//CGColor
 layer.bounds          = CGRectMake(0, 0, 200, 150);//设置宽高
 layer.anchorPoint     = CGPointZero;
 定义了该层边界矩形的锚点，作为一个点
 *规格化层坐标-(0,0)是左下角
 *边界rect(1,1)这是右上角。默认为
 *’(0.5,0.5)，也就是边界的中心。
 
layer.position        = CGPointMake(100, 400);//位置
layer.cornerRadius    = 20;//圆角半径
layer.shadowColor     = [UIColor blackColor].CGColor;//阴影cgcolor
layer.shadowOffset    = CGSizeMake(10, 20);//阴影偏移
layer.shadowOpacity   = 0.6;//阴影透明度

//设置代理
layer.delegate=self;
[layer setNeedsDisplay];
 */


@end
