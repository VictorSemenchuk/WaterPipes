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

@end

@implementation Game

- (id)initForGame:(NSUInteger)number withAreaSize:(NSUInteger)size {
    self = [super init];
    if (self) {
        [self setupGameWithAreaSize:size];
        [self setupControlItemsForGame:number];
    }
    return self;
}

- (void)setupGameWithAreaSize:(NSUInteger)size {
    NSArray *angles = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:90], [NSNumber numberWithInt:180], [NSNumber numberWithInt:270], nil];
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:size];
    
    for (int i = 0; i < size; i++) {
        NSMutableArray *currentRowItems = [[NSMutableArray alloc] initWithCapacity:size];
        for (int j = 0; j < size; j++) {
            PipeType pipeType = LinePipe;
            NSInteger angle = 0;
            if (((i == 0) && (j == 0)) || ((i == size - 1) && (j == size - 1))) {
                pipeType = LinePipe;
                angle = 0;
            } else {
                pipeType = [self getRandomNumberBetween:0 to:1];
                angle = [angles[[self getRandomNumberBetween:0 to:1]] integerValue];
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

- (BOOL)checkResult {
    
    for (int i = 1; i < [[self controlItems] count] - 1; i++) {
        GameItem *item = [[self controlItems] objectAtIndex:i];
        GameItem *prevItem = [[self controlItems] objectAtIndex:(i - 1)];
        GameItem *nextItem = [[self controlItems] objectAtIndex:(i + 1)];
        if ([item pipeType] == LinePipe) {
            if ([[[item exitPositions] objectAtIndex:0] integerValue] == 1 &&
                [[[item exitPositions] objectAtIndex:2] integerValue] == 1) {
                if ((([[[prevItem exitPositions] objectAtIndex:0] integerValue] == 1)
                     || ([[[prevItem exitPositions] objectAtIndex:2] integerValue] == 1)) &&
                    (([[[nextItem exitPositions] objectAtIndex:0] integerValue] == 1)
                     || ([[[nextItem exitPositions] objectAtIndex:2] integerValue] == 1))) {
                        NSLog(@"OK");
                    } else {
                        return NO;
                    }
            } else if ([[[item exitPositions] objectAtIndex:1] integerValue] == 1 &&
                       [[[item exitPositions] objectAtIndex:3] integerValue] == 1) {
                if ((([[[prevItem exitPositions] objectAtIndex:1] integerValue] == 1)
                     || ([[[prevItem exitPositions] objectAtIndex:3] integerValue] == 1)) &&
                    (([[[nextItem exitPositions] objectAtIndex:1] integerValue] == 1)
                     || ([[[nextItem exitPositions] objectAtIndex:3] integerValue] == 1))) {
                        NSLog(@"OK");
                    } else {
                        return NO;
                    }
            } else {
                return NO;
            }
        } else if ([item pipeType] == CurvedPipe) {
            if ([[[item exitPositions] objectAtIndex:0] integerValue] == 1 &&
                [[[item exitPositions] objectAtIndex:1] integerValue] == 1) {
                if ((([[[prevItem exitPositions] objectAtIndex:2] integerValue] == 1)
                     || ([[[prevItem exitPositions] objectAtIndex:3] integerValue] == 1)) &&
                    (([[[nextItem exitPositions] objectAtIndex:2] integerValue] == 1)
                     || ([[[nextItem exitPositions] objectAtIndex:3] integerValue] == 1))) {
                        NSLog(@"OK");
                    } else {
                        return NO;
                    }
            } else if ([[[item exitPositions] objectAtIndex:1] integerValue] == 1 &&
                       [[[item exitPositions] objectAtIndex:2] integerValue] == 1) {
                if ((([[[prevItem exitPositions] objectAtIndex:0] integerValue] == 1)
                     || ([[[prevItem exitPositions] objectAtIndex:3] integerValue] == 1)) &&
                    (([[[nextItem exitPositions] objectAtIndex:0] integerValue] == 1)
                     || ([[[nextItem exitPositions] objectAtIndex:3] integerValue] == 1))) {
                        NSLog(@"OK");
                    } else {
                        return NO;
                    }
            } else if ([[[item exitPositions] objectAtIndex:2] integerValue] == 1 &&
                       [[[item exitPositions] objectAtIndex:3] integerValue] == 1) {
                if ((([[[prevItem exitPositions] objectAtIndex:0] integerValue] == 1)
                     || ([[[prevItem exitPositions] objectAtIndex:1] integerValue] == 1)) &&
                    (([[[nextItem exitPositions] objectAtIndex:0] integerValue] == 1)
                     || ([[[nextItem exitPositions] objectAtIndex:1] integerValue] == 1))) {
                        NSLog(@"OK");
                    } else {
                        return NO;
                    }
            } else if ([[[item exitPositions] objectAtIndex:0] integerValue] == 1 &&
                       [[[item exitPositions] objectAtIndex:3] integerValue] == 1) {
                if ((([[[prevItem exitPositions] objectAtIndex:1] integerValue] == 1)
                     || ([[[prevItem exitPositions] objectAtIndex:2] integerValue] == 1)) &&
                    (([[[nextItem exitPositions] objectAtIndex:1] integerValue] == 1)
                     || ([[[nextItem exitPositions] objectAtIndex:2] integerValue] == 1))) {
                        NSLog(@"OK");
                    } else {
                        return NO;
                    }
            }
        } else {
            return false;
        }
    }
    return YES;
}

- (void)setupControlItemsForGame:(NSUInteger)number {
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:15];
    
    if (number == 0) {
        GameItem *item = [[[self items] objectAtIndex:0] objectAtIndex:0];
        [items setObject:item atIndexedSubscript:0];
        
        item = [[[self items] objectAtIndex:1] objectAtIndex:0];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:1];
        
        item = [[[self items] objectAtIndex:1] objectAtIndex:1];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:2];
        
        item = [[[self items] objectAtIndex:0] objectAtIndex:1];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:3];
        
        item = [[[self items] objectAtIndex:0] objectAtIndex:2];
        [item setPipeType:LinePipe];
        [items setObject:item atIndexedSubscript:4];
        
        item = [[[self items] objectAtIndex:0] objectAtIndex:3];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:5];
        
        item = [[[self items] objectAtIndex:1] objectAtIndex:3];
        [item setPipeType:LinePipe];
        [items setObject:item atIndexedSubscript:6];
        
        item = [[[self items] objectAtIndex:2] objectAtIndex:3];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:7];
        
        item = [[[self items] objectAtIndex:2] objectAtIndex:2];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:8];
        
        item = [[[self items] objectAtIndex:3] objectAtIndex:2];
        [item setPipeType:LinePipe];
        [items setObject:item atIndexedSubscript:9];
        
        item = [[[self items] objectAtIndex:4] objectAtIndex:2];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:10];
        
        item = [[[self items] objectAtIndex:4] objectAtIndex:3];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:11];
        
        item = [[[self items] objectAtIndex:3] objectAtIndex:3];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:12];
        
        item = [[[self items] objectAtIndex:3] objectAtIndex:4];
        [item setPipeType:CurvedPipe];
        [items setObject:item atIndexedSubscript:13];
        
        item = [[[self items] objectAtIndex:4] objectAtIndex:4];
        [items setObject:item atIndexedSubscript:14];
    }
    
    _controlItems = [[NSArray alloc] initWithArray:items];
    
    [items release];
}

- (int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

- (void)dealloc
{
    [_controlItems release];
    [_items release];
    [super dealloc];
}

@end
