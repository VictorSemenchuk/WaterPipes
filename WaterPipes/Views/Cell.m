//
//  Cell.m
//  WaterPipes
//
//  Created by Victor Macintosh on 15/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "Cell.h"

@interface Cell()

@property (retain, nonatomic) NSNumber *currentAngle;
@property (assign, nonatomic) CGColorRef bgColor;
@property (assign, nonatomic) CGColorRef strokeColor;

- (CGColorRef)bgColor;
- (CGColorRef)strokeColor;

@end

@implementation Cell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _currentAngle = [[NSNumber alloc] initWithLong:0];
        _bgColor = [[[[UIColor alloc] initWithRed:220.0/255.0
                                           green:233.0/255.0
                                            blue:239.0/255.0
                                           alpha:255.0/255.0] autorelease] CGColor];
        _strokeColor = [[[[UIColor alloc] initWithRed:50.0/255.0
                                               green:54.0/255.0
                                                blue:67.0/255.0
                                               alpha:255.0/255.0] autorelease] CGColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rotateCell)];
        [self addGestureRecognizer:tap];
        [tap release];
        
        [self setUserInteractionEnabled:YES];
        
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.0]];
    }
    return self;
}

- (void)rotateCell {
    CGFloat stepAngle = 90 * M_PI / 180;
    NSInteger currentAngle = [[self currentAngle] integerValue];
    
    if (currentAngle == 270) {
        [self setCurrentAngle:[NSNumber numberWithLong:0]];
    } else {
        [self setCurrentAngle:[NSNumber numberWithLong:currentAngle + 90]];
    }
    
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotationAnimation setByValue:[NSNumber numberWithFloat:stepAngle]];
    [rotationAnimation setDuration:0.1];
    [rotationAnimation setRemovedOnCompletion:NO];
    [rotationAnimation setFillMode:kCAFillModeForwards];
    [[self layer] addAnimation:rotationAnimation forKey:nil];
}

- (void)dealloc
{
    _bgColor = nil;
    _strokeColor = nil;
    [_currentAngle release];
    [super dealloc];
}

@end
