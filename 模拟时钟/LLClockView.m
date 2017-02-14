//
//  LLClockView.m
//  模拟时钟
//
//  Created by locklight on 17/2/14.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLClockView.h"

@interface LLClockView ()
@property (nonatomic, weak) CALayer *secLayer;

@end

@implementation LLClockView{
    CADisplayLink  *_timer;
    NSCalendar *_calendar;
}

- (void)willMoveToWindow:(UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    
    NSLog(@"%@",newWindow);
    
    //从窗口移除
    if( newWindow == nil) {
        [_timer invalidate];
    }else{
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)updateTime{
    NSLog(@"%s",__func__);
    
    //根据日期获取当前时间
    NSDateComponents *currentTime = [_calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    //获取当前秒
    NSInteger second = currentTime.second;
    
    //根据秒数计算弧度
    CGFloat angle = 2 * M_PI / 60 * second;
    NSLog(@"%zd",second);
    
    //设置秒针形变
    _secLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1);
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}


- (instancetype)initWithImage:(UIImage *)image{
   self = [super init];
    if (self) {
        [self setupUIWithImage:image];
    }
    return self;
}


- (void)setupUIWithImage:(UIImage *)image{
    //设置图片图层内容 大小
    self.layer.contents = (id)image.CGImage;
    self.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    
    //添加秒针图层
    CALayer *layer = [CALayer layer];
    
    //设置图层中心点
    CGPoint center = CGPointMake(image.size.width/2, image.size.height /2);
    
    layer.bounds = CGRectMake(0, 0, 1, image.size.width * 0.4);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.position = center;
    
    [self.layer addSublayer:layer];
    
    //设置定位点
    layer.anchorPoint = CGPointMake(0.5, 0.9);
    
    _secLayer = layer;
    _calendar = [NSCalendar currentCalendar];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
