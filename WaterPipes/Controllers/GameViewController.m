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

@interface GameViewController ()

@property (retain, nonatomic) UIView *gameAreaView;
@property (copy, nonatomic) NSArray *cells;

- (void)configureGameAreaForSize:(NSUInteger)size;
- (void)configureCellsWithSize:(CGSize)size and:(NSUInteger)cellsAmountPerRow;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor greenColor]];
    [self setTitle:@"Game"];
    
    [self configureGameAreaForSize:5];
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
    
    for (int i = 0; i < 2; i++) {
        NSMutableArray *currentRowCells = [[NSMutableArray alloc] initWithCapacity:cellsAmountPerRow];
        for (int j = 0; j < 1; j++) {
            CGRect cellFrame = CGRectMake((size.width * j), (size.height * i), size.width, size.height);
            Cell *cell;
            if (i == 0) {
                cell = [[LinePipeCell alloc] initWithFrame:cellFrame];
            } else {
                cell = [[CurvedPipeCell alloc] initWithFrame:cellFrame];
            }
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_gameAreaView release];
    [_cells release];
    [super dealloc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
