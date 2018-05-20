//
//  GameItem.h
//  WaterPipes
//
//  Created by Victor Macintosh on 16/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    LinePipe = 0,
    CurvedPipe,
    StartPipe,
    EndPipe
} PipeType;

typedef enum {
    IsNotExist = 0,
    IsExist = 1
} ExitType;

@interface GameItem : NSObject

@property (assign, nonatomic) PipeType pipeType;
@property (retain, nonatomic) NSMutableArray *exitPositions;
@property (assign, nonatomic) NSInteger angle;

//exitPositions property contains exits for single pipe
//Each pipe should contain 2 positions.
//|| top || right || bottom || left ||
//1 - exit exists at this position
//0 - exit doesn't exist at this position

- (id)initPipeWithType:(PipeType)typeNumber andAngle:(NSInteger)angle;
- (void)setupExitPositionsForAngle:(NSInteger)angle forType:(PipeType)pipeType;

@end
