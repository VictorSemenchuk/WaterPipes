//
//  StartPipeCell.h
//  WaterPipes
//
//  Created by Victor Macintosh on 18/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"

@interface StartPipeCell : Cell

- (id)initWithFrame:(CGRect)frame andModelItem:(GameItem *)modelItem;
- (void)rotateValveWithCompletion:(void(^)(void))completion;

@end
