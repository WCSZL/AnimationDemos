//
//  WWDrowLineHelper.h
//  AnimationDemosLike
//
//  Created by wxw on 2018/7/25.
//  Copyright © 2018年 wxw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWDrawLineHelper : NSObject

/** *01 两点划线 默认 线宽0.5 -线色black */
+ (CALayer *)drowAnLineWithPointA:(CGPoint)pointA toPointB:(CGPoint)pointB;
/** *02 两点划线 线宽-线色 */
+ (CALayer *)drowAnLineWithPointA:(CGPoint)pointA toPointB:(CGPoint)pointB lineWidth:(CGFloat)width lineColor:(UIColor *)color;
/** *03 两点划线 线宽-线色-耗时 */
+ (CALayer *)drawAnLineWithPointA:(CGPoint)pointA toPointB:(CGPoint)pointB lineWidth:(CGFloat)width lineColor:(UIColor *)color timeInterval:(NSTimeInterval)time;

@end
