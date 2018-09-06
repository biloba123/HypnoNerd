//
//  HNHypnosisView.m
//  Hypnosister
//
//  Created by 吕晴阳 on 2018/9/2.
//  Copyright © 2018年 Lv Qingyang. All rights reserved.
//

#import "HNHypnosisView.h"

@interface HNHypnosisView ()
@property(nonatomic) UIColor *circleColor;
@end

@implementation HNHypnosisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%s %f %f %f %f", sel_getName(_cmd), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGPoint center;
    center.x = (rect.origin.x + rect.size.width) / 2.0;
    center.y = (rect.origin.y + rect.size.height) / 2.0;
    float radius = hypot(rect.size.width, rect.size.height) / 2.0;

    [_circleColor setStroke];
    UIBezierPath *path = [UIBezierPath new];
    for (; radius > 0.0; radius -= 20) {
        [path moveToPoint:CGPointMake(center.x + radius, center.y)];
        [path addArcWithCenter:center
                        radius:radius
                    startAngle:0 endAngle:2 * M_PI
                     clockwise:YES];
    }
    path.lineWidth = 10;

    CGContextSaveGState(context);
    [path addClip];

    CGFloat loc[2] = {0.0, 1.0};
    CGFloat comps[8] = {1.0, 0.0, 0.0, 1.0,
            1.0, 1.0, 0.0, 1.0};
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, comps, loc, 2);
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(320, 480), 0);
    [path stroke];

    CGGradientRelease(gradient);
    CGColorSpaceRelease(space);
    CGContextRestoreGState(context);


    CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeMake(4, 6), 3);

    UIImage *img = [UIImage imageNamed:@"google.png"];
    [img drawInRect:CGRectMake(0, 200, 320, 100)];

    CGContextRestoreGState(context);

//    CGContextRelease(context);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"%s", sel_getName(_cmd));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s", sel_getName(_cmd));
    self.circleColor = [UIColor colorWithRed:[self random0To1]
                                       green:[self random0To1]
                                        blue:[self random0To1] alpha:1.0];
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (float)random0To1 {
    return arc4random() % 100 / 100.0;
}


@end
