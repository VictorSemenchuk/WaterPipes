//
//  StartController.m
//  WaterPipes
//
//  Created by Victor Macintosh on 15/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "StartController.h"
#import "GameViewController.h"
#import "ResultsViewController.h"

@interface StartController ()

@end

@implementation StartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Menu"];
    
#pragma mark - Logo -
    UIView *logo = [UIView new];
    logo.backgroundColor = [UIColor lightGrayColor];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:logo];
    
    NSLayoutConstraint *leftLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:90];
    NSLayoutConstraint *rightLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-90];
    NSLayoutConstraint *topLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:90];
    NSLayoutConstraint *heightLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:90];
    NSLayoutConstraint *widthLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    
    [self.view addConstraints:@[leftLogo,rightLogo,topLogo]];
    [logo addConstraints:@[heightLogo, widthLogo]];
    
#pragma mark - Buttons -
    UIButton *playButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    [playButton setCenter:CGPointMake([[self view] center].x, [[self view] center].y)];
    [playButton setTitle:@"START GAME" forState:UIControlStateNormal];
    [playButton setBackgroundColor:[UIColor cyanColor]];
    [playButton addTarget:self action:@selector(pushNextController:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:playButton];
    
    UIButton *resultButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    [resultButton setCenter:CGPointMake([[self view] center].x, 335)];
    [resultButton setTitle:@"RESULTS" forState:UIControlStateNormal];
    [resultButton setBackgroundColor: [UIColor cyanColor]];
    [resultButton addTarget:self action:@selector(clickResultButton:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:resultButton];
    
#pragma mark - Labels -
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 40)];
    [titleLabel setCenter:CGPointMake([[self view] center].x,235)];
    titleLabel.text = @" WaterPipes";
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:38]];
    titleLabel.textColor = [UIColor cyanColor];
    [[self view] addSubview:titleLabel];
    
    UILabel *teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    [teamLabel setCenter:CGPointMake([[self view] center].x,440)];
    teamLabel.text = @"   WaterPipes Team";
    [teamLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    teamLabel.textColor = [UIColor lightGrayColor];
    [[self view] addSubview:teamLabel];
    
    UILabel *teamNumbers = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    [teamNumbers setCenter:CGPointMake([[self view] center].x,490)];
    teamNumbers.lineBreakMode = NSLineBreakByWordWrapping;
    teamNumbers.numberOfLines = 0;
    teamNumbers.text = @"Elizaveta Shulskaya                  Victor Semenchuk Aliaksei Yelin                             Mark Velichko";
    [teamNumbers setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    teamNumbers.textColor = [UIColor lightGrayColor];
    [[self view] addSubview:teamNumbers];
    
    
#pragma mark - Releasing -
    [playButton release];
    [resultButton release];
    [teamLabel release];
    [titleLabel release];
    [teamNumbers release];
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)pushNextController:(UIButton *)sender {
    GameViewController *gameVC = [[GameViewController alloc] init];
    [[self navigationController] pushViewController:gameVC animated:true];
    [gameVC release];
}

- (void)clickResultButton:(UIButton *)sender {
    ResultsViewController *resultsVC = [[ResultsViewController alloc] init];
    [[self navigationController] pushViewController:resultsVC animated:true];
    [resultsVC release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
