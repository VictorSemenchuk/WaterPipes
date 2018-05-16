//
//  GameViewController.m
//  WaterPipes
//
//  Created by Victor Macintosh on 15/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "GameViewController.h"
#import "Cell.h"
#import "LinePipeCell.h"
#import "CurvedPipeCell.h"
#import "Game.h"

@interface GameViewController () <CellProtocol>

@property (retain, nonatomic) UIView *gameAreaView;
@property (copy, nonatomic) NSArray *cells;
@property (retain, nonatomic) Game *game;
@property (assign, nonatomic) NSUInteger areaSize;

- (void)configureGameAreaForSize:(NSUInteger)size;
- (void)configureCellsWithSize:(CGSize)size and:(NSUInteger)cellsAmountPerRow;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor greenColor]];
    [self setTitle:@"Game"];
    
    NSUInteger areaSize = 5;
    _game = [[Game alloc] initForGame:0 withAreaSize:areaSize];
    [self configureGameAreaForSize:areaSize];
}

- (void)configureGameAreaForSize:(NSUInteger)size {
    
    CGFloat gameAreaSideSize = [[self view] bounds].size.width;
    CGRect gameAreaFrame = CGRectMake(0, [[self view] center].y - gameAreaSideSize / 2, gameAreaSideSize, gameAreaSideSize);
    CGFloat cellSideSize = gameAreaSideSize / size;
    CGSize cellSize = CGSizeMake(cellSideSize, cellSideSize);
    
    _gameAreaView = [[UIView alloc] initWithFrame:gameAreaFrame];
    [[self gameAreaView] setBackgroundColor:[UIColor purpleColor]];
    
    [[self view] addSubview:[self gameAreaView]];
    
    [self configureCellsWithSize:cellSize and:size];
}

- (void)configureCellsWithSize:(CGSize)size and:(NSUInteger)cellsAmountPerRow {
    NSMutableArray *cells = [[NSMutableArray alloc] initWithCapacity:cellsAmountPerRow];
    
    for (int i = 0; i < cellsAmountPerRow; i++) {
        NSMutableArray *currentRowCells = [[NSMutableArray alloc] initWithCapacity:cellsAmountPerRow];
        for (int j = 0; j < cellsAmountPerRow; j++) {
            GameItem *gameItem = [[[[self game] items] objectAtIndex:i] objectAtIndex:j];
            CGRect cellFrame = CGRectMake((size.width * j), (size.height * i), size.width, size.height);
            Cell *cell;
            if ([gameItem pipeType] == LinePipe) {
                cell = [[LinePipeCell alloc] initWithFrame:cellFrame andModelItem:gameItem];
            } else {
                cell = [[CurvedPipeCell alloc] initWithFrame:cellFrame andModelItem:gameItem];
            }
            [cell setDelegate:self];
            [[self gameAreaView] addSubview:cell];
            [currentRowCells setObject:cell atIndexedSubscript:j];
            [cell release];
        }
        [cells setObject:currentRowCells atIndexedSubscript:i];
        [currentRowCells release];
    }
    
    _cells = [[NSArray alloc] initWithArray:cells];
    [cells release];
}

- (void)cellWasRotated {
    if ([[self game] checkResult]) {
        NSLog(@"Win");
    } else {
        NSLog(@"Game process continues");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_gameAreaView release];
    [_cells release];
    [_game release];
    [super dealloc];
}

@end
