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

//MARK:- Initialization

- (id)initWithFrame:(CGRect)frame andModelItem:(GameItem *)modelItem {
    self = [super initWithFrame:frame];
    if (self) {
        
        _modelItem = modelItem; //Set game item (from model)
        _bgColor = [[[[UIColor alloc] initWithRed:221.0/255.0
                                            green:228.0/255.0
                                             blue:247.0/255.0
                                            alpha:255.0/255.0] autorelease] CGColor];
        _strokeColor = [[[[UIColor alloc] initWithRed:155.0/255.0
                                               green:173.0/255.0
                                                blue:204.0/255.0
                                               alpha:255.0/255.0] autorelease] CGColor];
        
        //Gesture for cell tap
        if (([modelItem pipeType] == LinePipe) || ([modelItem pipeType] == CurvedPipe)) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rotateCellWithAnimation)];
            [self addGestureRecognizer:tap];
            [tap release];
        }
        
        [self setUserInteractionEnabled:YES];
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.0]];
        
        //Configure startAngle
        [self rotateCell];
    }
    return self;
}

//MARK:- Rotation methods

//Rotation cell without animation
- (void)rotateCell {
    //Angle generation
    CGFloat angle = [[self modelItem] angle] * M_PI / 180;
    //Transformation
    CGAffineTransform currentTransform = [[self layer] affineTransform];
    [[self layer] setAffineTransform:CGAffineTransformRotate(currentTransform, angle)];
}

//Rotation cell with animation
- (void)rotateCellWithAnimation {
    //Step for each tap
    CGFloat stepAngle = 90 * M_PI / 180;
    NSInteger currentAngle = [[self modelItem] angle];
    
    //If current angle is 270 degrees then set angle to origin state - 0 degrees. Otherwise +90 degrees
    if (currentAngle == 270) {
        [[self modelItem] setAngle: 0];
    } else {
        [[self modelItem] setAngle:currentAngle + 90];
    }
    
    //Rotate animteion
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotationAnimation setByValue:[NSNumber numberWithFloat:stepAngle]];
    [rotationAnimation setDuration:0.1];
    [rotationAnimation setRemovedOnCompletion:NO];
    [rotationAnimation setFillMode:kCAFillModeForwards];
    [[self layer] addAnimation:rotationAnimation forKey:nil];
    
    //Setup exist positions for future checking pipes connecting
    [[self modelItem] setupExitPositionsForAngle: [[self modelItem] angle] forType:[[self modelItem] pipeType]];
    
    //Call delegate method
    [[self delegate] cellWasRotated];
}

//MARK:- Deallocation

- (void)dealloc
{
    _bgColor = nil;
    _strokeColor = nil;
    [super dealloc];
}

@end
