//
//  EndPipeCell.m
//  WaterPipes
//
//  Created by Victor Macintosh on 18/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "EndPipeCell.h"

@implementation EndPipeCell

- (void)drawRect:(CGRect)rect {
    
    CGFloat minX = [self frame].size.width / 4;
    CGFloat maxX = 3 * [self frame].size.width / 4;
    CGFloat minY = 1.0;
    CGFloat maxY = [self frame].size.height - 1;
    CGFloat xDelta = 5.0;
    CGFloat yDelta = 10.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(minX, minY)];
    [path addLineToPoint:CGPointMake(minX, minY + yDelta)];
    [path addLineToPoint:CGPointMake(minX + xDelta, minY + yDelta)];
    [path addLineToPoint:CGPointMake(minX, maxY)];
    [path addLineToPoint:CGPointMake(maxX, maxY)];
    [path addLineToPoint:CGPointMake(maxX - xDelta, minY + yDelta)];
    [path addLineToPoint:CGPointMake(maxX, minY + yDelta)];
    [path addLineToPoint:CGPointMake(maxX, minY)];
    [path closePath];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    [shapeLayer setPath:[path CGPath]];
    [[self layer] setMask:shapeLayer];
    [[self layer] setBackgroundColor:[self bgColor]];
    
    CAShapeLayer *border = [[CAShapeLayer alloc] init];
    [border setPath:[shapeLayer path]];
    [border setLineWidth:2.0];
    [border setFillColor:[[UIColor clearColor] CGColor]];
    [border setStrokeColor:[self strokeColor]];
    [[self layer] addSublayer:border];
    
    CAShapeLayer *finishLine = [[CAShapeLayer alloc] init];
    [finishLine setFrame:CGRectMake(0, [self frame].size.height - 5, [self frame].size.width, 5)];
    [finishLine setBackgroundColor:[[UIColor redColor] CGColor]];
    [[self layer] addSublayer:finishLine];
    
    [path release];
    [shapeLayer release];
    [border release];
    [finishLine release];
    
}

@end
