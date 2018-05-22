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
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //0 = isExist
    NSNumber *isExist = [[NSNumber alloc] initWithInt:(IsExist)];
    //1 = isNotExist
    NSNumber *isNotExist = [[NSNumber alloc] initWithInt:(IsNotExist)];
    
    [self setAngle:angle];
    switch ([self angle]) {
        case 0:
            if (pipeType == CurvedPipe) {
                //|| 1 || 1 || 0 || 0 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isExist,
                                       isExist,
                                       isNotExist,
                                       isNotExist,
                                       nil] autorelease];
            } else if (pipeType == StartPipe) {
                //|| 0 || 0 || 1 || 0 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isNotExist,
                                       isNotExist,
                                       isExist,
                                       isNotExist,
                                       nil] autorelease];
            } else if (pipeType == EndPipe) {
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isExist,
                                       isNotExist,
                                       isNotExist,
                                       isNotExist,
                                       nil] autorelease];
            } else {
                //|| 1 || 0 || 1 || 0 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isExist,
                                       isNotExist,
                                       isExist,
                                       isNotExist,
                                       nil] autorelease];
            }
            break;
        case 90:
            if (pipeType == CurvedPipe) {
                //|| 0 || 1 || 1 || 0 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isNotExist,
                                       isExist,
                                       isExist,
                                       isNotExist,
                                       nil] autorelease];
            } else {
                //|| 0 || 1 || 0 || 1 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isNotExist,
                                       isExist,
                                       isNotExist,
                                       isExist,
                                       nil] autorelease];
            }
            break;
        case 180:
            if (pipeType == CurvedPipe) {
                //|| 0 || 0 || 1 || 1 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isNotExist,
                                       isNotExist,
                                       isExist,
                                       isExist,
                                       nil] autorelease];
            } else {
                //|| 1 || 0 || 1 || 0 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isExist,
                                       isNotExist,
                                       isExist,
                                       isNotExist,
                                       nil] autorelease];
            }
            break;
        case 270:
            if (pipeType == CurvedPipe) {
                //|| 1 || 0 || 0 || 1 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isExist,
                                       isNotExist,
                                       isNotExist,
                                       isExist,
                                       nil] autorelease];
            } else {
                //|| 0 || 1 || 0 || 1 ||
                self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isNotExist,
                                       isExist,
                                       isNotExist,
                                       isExist,
                                       nil] autorelease];
            }
            break;
        default:
            self.exitPositions = [[[NSMutableArray alloc] initWithObjects:isNotExist,
                                   isNotExist,
                                   isNotExist,
                                   isNotExist,
                                   nil] autorelease];
            break;
    }
    
    [isExist release];
    [isNotExist release];
    [pool release];
}

//MARK:- Deallocating

- (void)dealloc
{
    [_exitPositions release];
    //_exitPositions = nil;
    [super dealloc];
}

@end
