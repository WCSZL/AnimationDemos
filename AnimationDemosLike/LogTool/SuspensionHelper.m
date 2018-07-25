//
//  SuspensionHelper.m
//  悬浮窗展示辅助开发
//
//  Created by wxw on 2018/7/24.
//  Copyright © 2018年 wxw. All rights reserved.
//

#import "SuspensionHelper.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface SuspensionHelper()
@property (nonatomic,strong) UIWindow *myWindow;
@property (nonatomic,strong) UIScrollView *myScrollView;
@property (nonatomic,assign) CGFloat lastBottom;//scroll 上控件最后的bottom
@end

@implementation SuspensionHelper

+ (instancetype)shareSelf{
    static SuspensionHelper *_helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!_helper) {
            _helper = [[SuspensionHelper alloc]init];
        }
        
    });
    return _helper;
}
- (instancetype)init{
    if (self = [super init]) {
        self.myWindow.frame = CGRectMake(ScreenWidth - 150, 70, 150, 200);
        [self.myWindow addSubview:self.myScrollView];
        [self addAn40x40DeleteButtonToWindow];
        [self addAn30x30Hide2sButton];
    }
    return self;
}

+ (void)addDateAndTimeAndText:(NSString *)text{
    [[SuspensionHelper shareSelf] createALabelIntoCrollViewWith:text isJustTime:NO];
}
+ (void)addTimeAndText:(NSString *)text{
    [[SuspensionHelper shareSelf] createALabelIntoCrollViewWith:text isJustTime:YES];
}

- (void)createALabelIntoCrollViewWith:(NSString *)text isJustTime:(BOOL)justTimeNoDate{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _lastBottom, self.myScrollView.contentSize.width, 22)];
    label.textColor = [UIColor brownColor];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = [NSString stringWithFormat:@"%@~%@" ,[self getCurrentDateTimeIsJustTime:justTimeNoDate] , text];
    
    self.lastBottom = CGRectGetMaxY(label.frame);
    self.myScrollView.contentSize = CGSizeMake(self.myWindow.bounds.size.width * 2, _lastBottom + 10);
    [self.myScrollView addSubview:label];
}
- (UIButton *)cteateButtonWithTitle:(NSString *)title frame:(CGRect)rect action:(SEL)sel{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = rect;
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor yellowColor] forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    btn.layer.cornerRadius = btn.bounds.size.width * 0.25;
    btn.layer.borderWidth = 0.3;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:sel forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}

- (void)addAn40x40DeleteButtonToWindow{
    CGRect rect =  CGRectMake(self.myWindow.bounds.size.width - 40, self.myWindow.bounds.size.height - 20, 40, 20);
    UIButton * btn = [self cteateButtonWithTitle:@"Del" frame:rect action:@selector(deleteAllLabel)];
    [self.myWindow addSubview:btn];
}
- (void)addAn30x30Hide2sButton{
    CGRect rect =  CGRectMake(self.myWindow.bounds.size.width - 40, self.myWindow.bounds.size.height - 40 - 5, 40, 20);
    UIButton * btn = [self cteateButtonWithTitle:@"Hide2s" frame:rect action:@selector(hide2s)];
    [self.myWindow addSubview:btn];
}
- (void)hide2s{
    self.myWindow.hidden = YES;
    //[self.myWindow performSelector:@selector(setHidden:) withObject:(BOOL)NO afterDelay:2.0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.myWindow setHidden:NO];
    });
}

- (void)deleteAllLabel{
    
    for (UILabel *la in self.myScrollView.subviews) {
        if ([la isKindOfClass:[UILabel class]]) {
            [la removeFromSuperview];
        }
    }
    self.lastBottom = 0;
}

/** * 获取当前时间点 */
- (NSString *)getCurrentDateTimeIsJustTime:(BOOL)justTimeNoDate{
    
    NSString *timeNow = nil;
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSSS"];//[formatter setDateFormat:@"YYYY.MM.dd.hh.mm.ss"];
    if (justTimeNoDate) {
        [formatter setDateFormat:@"hh:mm:ss:SSSS"];
    }
    NSString *date = [formatter stringFromDate:[NSDate date]];
    timeNow = [[NSString alloc] initWithFormat:@"%@", date];
    
    return timeNow;
}


- (UIScrollView *)myScrollView{
    if (!_myScrollView) {
        _myScrollView = [[UIScrollView alloc]initWithFrame:self.myWindow.bounds];
        _myScrollView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        _myScrollView.contentSize = CGSizeMake(self.myWindow.bounds.size.width * 2, _lastBottom + 10);
    }
    return _myScrollView;
}

- (UIWindow *)myWindow{
    if (!_myWindow) {
        _myWindow = [[UIWindow alloc]init];
        _myWindow.rootViewController = [[UIViewController alloc]init];
        _myWindow.backgroundColor = [UIColor clearColor];
        _myWindow.windowLevel = UIWindowLevelAlert + 1;
        [_myWindow makeKeyAndVisible];
    }
    return _myWindow;
}

@end
