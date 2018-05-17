//
//  Game.m
//  WaterPipes
//
//  Created by Victor Macintosh on 16/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "Game.h"

@interface Game()

- (void)setupGameWithAreaSize:(NSUInteger)size;
- (void)setupControlItemsForGame:(NSUInteger)number;
- (int)getRandomNumberBetween:(int)from to:(int)to;
- (void)resetGameItemsToUnsedState;
- (void)setupPipePropertiesWithType:(PipeType)pipeType andI:(int)i andJ:(int)j;

@end

@implementation Game


//MARK:- Initialization

- (id)initForGame:(NSUInteger)number withAreaSize:(NSUInteger)size {
    self = [super init];
    if (self) {
        //Running method for generating angle and type of pipes for each cell
        [self setupGameWithAreaSize:size];
        //Running methods to form goal chain of cells and particular types of pipes
        [self setupControlItemsForGame:number];
    }
    return self;
}

//MARK:- Setup game

- (void)setupGameWithAreaSize:(NSUInteger)size {
    
    //Array of position angles
    NSArray *angles = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:0],
                       [NSNumber numberWithInt:90],
                       [NSNumber numberWithInt:180],
                       [NSNumber numberWithInt:270],
                       nil];
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:size];
    
    for (int i = 0; i < size; i++) {
        NSMutableArray *currentRowItems = [[NSMutableArray alloc] initWithCapacity:size];
        for (int j = 0; j < size; j++) {
            //Default pipe type is LinePipe and default angle is 0 degrees
            PipeType pipeType = LinePipe;
            NSInteger angle = 0;
            //Start pipe of chain is located at (0,0) and end pipe is located at (size - 1, size - 1) cells
            //So for these pipe set LinePipe type and angle = 0 degrees
            //Otherwise generate random angle and type for each pipe
            if (((i == 0) && (j == 0)) || ((i == size - 1) && (j == size - 1))) {
                pipeType = LinePipe;
                angle = 0;
            } else {
                pipeType = [self getRandomNumberBetween:0 to:1];
                angle = [angles[[self getRandomNumberBetween:0 to:3]] integerValue];
            }
            GameItem *item = [[GameItem alloc] initPipeWithType:pipeType andAngle:angle];
            [currentRowItems setObject:item atIndexedSubscript:j];
            [item release];
        }
        [items setObject:currentRowItems atIndexedSubscript:i];
        [currentRowItems release];
    }
    
    _items = [[NSArray alloc] initWithArray:items];
    
    [angles release];
    [items release];
}

- (void)setupControlItemsForGame:(NSUInteger)number {
    
    //Number is number of available variants of game
    //For each variant design different goal chain
    //controlItems array contains indexes of goal cells for items array
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:15];
    
    if (number == 0) {
        int i = 0, j = 0;
        //Create MatrixIndex object for containing indexes
        MatrixIndex *itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:0];
        
        i = 1;
        j = 0;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:1];
        //Generate exits vector for particular type of pipe
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 1;
        j = 1;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:2];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 0;
        j = 1;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:3];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 0;
        j = 2;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:4];
        [self setupPipePropertiesWithType:LinePipe andI:i andJ:j];
        
        i = 0;
        j = 3;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:5];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 1;
        j = 3;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:6];
        [self setupPipePropertiesWithType:LinePipe andI:i andJ:j];
        
        i = 2;
        j = 3;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:7];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 2;
        j = 2;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:8];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 3;
        j = 2;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:9];
        [self setupPipePropertiesWithType:LinePipe andI:i andJ:j];
        
        i = 4;
        j = 2;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:10];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 4;
        j = 3;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:11];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 3;
        j = 3;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:12];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 3;
        j = 4;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:13];
        [self setupPipePropertiesWithType:CurvedPipe andI:i andJ:j];
        
        i = 4;
        j = 4;
        itemIndex = [[[MatrixIndex alloc] initWithI:i andJ:j] autorelease];
        [items setObject:itemIndex atIndexedSubscript:14];
        
    }
    
    _controlItems = [[NSArray alloc] initWithArray:items];
    [items release];
}

