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
#import "StartPipeCell.h"
#import "EndPipeCell.h"
#import "Game.h"
#import "ResultsViewController.h"

@interface GameViewController () <CellProtocol>

@property (assign, nonatomic) UIView *gameAreaView;
@property (copy, nonatomic) NSArray *cells;
@property (retain, nonatomic) Game *game;
@property (assign, nonatomic) NSUInteger areaSize;
@property (assign, nonatomic) CGFloat gameAreaSideSize;
@property (assign, nonatomic) CGFloat gameAreaPadding;
@property (retain, nonatomic) UILabel *stepCountLabel;
@property (assign, nonatomic) NSUInteger stepCount;
@property (retain, nonatomic) UIButton *showResultsButton;
@property (assign, nonatomic) BOOL isTamerStarted;
@property (retain, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSUInteger ticks;

- (void)configureGameAreaForSize:(NSUInteger)size;
- (void)configureCellsWithAreaSize:(NSUInteger)cellsAmountPerRow;
- (void)setupControls;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *rootViewBGColor = [UIColor colorWithRed:233.0/255.0
                                               green:237.0/255.0
                                                blue:242.0/255.0
                                               alpha:255.0/255.0];
    [[self view] setBackgroundColor:rootViewBGColor];
    [self setTitle:@"Game"];
    
    self.areaSize = 5; //Cells amount in the row and column. So we will have game matrix 5x5
    self.gameAreaPadding = 0; //Padding of game area relative root view
    self.gameAreaSideSize = [[self view] bounds].size.width - [self gameAreaPadding] * 2; //Full side size of game area
    self.stepCount = 0;
    self.isTamerStarted = NO;
    self.ticks = 0;
    
    //Confiure matrix for cells
    [self configureGameAreaForSize:[self areaSize]];
    
    //Setup view contols
    [self setupControls];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Generate random number of available maps
    int gameNumber = [Game getRandomNumberBetween:0 to:2];
    
    //Init game
    self.game = [[Game alloc] initForGame:gameNumber
                         withAreaSize:[self areaSize]];
    
    //Confiure cells
    [self configureCellsWithAreaSize:[self areaSize]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //StopTimer
    [[self timer] invalidate];
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
    
    [[self gameAreaView] setUserInteractionEnabled:YES];
    [[self showResultsButton] setHidden:YES];
    [self setStepCount:0];
    [[self stepCountLabel] setText:[NSString stringWithFormat:@"Steps: %lu", [self stepCount]]];
    [self setIsTamerStarted:FALSE];
    [self setTicks:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

//MARK:- Configaration game area

- (void)configureGameAreaForSize:(NSUInteger)size {
 
    CGRect gameAreaFrame = CGRectMake([self gameAreaPadding],
                                      [[self view] center].y - [self gameAreaSideSize] / 2 + [self gameAreaPadding],
                                      [self gameAreaSideSize],
                                      [self gameAreaSideSize]); //Frame for game area matria
    UIColor *gameAreaViewBGColor = [UIColor clearColor];
    
    UIView *view = [[UIView alloc] initWithFrame:gameAreaFrame]; //Init view area where we will place cells
    [view setBackgroundColor:gameAreaViewBGColor];
    [[view layer] setCornerRadius:0.0];
    [view setClipsToBounds:YES];
    
    [[self view] addSubview:view];
    self.gameAreaView = view;
}

- (void)configureCellsWithAreaSize:(NSUInteger)cellsAmountPerRow {
    
    CGFloat cellSideSize = [self gameAreaSideSize] / cellsAmountPerRow; //Length for single cell side in game matrix
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
            if ([gameItem pipeType] == StartPipe) {
                cell = [[StartPipeCell alloc] initWithFrame:cellFrame
                                              andModelItem:gameItem];
            } else if ([gameItem pipeType] == EndPipe) {
                cell = [[EndPipeCell alloc] initWithFrame:cellFrame
                                               andModelItem:gameItem];
            } else if ([gameItem pipeType] == LinePipe) {
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
    
    self.cells = [cells copy];
    [cells release];
}

//MARK:- CellProtocol mathods that fires when user touches at cell (and cell rotates)

- (void)cellWasRotated {
    
    //If timer is not working yet then start timer
    if (![self isTamerStarted]) {
        [self setIsTamerStarted:YES];
        self.timer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES] retain];
    }
    
    BOOL result = [[self game] checkResult]; //fires methods for check answer chain true way
    if (result) {
        NSLog(@"Win");
        
        MatrixIndex *startIndex = [[self game] controlItems][0];
        StartPipeCell *startPipeCell = [self cells][startIndex.i][startIndex.j];
        UIColor *waterColor = [UIColor colorWithRed:85.0/255.0
                                                   green:189.0/255.0
                                                    blue:211.0/255.0
                                                   alpha:255.0/255.0];
        
        //Stop user interaction with game area
        [[self gameAreaView] setUserInteractionEnabled:NO];
        
        //Rotate water valve
        [startPipeCell rotateValveWithCompletion:^{
            //Fill pipes by water
            for (int k = 0; k < [[[self game] controlItems] count]; k++) {
                MatrixIndex *currentItemIndex = [[self game] controlItems][k];
                Cell *currentItem = [self cells][currentItemIndex.i][currentItemIndex.j];
                [currentItem setBackgroundColor:waterColor];
            }
            //Showing results button
            [[self showResultsButton] setHidden:NO];
        }];
    } else {
        NSLog(@"Game process continues");
        [self setStepCount:[self stepCount] + 1];
        [[self stepCountLabel] setText:[NSString stringWithFormat:@"Steps: %lu", [self stepCount]]];
    }
}

//MARK:- Setup controls

- (void)setupControls {
    UIColor *color = [UIColor colorWithRed:85.0/255.0
                                         green:189.0/255.0
                                          blue:211.0/255.0
                                         alpha:255.0/255.0];
    
    //Counter label
    
    CGFloat labelHeight = 20;
    CGRect labelFrame = CGRectMake(16, [[self gameAreaView] frame].origin.y - labelHeight - 20, [[self view] frame].size.width - 32, labelHeight);
    
    UILabel *counterLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [counterLabel setText:[NSString stringWithFormat:@"Steps: %lu", [self stepCount]]];
    [counterLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [counterLabel setTextColor:color];
    [self setStepCountLabel:counterLabel];
    [[self view] addSubview:[self stepCountLabel]];
    [counterLabel release];
    
    //Show results button
    
    CGRect buttonFrame = CGRectMake(0, 0, 150, 40);
    CGFloat rootViewHeight = [[self view] frame].size.height;
    CGFloat buttonCenterY = rootViewHeight - (rootViewHeight - ([[self gameAreaView] frame].origin.y + [[self gameAreaView] frame].size.height)) / 2;
    
    UIButton *resultsButton = [[UIButton alloc] initWithFrame:buttonFrame];
    [resultsButton setCenter:CGPointMake([[self view] center].x, buttonCenterY)];
    [resultsButton setTitle:@"Show results" forState:UIControlStateNormal];
    [[resultsButton titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [[resultsButton layer] setCornerRadius:3.0];
    [resultsButton setBackgroundColor:color];
    [self setShowResultsButton:resultsButton];
    [[self view] addSubview:[self showResultsButton]];
    [self.showResultsButton setHidden:YES];
    [self.showResultsButton addTarget:self action:@selector(showResults) forControlEvents:UIControlEventTouchUpInside];
    [resultsButton release];
    
}

//MARK:- Selectors

- (void)showResults {
    ResultsViewController *resultVC = [[ResultsViewController alloc] init];
    [resultVC setStepsCount:[self stepCount]];
    [resultVC setGameTime:[self ticks]];
    
    [[self navigationController] pushViewController:resultVC animated:YES];
    [resultVC release];
}

- (void)timerTick:(NSTimer *)timer {
    [self setTicks:[self ticks] + 1];
}

//MARK:- Deallocating

- (void)dealloc
{
    _gameAreaView = nil;
    [_cells release];
    [_game release];
    [_stepCountLabel release];
    [_showResultsButton release];
    [_timer release];
    [super dealloc];
}

@end
