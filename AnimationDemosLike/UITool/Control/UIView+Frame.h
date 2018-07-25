
#import <UIKit/UIKit.h>

@interface UIView (Frame)
#pragma mark ----------Origin----------

/**
 *  获取视图的起始点
 */
@property(nonatomic,assign) CGPoint origin;

/**
 *  获取视图起始点的X坐标值
 */
@property(nonatomic,assign) CGFloat x;

/**
 *  获取视图起始点的Y坐标值
 */
@property(nonatomic,assign) CGFloat y;

/**
 *  设置视图的起始点
 *
 *  @param origin 视图的起始点
 */
- (void)setOrigin:(CGPoint) origin;

/**
 *  设置视图的起始点X坐标
 *
 *  @param x X坐标值
 */
- (void)setX:(CGFloat)x;

/**
 *  设置视图的起始点X坐标
 *
 *  @param y Y坐标值
 */
- (void)setY:(CGFloat)y;

#pragma mark ----------Center----------

/**
 *  获取视图中点X坐标值
 */
@property(nonatomic,assign) CGFloat centerX;

/**
 *  获取视图中点的Y坐标值
 */
@property(nonatomic,assign) CGFloat centerY;

/**
 *  设置视图的中心点X坐标
 *
 *  @param x X坐标值
 */
- (void)setCenterX:(CGFloat)x;

/**
 *  设置视图的中心点Y坐标
 *
 *  @param y Y坐标值
 */
- (void)setCenterY:(CGFloat)y;

#pragma mark ----------Size----------

/**
 *  获取视图的尺寸
 */
@property(nonatomic,assign) CGSize size;

/**
 *  获取视图的宽度
 */
@property(nonatomic,assign) CGFloat width;

/**
 *  获取视图的高度
 */
@property(nonatomic,assign) CGFloat height;

/**
 *  设置视图的尺寸
 *
 *  @param size 要设置的尺寸大小
 */
- (void)setSize:(CGSize) size;

/**
 *  设置视图的宽度
 *
 *  @param width 要设置的宽度
 */
- (void)setWidth:(CGFloat)width;

/**
 *  设置视图的高度
 *
 *  @param height 要设置的高度
 */
- (void)setHeight:(CGFloat)height;

#pragma mark ----------Margin----------

/**
 *  获取视图的顶部坐标值
 */
@property(nonatomic,assign) CGFloat top;

/**
 *  获取视图的底部坐标值
 */
@property(nonatomic,assign) CGFloat bottom;

/**
 *  获取视图左侧的坐标值
 */
@property(nonatomic,assign) CGFloat left;

/**
 *  获取视图右侧坐标值
 */
@property(nonatomic,assign) CGFloat right;

/**
 *  设置视图的顶部坐标值
 *
 *  @param top 要设置的顶部坐标值
 */
- (void)setTop:(CGFloat)top;

/**
 *  设置视图的底部坐标值
 *
 *  @param bottom 要设置的底部坐标值
 */
- (void)setBottom:(CGFloat)bottom;

/**
 *  设置视图的左侧坐标值
 *
 *  @param left 要设置的左侧坐标值
 */
- (void)setLeft:(CGFloat)left;

/**
 *  设置视图右侧的坐标值
 *
 *  @param right 要设置的右侧坐标值
 */

- (void)setRight:(CGFloat)right;
@end
