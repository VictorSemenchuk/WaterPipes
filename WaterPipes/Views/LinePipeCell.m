//
//  LinePipeCell.m
//  WaterPipes
//
//  Created by Victor Macintosh on 16/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "LinePipeCell.h"

@implementation LinePipeCell

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
    [path addLineToPoint:CGPointMake(minX + xDelta, maxY - yDelta)];
    [path addLineToPoint:CGPointMake(minX, maxY - yDelta)];
    [path addLineToPoint:CGPointMake(minX, maxY)];
    [path addLineToPoint:CGPointMake(maxX, maxY)];
    [path addLineToPoint:CGPointMake(maxX, maxY - yDelta)];
    [path addLineToPoint:CGPointMake(maxX - xDelta, maxY - yDelta)];
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
    
    [path release];
    [shapeLayer release];
    [border release];
}


@end