//MARK:- Checking results

- (BOOL)checkResult {
    
    for (int i = 0; i < [[self controlItems] count] - 1; i++) {

        //Get current and next items indexes
        MatrixIndex *itemIndex = [self controlItems][i];
        MatrixIndex *nextItemIndex = [self controlItems][i+1];
        //Get current and next items
        GameItem *item = [self items][itemIndex.i][itemIndex.j];
        GameItem *nextItem = [self items][nextItemIndex.i][nextItemIndex.j];
        
        //If current item has exit at the bottom, next item has exit at the top
        //and current item is above than next item
        //then it's OK and jump to next item
        //else stop loop end return FALSE value
        if (([[item exitPositions][2] integerValue] == 1) &&
            ([[nextItem exitPositions][0] integerValue] == 1)) {
            if ([itemIndex i] < [nextItemIndex i]) {
                NSLog(@"OK! Next item");
                [[item exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:2];
                [[nextItem exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:0];
            } else {
                NSLog(@"The game continues");
                [self resetGameItemsToUnsedState];
                return NO;
            }
        //If current item has exit at the top, next item has exit at the bottom
        //and current item is below than next item
        //then it's OK and jump to next item
        //else stop loop end return FALSE value
        } else if (([[item exitPositions][0] integerValue] == 1) &&
                   ([[nextItem exitPositions][2] integerValue] == 1)) {
            if ([itemIndex i] > [nextItemIndex i]) {
                NSLog(@"OK! Next item");
                [[item exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:0];
                [[nextItem exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:2];
            } else {
                NSLog(@"The game continues");
                [self resetGameItemsToUnsedState];
                return NO;
            }
        //If current item has exit at the right, next item has exit at the left
        //and current item is to the left of next item
        //then it's OK and jump to next item
        //else stop loop end return FALSE value
        } else if (([[item exitPositions][1] integerValue] == 1) &&
                   ([[nextItem exitPositions][3] integerValue] == 1)) {
            if ([itemIndex j] < [nextItemIndex j]) {
                NSLog(@"OK! Next item");
                [[item exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:1];
                [[nextItem exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:3];
            } else {
                NSLog(@"The game continues");
                [self resetGameItemsToUnsedState];
                return NO;
            }
        //If current item has exit at the left, next item has exit at the right
        //and current item is to the right of next item
        //then it's OK and jump to next item
        //else stop loop end return FALSE value
        } else if (([[item exitPositions][3] integerValue] == 1) &&
                   ([[nextItem exitPositions][1] integerValue] == 1)) {
            if ([itemIndex j] > [nextItemIndex j]) {
                NSLog(@"OK! Next item");
                [[item exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:3];
                [[nextItem exitPositions] setObject:[NSNumber numberWithInt:-1] atIndexedSubscript:1];
            } else {
                NSLog(@"The game continues");
                [self resetGameItemsToUnsedState];
                return NO;
            }
        //If all above statements aren't right then return FALSE value
        } else {
            NSLog(@"The game continues");
            [self resetGameItemsToUnsedState];
            return NO;
        }
    }
    //If all OK then return TRUE value (i.e.
    return YES;
}

//MARK:- Support methods

- (void)setupPipePropertiesWithType:(PipeType)pipeType andI:(int)i andJ:(int)j {
    GameItem *currItem = [self items][i][j];
    [currItem setPipeType:pipeType];
    [currItem setupExitPositionsForAngle:[currItem angle] forType:[currItem pipeType]];
}

- (void)resetGameItemsToUnsedState {
    //Reset all items markers of exits at goal chain to start values
    for (MatrixIndex *itemIndex in [self controlItems]) {
        GameItem *item = [self items][itemIndex.i][itemIndex.j];
        [item setupExitPositionsForAngle:[item angle] forType:[item pipeType]];
    }
}

- (int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

//MARK:- Deallocating

- (void)dealloc {
    [_controlItems release];
    [_items release];
    [super dealloc];
}

@end
