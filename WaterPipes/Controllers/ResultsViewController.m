//
//  ResultsViewController.m
//  WaterPipes
//
//  Created by Victor Macintosh on 15/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@property (retain, nonatomic) UILabel *stepsCountLabel;
@property (retain, nonatomic) UILabel *timeLabel;

- (void)setupControls;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *rootViewBGColor = [UIColor colorWithRed:233.0/255.0
                                               green:237.0/255.0
                                                blue:242.0/255.0
                                               alpha:255.0/255.0];
    [[self view] setBackgroundColor:rootViewBGColor];
    [self setTitle:@"Results"];
    
    [self setupControls];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:- Setup controls

- (void)setupControls {
    UIColor *color = [UIColor colorWithRed:85.0/255.0
                                     green:189.0/255.0
                                      blue:211.0/255.0
                                     alpha:255.0/255.0];
    CGFloat labelHeight = 20.0;
    CGFloat labelWidth = 100;
    CGFloat sidePadding = 16.0;
    UIFont *boldFont = [UIFont fontWithName:@"Helvetica-Bold" size:labelHeight];
    UIFont *regularFont = [UIFont fontWithName:@"Helvetica" size:labelHeight];
    
    //Steps section
    CGFloat yValue = 110;
    
    CGRect stepsCountTitleLabelFrame = CGRectMake(sidePadding, yValue, 70, labelHeight);
    UILabel *stepsCountTitleLabel = [[UILabel alloc] initWithFrame:stepsCountTitleLabelFrame];
    [stepsCountTitleLabel setText:@"Steps:"];
    [stepsCountTitleLabel setFont:regularFont];
    [stepsCountTitleLabel setTextColor:color];
    [[self view] addSubview:stepsCountTitleLabel];
    [stepsCountTitleLabel release];
    
    CGRect stepsCountLabelFrame = CGRectMake([[self view] frame].size.width - labelWidth - sidePadding, yValue, labelWidth, labelHeight);
    UILabel *stepsCountLabel = [[UILabel alloc] initWithFrame:stepsCountLabelFrame];
    [stepsCountLabel setText:[NSString stringWithFormat:@"%lu", [self stepsCount]]];
    [stepsCountLabel setFont:boldFont];
    [stepsCountLabel setTextColor:color];
    [stepsCountLabel setTextAlignment:NSTextAlignmentRight];
    [self setStepsCountLabel:stepsCountLabel];
    [[self view] addSubview:[self stepsCountLabel]];
    [stepsCountLabel release];
    
    //Time section
    yValue = 150;
    
    CGRect timeTitleLabelFrame = CGRectMake(sidePadding, yValue, 70, labelHeight);
    UILabel *timeTitleLabel = [[UILabel alloc] initWithFrame:timeTitleLabelFrame];
    [timeTitleLabel setText:@"Time:"];
    [timeTitleLabel setFont:regularFont];
    [timeTitleLabel setTextColor:color];
    [[self view] addSubview:timeTitleLabel];
    [timeTitleLabel release];
    
    CGRect timeLabelFrame = CGRectMake([[self view] frame].size.width - labelWidth - sidePadding, yValue, labelWidth, labelHeight);
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:timeLabelFrame];
    [timeLabel setText:[NSString stringWithFormat:@"%lu sec", [self gameTime]]];
    [timeLabel setFont:boldFont];
    [timeLabel setTextColor:color];
    [timeLabel setTextAlignment:NSTextAlignmentRight];
    [self setTimeLabel:timeLabel];
    [[self view] addSubview:[self timeLabel]];
    [timeLabel release];
}

//MARK:- Deallocating

- (void)dealloc
{
    [_stepsCountLabel release];
    [_timeLabel release];
    [super dealloc];
}

@end
