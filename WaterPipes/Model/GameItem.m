//
//  GameItem.m
//  WaterPipes
//
//  Created by Victor Macintosh on 16/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "GameItem.h"

@implementation GameItem

//MARK:- Initialization

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
        [self setupExitPositionsForAngle:angle forType:typeNumber];
    }
    return self;
}

//MARK:- Setup exits positions vector

- (void)setupExitPositionsForAngle:(NSInteger)angle forType:(PipeType)pipeType {
    
    //For each position angle and type of pipe generating exits positions vector
    //|| top || right || bottom || left ||
    
    //0 = isExist
    NSNumber *isExist = [[NSNumber alloc] initWithInt:(IsExist)];
    //1 = isNotExist
    NSNumber *isNotExist = [[NSNumber alloc] initWithInt:(IsNotExist)];
    
    [self setAngle:angle];
    switch ([self angle]) {
        case 0:
            if (pipeType == CurvedPipe) {
                //|| 1 || 1 || 0 || 0 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isExist,
                                  isExist,
                                  isNotExist,
                                  isNotExist,
                                  nil];
            } else if (pipeType == StartPipe) {
                //|| 0 || 0 || 1 || 0 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist,
                                  isNotExist,
                                  isExist,
                                  isNotExist,
                                  nil];
            } else if (pipeType == EndPipe) {
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isExist,
                                  isNotExist,
                                  isNotExist,
                                  isNotExist,
                                  nil];
            } else {
                //|| 1 || 0 || 1 || 0 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isExist,
                                  isNotExist,
                                  isExist,
                                  isNotExist,
                                  nil];
            }
            break;
        case 90:
            if (pipeType == CurvedPipe) {
                //|| 0 || 1 || 1 || 0 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist,
                                  isExist,
                                  isExist,
                                  isNotExist,
                                  nil];
            } else {
                //|| 0 || 1 || 0 || 1 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist,
                                  isExist,
                                  isNotExist,
                                  isExist,
                                  nil];
            }
            break;
        case 180:
            if (pipeType == CurvedPipe) {
                //|| 0 || 0 || 1 || 1 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist,
                                  isNotExist,
                                  isExist,
                                  isExist,
                                  nil];
            } else {
                //|| 1 || 0 || 1 || 0 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isExist,
                                  isNotExist,
                                  isExist,
                                  isNotExist,
                                  nil];
            }
            break;
        case 270:
            if (pipeType == CurvedPipe) {
                //|| 1 || 0 || 0 || 1 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isExist,
                                  isNotExist,
                                  isNotExist,
                                  isExist,
                                  nil];
            } else {
                //|| 0 || 1 || 0 || 1 ||
                _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist,
                                  isExist,
                                  isNotExist,
                                  isExist,
                                  nil];
            }
            break;
        default:
            _exitPositions = [[NSMutableArray alloc] initWithObjects:isNotExist,
                              isNotExist,
                              isNotExist,
                              isNotExist,
                              nil];
            break;
    }
    
    [isExist release];
    [isNotExist release];
}

//MARK:- Deallocating

- (void)dealloc
{
    [_exitPositions release];
    [super dealloc];
}

@end
