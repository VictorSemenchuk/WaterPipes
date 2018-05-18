//
//  ValveView.m
//  WaterPipes
//
//  Created by Victor Macintosh on 18/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ValveView.h"

@implementation ValveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.0]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat lineWidth = 3.0;
    
    CAShapeLayer *valveCircle = [[CAShapeLayer alloc] init];
    [valveCircle setLineWidth:lineWidth];
    [valveCircle setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 20, 20)] CGPath]];
    [valveCircle setStrokeColor:[[UIColor redColor] CGColor]];
    [valveCircle setFillColor:[[UIColor clearColor] CGColor]];
    
    CAShapeLayer *vLine = [[CAShapeLayer alloc] init];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake([self frame].size.width / 2, 0)];
    [linePath addLineToPoint:CGPointMake([self frame].size.width / 2, [self frame].size.height)];
    [vLine setPath:linePath.CGPath];
    [vLine setLineWidth:lineWidth];
    [vLine setStrokeColor:[UIColor redColor].CGColor];
    
    CAShapeLayer *hLine = [[CAShapeLayer alloc] init];
    linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, [self frame].size.height / 2)];
    [linePath addLineToPoint:CGPointMake([self frame].size.width, [self frame].size.height / 2)];
    [hLine setPath:linePath.CGPath];
    [hLine setLineWidth:lineWidth];
    [hLine setStrokeColor:[UIColor redColor].CGColor];
    
    [[self layer] addSublayer:valveCircle];
    [[self layer] addSublayer:vLine];
    [[self layer] addSublayer:hLine];
    
    [valveCircle release];
    [vLine release];
    [hLine release];
    
}

- (void)rotate {
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotationAnimation setToValue:[NSNumber numberWithFloat: M_PI * 2]];
    [rotationAnimation setDuration:1];
    [rotationAnimation setCumulative:YES];
    [rotationAnimation setRepeatCount:0];
    [[self layer] addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end
