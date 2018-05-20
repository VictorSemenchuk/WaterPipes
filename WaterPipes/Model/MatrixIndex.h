//
//  MatrixIndex.h
//  WaterPipes
//
//  Created by Victor Macintosh on 17/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatrixIndex : NSObject

@property (assign, nonatomic) NSUInteger i;
@property (assign, nonatomic) NSUInteger j;

- (id)initWithI:(NSUInteger)i andJ:(NSUInteger)j;

@end
