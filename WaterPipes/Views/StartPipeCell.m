//
//  StartPipeCell.m
//  WaterPipes
//
//  Created by Victor Macintosh on 18/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "StartPipeCell.h"
#import "ValveView.h"

@interface StartPipeCell()

@property (retain, nonatomic) NSString *wheelLayerName;
@property (retain, nonatomic) ValveView *valve;

@end

@implementation StartPipeCell

- (id)initWithFrame:(CGRect)frame andModelItem:(GameItem *)modelItem {
    self = [super initWithFrame:frame andModelItem:modelItem];
    if (self) {
        _wheelLayerName = @"WheelLayer";
        _valve = [[ValveView alloc] initWithFrame:CGRectMake([self frame].size.width / 2 - 10, 5, 20, 20)];
        [self addSubview:_valve];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat minX = [self frame].size.width / 4;
    CGFloat maxX = 3 * [self frame].size.width / 4;
    CGFloat minY = 1.0;
    CGFloat maxY = [self frame].size.height - 1;
    CGFloat xDelta = 5.0;
    CGFloat yDelta = 10.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(minX, minY)];
    [path addLineToPoint:CGPointMake(minX + xDelta, maxY - yDelta)];
    [path addLineToPoint:CGPointMake(minX, maxY - yDelta)];
    [path addLineToPoint:CGPointMake(minX, maxY)];
    [path addLineToPoint:CGPointMake(maxX, maxY)];
    [path addLineToPoint:CGPointMake(maxX, maxY - yDelta)];
    [path addLineToPoint:CGPointMake(maxX - xDelta, maxY - yDelta)];
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

- (void)rotateValveWithCompletion:(void(^)(void))completion {
    [[self valve] rotate];
    completion();
}

- (void)dealloc
{
    [_wheelLayerName release];
    [_valve release];
    [super dealloc];
}

@end
