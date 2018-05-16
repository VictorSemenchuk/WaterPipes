//
//  Cell.m
//  WaterPipes
//
//  Created by Victor Macintosh on 15/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "Cell.h"
#import "GameItem.h"

@interface Cell()

@property (assign, nonatomic) CGColorRef bgColor;
@property (assign, nonatomic) CGColorRef strokeColor;
@property (weak, nonatomic) GameItem *modelItem;

- (CGColorRef)bgColor;
- (CGColorRef)strokeColor;

- (void)rotateCell;
- (void)rotateCellWithAnimation;

@end

@implementation Cell

- (id)initWithFrame:(CGRect)frame andModelItem:(GameItem *)modelItem {
    self = [super initWithFrame:frame];
    if (self) {
        
        _modelItem = modelItem;
        _bgColor = [[[[UIColor alloc] initWithRed:220.0/255.0
                                           green:233.0/255.0
                                            blue:239.0/255.0
                                           alpha:255.0/255.0] autorelease] CGColor];
        _strokeColor = [[[[UIColor alloc] initWithRed:50.0/255.0
                                               green:54.0/255.0
                                                blue:67.0/255.0
                                               alpha:255.0/255.0] autorelease] CGColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rotateCellWithAnimation)];
        [self addGestureRecognizer:tap];
        [tap release];
        
        [self setUserInteractionEnabled:YES];
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.0]];
        [self rotateCell];
    }
    return self;
}

- (void)rotateCell {
    CGFloat angle = [[self modelItem] angle] * M_PI / 180;
    CGAffineTransform currentTransform = [[self layer] affineTransform];
    [[self layer] setAffineTransform:CGAffineTransformRotate(currentTransform, angle)];
}

- (void)rotateCellWithAnimation {
    CGFloat stepAngle = 90 * M_PI / 180;
    NSInteger currentAngle = [[self modelItem] angle];
    
    if (currentAngle == 270) {
        [[self modelItem] setAngle: 0];
    } else {
        [[self modelItem] setAngle:currentAngle + 90];
    }
    
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotationAnimation setByValue:[NSNumber numberWithFloat:stepAngle]];
    [rotationAnimation setDuration:0.1];
    [rotationAnimation setRemovedOnCompletion:NO];
    [rotationAnimation setFillMode:kCAFillModeForwards];
    [[self layer] addAnimation:rotationAnimation forKey:nil];
    
    [[self modelItem] setupExitPositionsForAngle: [[self modelItem] angle] forType:[[self modelItem] pipeType]];
    [[self delegate] cellWasRotated];
}

- (void)dealloc
{
    _bgColor = nil;
    _strokeColor = nil;
    [super dealloc];
}

@end
