
#import "UIView+Frame.h"

@implementation UIView (Frame)
#pragma mark ----------origin----------
- (CGPoint)origin{
	return self.frame.origin;
}
- (CGFloat)x{
	return self.frame.origin.x;
}
- (CGFloat)y{
	return self.frame.origin.y;
}

- (void)setOrigin:(CGPoint) origin{
	self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
}
- (void)setX:(CGFloat)x{
	self.frame = CGRectMake(x, self.y, self.frame.size.width, self.frame.size.height);
}
- (void)setY:(CGFloat)y{
	self.frame = CGRectMake(self.x, y, self.frame.size.width, self.frame.size.height);
}

#pragma mark ----------Center----------
- (CGFloat)centerX{
	return self.center.x;
}

- (CGFloat)centerY{
	return self.center.y;
}

- (void)setCenterX:(CGFloat)x{
	CGPoint tpCenter = self.center;
	tpCenter.x = x;
	self.center = tpCenter;
}

- (void)setCenterY:(CGFloat)y{
	CGPoint tpCenter = self.center;
	tpCenter.y = y;
	self.center = tpCenter;
}

#pragma mark ----------Size----------
- (CGSize)size{
	return self.frame.size;
}
- (CGFloat)width{
	return self.frame.size.width;
}
- (CGFloat)height{
	return self.frame.size.height;
}

- (void)setSize:(CGSize) size{
	self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}
- (void)setWidth:(CGFloat)width{
	self.frame = CGRectMake(self.x, self.y, width, self.height);
}
- (void)setHeight:(CGFloat)height{
	self.frame = CGRectMake(self.x, self.y, self.width, height);
}

#pragma mark ----------Margin----------
- (CGFloat)top {
	return self.y;
}
- (CGFloat)bottom {
	return self.top +self.height;
}
- (CGFloat)left {

	return self.x;
}
- (CGFloat)right {
	return self.left + self.width;
}

- (void)setTop:(CGFloat)top {
	[self setY:top];
}
- (void)setBottom:(CGFloat)bottom {
	self.frame = CGRectMake(self.x, bottom - self.height, self.width, self.height);
}
- (void)setLeft:(CGFloat)left {
	[self setX:left];
}
- (void)setRight:(CGFloat)right {
	self.frame = CGRectMake(right - self.width, self.y, self.width, self.height);
}
@end
