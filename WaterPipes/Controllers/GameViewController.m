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
#import "ResultsViewController.h"

@interface GameViewController () <CellProtocol>

@property (retain, nonatomic) UIView *gameAreaView;
@property (copy, nonatomic) NSArray *cells;
@property (retain, nonatomic) Game *game;
@property (assign, nonatomic) NSUInteger areaSize;

- (void)configureGameAreaForSize:(NSUInteger)size;
- (void)configureCellsWithAreaSize:(NSUInteger)cellsAmountPerRow;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor greenColor]];
    [self setTitle:@"Game"];
    
    _areaSize = 5; //Cells amount in the row and column. So we will have game matrix 5x5
    
    //Confiure matrix for cells
    [self configureGameAreaForSize:[self areaSize]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Generate random number of available maps
    int gameNumber = [Game getRandomNumberBetween:0 to:2];
    
    //Init game
    _game = [[Game alloc] initForGame:gameNumber
                         withAreaSize:[self areaSize]];
    
    //Confiure cells
    [self configureCellsWithAreaSize:[self areaSize]];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    //Remove current cell views from cuperview
    //to generate new game when user will return again
    for (NSArray *cellsRow in [self cells]) {
        for (Cell *cell in cellsRow) {
            [cell removeFromSuperview];
        }
    }
}

//MARK:- Configaration game area

- (void)configureGameAreaForSize:(NSUInteger)size {

    CGFloat gameAreaSideSize = [[self view] bounds].size.width; //Side size for game area
    CGRect gameAreaFrame = CGRectMake(0,
                                      [[self view] center].y - gameAreaSideSize / 2,
                                      gameAreaSideSize,
                                      gameAreaSideSize); //Frame for game area matria
    
    _gameAreaView = [[UIView alloc] initWithFrame:gameAreaFrame]; //Init view area where we will place cells
    [[self gameAreaView] setBackgroundColor:[UIColor purpleColor]];
    [[self view] addSubview:[self gameAreaView]];
}

- (void)configureCellsWithAreaSize:(NSUInteger)cellsAmountPerRow {
    
    CGFloat gameAreaSideSize = [[self view] bounds].size.width; //Side size for game area
    CGFloat cellSideSize = gameAreaSideSize / cellsAmountPerRow; //Length for single cell side in game matrix
    CGSize cellSize = CGSizeMake(cellSideSize, cellSideSize); //Size for single cell
    
    NSMutableArray *cells = [[NSMutableArray alloc] initWithCapacity:cellsAmountPerRow];
    
    for (int i = 0; i < cellsAmountPerRow; i++) {
        NSMutableArray *currentRowCells = [[NSMutableArray alloc] initWithCapacity:cellsAmountPerRow];
        for (int j = 0; j < cellsAmountPerRow; j++) {
            GameItem *gameItem = [[self game] items][i][j];
            
            //Calculate origin coordinates and set frame for current cell
            CGRect cellFrame = CGRectMake((cellSize.width * j),
                                          (cellSize.height * i),
                                          cellSize.width,
                                          cellSize.height);
            
            Cell *cell;
            //Creating cell particular pipe type cell objects
            if ([gameItem pipeType] == LinePipe) {
                cell = [[LinePipeCell alloc] initWithFrame:cellFrame
                                              andModelItem:gameItem];
            } else {
                cell = [[CurvedPipeCell alloc] initWithFrame:cellFrame
                                                andModelItem:gameItem];
            }
            [cell setDelegate:self];
            [[self gameAreaView] addSubview:cell];
            
            //Set cell at particular index at array
            [currentRowCells setObject:cell atIndexedSubscript:j];
            [cell release];
        }
        
        //Set column array to matrix at current row
        [cells setObject:currentRowCells atIndexedSubscript:i];
        [currentRowCells release];
    }
    
    _cells = [[NSArray alloc] initWithArray:cells];
    [cells release];
}

//MARK:- CellProtocol mathods that fires when user touches at cell (and cell rotates)

- (void)cellWasRotated {
    BOOL result = [[self game] checkResult]; //fires methods for check answer chain true way
    if (result) {
        NSLog(@"Win");
        //Show alert controller if user won
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Wow"
                                                                       message:@"You win"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK!"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction * _Nonnull action) {
            //Pushing result view controller for showing game results
            ResultsViewController *resultVC = [[ResultsViewController alloc] init];
            [[self navigationController] pushViewController:resultVC animated:YES];
            [resultVC release];
        }];
        [alert addAction:alertAction];
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    } else {
        NSLog(@"Game process continues");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:- Deallocating
- (void)dealloc
{
    [_gameAreaView release];
    [_cells release];
    [_game release];
    [super dealloc];
}

@end
