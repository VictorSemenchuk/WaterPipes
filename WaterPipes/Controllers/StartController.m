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
#import "LinePipeCell.h"

@interface StartController ()

@end

@implementation StartController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Menu"];
    
#pragma mark - Buttons -
    UIButton *resultsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
    [resultsButton setTitle:@"R E S U L T S" forState:UIControlStateNormal];
    resultsButton.tag = 1;
    resultsButton.translatesAutoresizingMaskIntoConstraints = NO;
    [resultsButton setBackgroundColor:[UIColor cyanColor]];
    [resultsButton addTarget:self action:@selector(clickResultButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    [startButton setCenter:CGPointMake([[self view] center].x, [[self view] center].y)];
    [startButton setTitle:@"S T A R T" forState:UIControlStateNormal];
    startButton.tag = 2;
    [startButton setBackgroundColor:[UIColor cyanColor]];
    [startButton addTarget:self action:@selector(pushNextController:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *aboutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    [aboutButton setTitle:@"A B O U T" forState:UIControlStateNormal];
    aboutButton.tag = 3;
    aboutButton.translatesAutoresizingMaskIntoConstraints = NO;
    [aboutButton setBackgroundColor:[UIColor cyanColor]];
    [aboutButton addTarget:self action:@selector(alertActionButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: resultsButton];
    [self.view addSubview: startButton];
    [self.view addSubview: aboutButton];
    
    NSLayoutConstraint *resultsButtonPosition = [NSLayoutConstraint constraintWithItem:
                                                 resultsButton
                                                                             attribute: NSLayoutAttributeBottom
                                                                             relatedBy: NSLayoutRelationEqual
                                                 
                                                                                toItem: startButton
                                                                             attribute: NSLayoutAttributeBottom
                                                                            multiplier: 1.0f
                                                                              constant: 40.0f
                                                 ];
    NSLayoutConstraint *aboutButtonPosition = [NSLayoutConstraint constraintWithItem:
                                               aboutButton
                                                                           attribute: NSLayoutAttributeBottom
                                                                           relatedBy: NSLayoutRelationEqual
                                               
                                                                              toItem: resultsButton
                                                                           attribute: NSLayoutAttributeBottom
                                                                          multiplier: 1.0f
                                                                            constant: 40.0f
                                               ];
    NSLayoutConstraint *pinToLeftResultsButton = [NSLayoutConstraint constraintWithItem:
                                                  resultsButton
                                                                              attribute: NSLayoutAttributeLeading
                                                                              relatedBy: NSLayoutRelationEqual
                                                  
                                                                                 toItem: startButton
                                                                              attribute: NSLayoutAttributeLeading
                                                                             multiplier: 1.0f
                                                                               constant: 12.0f
                                                  ];
    NSLayoutConstraint *pinToLeftAboutButton = [NSLayoutConstraint constraintWithItem:
                                                aboutButton
                                                                            attribute: NSLayoutAttributeLeading
                                                                            relatedBy: NSLayoutRelationEqual
                                                
                                                                               toItem: resultsButton
                                                                            attribute: NSLayoutAttributeLeading
                                                                           multiplier: 1.0f
                                                                             constant: 13.0f
                                                ];
    [self.view addConstraints:@[resultsButtonPosition,pinToLeftResultsButton,aboutButtonPosition,pinToLeftAboutButton]];
    
    
#pragma mark - Labels -
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 40)];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = @" WaterPipes";
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:50]];
    titleLabel.textColor = [UIColor blueColor];
    
    UILabel *teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    teamLabel.translatesAutoresizingMaskIntoConstraints = NO;
    teamLabel.text = @"   WaterPipes Team";
    [teamLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    teamLabel.textColor = [UIColor lightGrayColor];
    
    UILabel *memberOne = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberOne.translatesAutoresizingMaskIntoConstraints = NO;
    memberOne.text = @"   Aliaksei Yelin";
    [memberOne setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberOne.textColor = [UIColor lightGrayColor];
    UILabel *memberTwo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberTwo.translatesAutoresizingMaskIntoConstraints = NO;
    memberTwo.text = @"Victor Semenchuk";
    [memberTwo setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberTwo.textColor = [UIColor lightGrayColor];
    UILabel *memberThree = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberThree.translatesAutoresizingMaskIntoConstraints = NO;
    memberThree.text = @"Mark Velichko      ";
    [memberThree setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberThree.textColor = [UIColor lightGrayColor];
    UILabel *memberFour = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberFour.translatesAutoresizingMaskIntoConstraints = NO;
    memberFour.text = @"Elizaveta Shulskaya ";
    [memberFour setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberFour.textColor = [UIColor lightGrayColor];
    
    
    [self.view addSubview:titleLabel];
    [self.view addSubview:teamLabel];
    [self.view addSubview:memberOne];
    [self.view addSubview:memberTwo];
    [self.view addSubview:memberThree];
    [self.view addSubview:memberFour];
    
    
    NSLayoutConstraint *titleLabelPosition = [NSLayoutConstraint constraintWithItem:
                                              titleLabel
                                                                          attribute: NSLayoutAttributeBottom
                                                                          relatedBy: NSLayoutRelationEqual
                                              
                                                                             toItem: startButton
                                                                          attribute: NSLayoutAttributeBottom
                                                                         multiplier: 1.0f
                                                                           constant: -60.0f
                                              ];
    NSLayoutConstraint *pinToLeftTitleLabel = [NSLayoutConstraint constraintWithItem:
                                               titleLabel
                                                                           attribute: NSLayoutAttributeLeading
                                                                           relatedBy: NSLayoutRelationEqual
                                               
                                                                              toItem: startButton
                                                                           attribute: NSLayoutAttributeLeading
                                                                          multiplier: 1.0f
                                                                            constant: -75.0f
                                               ];
    NSLayoutConstraint *teamLabelPosition = [NSLayoutConstraint constraintWithItem:
                                             teamLabel
                                                                         attribute: NSLayoutAttributeBottom
                                                                         relatedBy: NSLayoutRelationEqual
                                             
                                                                            toItem: aboutButton
                                                                         attribute: NSLayoutAttributeBottom
                                                                        multiplier: 1.0f
                                                                          constant: 105.0f
                                             ];
    NSLayoutConstraint *pinToLeftTeamLabel = [NSLayoutConstraint constraintWithItem:
                                              teamLabel
                                                                          attribute: NSLayoutAttributeLeading
                                                                          relatedBy: NSLayoutRelationEqual
                                              
                                                                             toItem: aboutButton
                                                                          attribute: NSLayoutAttributeLeading
                                                                         multiplier: 1.0f
                                                                           constant: -35.0f
                                              ];
    NSLayoutConstraint *memberOnePosition = [NSLayoutConstraint constraintWithItem:
                                             memberOne
                                                                         attribute: NSLayoutAttributeBottom
                                                                         relatedBy: NSLayoutRelationEqual
                                             
                                                                            toItem: aboutButton
                                                                         attribute: NSLayoutAttributeBottom
                                                                        multiplier: 1.0f
                                                                          constant: 120.0f
                                             ];
    NSLayoutConstraint *pinToLeftMemberOne = [NSLayoutConstraint constraintWithItem:
                                              memberOne
                                                                          attribute: NSLayoutAttributeLeading
                                                                          relatedBy: NSLayoutRelationEqual
                                              
                                                                             toItem: self.view
                                                                          attribute: NSLayoutAttributeLeading
                                                                         multiplier: 1.0f
                                                                           constant: 20.0f
                                              ];
    NSLayoutConstraint *memberTwoPosition = [NSLayoutConstraint constraintWithItem:
                                             memberTwo
                                                                         attribute: NSLayoutAttributeBottom
                                                                         relatedBy: NSLayoutRelationEqual
                                             
                                                                            toItem: aboutButton
                                                                         attribute: NSLayoutAttributeBottom
                                                                        multiplier: 1.0f
                                                                          constant: 135.0f
                                             ];
    NSLayoutConstraint *pinToLeftMemberTwo = [NSLayoutConstraint constraintWithItem:
                                              memberTwo
                                                                          attribute: NSLayoutAttributeLeading
                                                                          relatedBy: NSLayoutRelationEqual
                                              
                                                                             toItem: self.view
                                                                          attribute: NSLayoutAttributeLeading
                                                                         multiplier: 1.0f
                                                                           constant: 20.0f
                                              ];
    NSLayoutConstraint *memberThreePosition = [NSLayoutConstraint constraintWithItem:
                                               memberThree
                                                                           attribute: NSLayoutAttributeBottom
                                                                           relatedBy: NSLayoutRelationEqual
                                               
                                                                              toItem: aboutButton
                                                                           attribute: NSLayoutAttributeBottom
                                                                          multiplier: 1.0f
                                                                            constant: 120.0f
                                               ];
    NSLayoutConstraint *pinToRightMemberThree = [NSLayoutConstraint constraintWithItem:
                                                 memberThree
                                                                             attribute: NSLayoutAttributeTrailing
                                                                             relatedBy: NSLayoutRelationEqual
                                                 
                                                                                toItem: self.view
                                                                             attribute: NSLayoutAttributeTrailing
                                                                            multiplier: 1.0f
                                                                              constant: -20.0f
                                                 ];
    NSLayoutConstraint *memberFourPosition = [NSLayoutConstraint constraintWithItem:
                                              memberFour
                                                                          attribute: NSLayoutAttributeBottom
                                                                          relatedBy: NSLayoutRelationEqual
                                              
                                                                             toItem: aboutButton
                                                                          attribute: NSLayoutAttributeBottom
                                                                         multiplier: 1.0f
                                                                           constant: 135.0f
                                              ];
    NSLayoutConstraint *pinToRightMemberFour = [NSLayoutConstraint constraintWithItem:
                                                memberFour
                                                                            attribute: NSLayoutAttributeTrailing
                                                                            relatedBy: NSLayoutRelationEqual
                                                
                                                                               toItem: self.view
                                                                            attribute: NSLayoutAttributeTrailing
                                                                           multiplier: 1.0f
                                                                             constant: -20.0f
                                                ];
    
    [self.view addConstraints:@[titleLabelPosition, pinToLeftTitleLabel, teamLabelPosition, pinToLeftTeamLabel, memberOnePosition,
                                pinToLeftMemberOne,memberTwoPosition, pinToLeftMemberTwo,memberThreePosition, pinToRightMemberThree,
                                memberFourPosition, pinToRightMemberFour]];
    
    
#pragma mark - Logo -
    UIView *logo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    logo.backgroundColor = [UIColor cyanColor];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    LinePipeCell *linePipeLogo = [[LinePipeCell alloc] initWithFrame:(CGRectMake(0, 0, [logo frame].size.width, [logo frame].size.height))];
    [logo addSubview:linePipeLogo];
    [self.view addSubview:logo];
    
    NSLayoutConstraint *leftLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:90];
    NSLayoutConstraint *rightLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-90];
    NSLayoutConstraint *topLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeTop multiplier:1 constant:-100];
    NSLayoutConstraint *heightLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:90];
    NSLayoutConstraint *widthLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    
    [self.view addConstraints:@[leftLogo,rightLogo,topLogo]];
    [logo addConstraints:@[heightLogo, widthLogo]];
    
    
#pragma mark - Releasing -
    [resultsButton release];
    [startButton release];
    [aboutButton release];
    [titleLabel release];
    [teamLabel release];
    [memberOne release];
    [memberTwo release];
    [memberThree release];
    [memberFour release];
    [logo release];
    [linePipeLogo release];
    
}

- (void)alertActionButton: (UIAlertController *)alert {
    UIAlertController *alertButton = [UIAlertController alertControllerWithTitle:@"TEAM №3 TASK" message:@"We created a game about plumbers😃 containing three viewController's (1.StartView 2.GameField 3.ResultsView). Used MRC and all drew by hand, without storyboard." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"GOOD JOB!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                         {
                         }];
    [alertButton addAction:ok];
    [self presentViewController:alertButton animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
