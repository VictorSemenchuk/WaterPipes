//
//  MatrixIndex.m
//  WaterPipes
//
//  Created by Victor Macintosh on 17/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "MatrixIndex.h"

@implementation MatrixIndex

- (id)initWithI:(NSUInteger)i andJ:(NSUInteger)j {
    self = [super init];
    if (self) {
        _i = i;
        _j = j;
    }
    return self;
}

@end
