//
//  CurvedPipeCell.m
//  WaterPipes
//
//  Created by Victor Macintosh on 16/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "CurvedPipeCell.h"

@implementation CurvedPipeCell

- (void)drawRect:(CGRect)rect {
    
    CGFloat minX = [self frame].size.width / 4;
    CGFloat maxX = 3 * [self frame].size.width / 4;
    CGFloat minY = 1.0;
    CGFloat midMinY = [self frame].size.height / 4;
    CGFloat midMaxY = 3 * [self frame].size.height / 4;
    CGFloat xDelta = 5.0;
    CGFloat yDelta = 10.0;
    CGFloat viewWidth = [self frame].size.width - 1;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(minX, minY)];
    [path addLineToPoint:CGPointMake(minX, minY + yDelta)];
    [path addLineToPoint:CGPointMake(minX + xDelta, minY + yDelta)];
    [path addLineToPoint:CGPointMake(minX + xDelta, midMaxY - xDelta)];
    [path addLineToPoint:CGPointMake(viewWidth - yDelta, midMaxY - xDelta)];
    [path addLineToPoint:CGPointMake(viewWidth - yDelta, midMaxY)];
    [path addLineToPoint:CGPointMake(viewWidth, midMaxY)];
    [path addLineToPoint:CGPointMake(viewWidth, midMinY)];
    [path addLineToPoint:CGPointMake(viewWidth - yDelta, midMinY)];
    [path addLineToPoint:CGPointMake(viewWidth - yDelta, midMinY + xDelta)];
    [path addLineToPoint:CGPointMake(maxX - xDelta, midMinY + xDelta)];
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
