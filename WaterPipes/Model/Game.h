//
//  Game.h
//  WaterPipes
//
//  Created by Victor Macintosh on 16/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameItem.h"
#import "MatrixIndex.h"

@interface Game : NSObject

@property (retain, nonatomic) NSArray *items;
@property (retain, nonatomic) NSMutableArray *controlItems;

- (id)initForGame:(NSUInteger)number withAreaSize:(NSUInteger)size;
- (BOOL)checkResult;
+ (int)getRandomNumberBetween:(int)from to:(int)to;

@end
