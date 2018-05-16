//
//  GameItem.m
//  WaterPipes
//
//  Created by Victor Macintosh on 16/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "GameItem.h"

@implementation GameItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _exitPositions = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return self;
}

- (id)initPipeWithType:(PipeType)typeNumber andAngle:(NSInteger)angle {
    self = [super init];
    if (self) {
        _pipeType = typeNumber;
        [self setupExitPositionsForAngle:angle];
    }
    return self;
}

- (void)setupExitPositionsForAngle:(NSInteger)angle {
    NSNumber *isExist = [[NSNumber alloc] initWithInt:(IsExist)];
    NSNumber *isNotExist = [[NSNumber alloc] initWithInt:(IsNotExist)];
    [self setAngle:angle];
    switch (angle) {
        case 0:
            _exitPositions = [[NSMutableArray alloc] initWithObjects:isExist, isExist, isNotExist, isNotExist, nil];
            break;
        case 90:
            _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist, isExist, isExist, isNotExist, nil];
            break;
        case 180:
            _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist, isExist, isExist, isNotExist, nil];
            break;
        case 270:
            _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist, isExist, isExist, isNotExist, nil];
            break;
        default:
            _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist, isNotExist, isNotExist, isNotExist, nil];
            break;
    }
    [isExist release];
    [isNotExist release];
}

- (void)dealloc
{
    [_exitPositions release];
    [super dealloc];
}

@end
