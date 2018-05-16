//
//  Cell.h
//  WaterPipes
//
//  Created by Victor Macintosh on 15/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameItem.h"

@protocol CellProtocol <NSObject>

- (void)cellWasRotated;

@end

@interface Cell : UIView

@property (weak, nonatomic) id<CellProtocol> delegate;
- (id)initWithFrame:(CGRect)frame andModelItem:(GameItem *)modelItem;

@end
