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
#import <QuartzCore/QuartzCore.h>
#import "LogoClassView.h"

@interface StartController ()

@end

@implementation StartController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Menu"];
    
#pragma mark - Colors -
    UIColor *myBlue = [[UIColor alloc] initWithRed:58/255.f green:131/255.f blue:255/255.f alpha:1];
    UIColor *lightBlue = [[UIColor alloc] initWithRed:216/255.f green:224/255.f blue:246/255.f alpha:1];
    UIColor *lightGray = [[UIColor alloc] initWithRed:178/255.f green:183/255.f blue:187/255.f alpha:1];
    UIColor *background = [[UIColor alloc] initWithRed:233.0/255.0 green:237.0/255.0 blue:242.0/255.0 alpha:255.0/255.0];
    UIColor *naivyBlue = [[UIColor alloc] initWithRed:169/255.f green:183/255.f blue:212/255.f alpha:1];
    
    [[self view] setBackgroundColor:background];
    
#pragma mark - Buttons -
    CGRect frame = CGRectMake(0, 0, 130, 40);
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.layer.cornerRadius = 10;
    startButton.clipsToBounds = YES;
    startButton.frame = frame;
    [startButton setCenter:CGPointMake([[self view] center].x, [[self view] center].y +30)];
    [startButton setTitle:@"S T A R T" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    startButton.tag = 2;
    [startButton setBackgroundColor:lightBlue];
    [startButton addTarget:self action:@selector(pushNextController:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *aboutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    aboutButton.layer.cornerRadius = 10;
    aboutButton.clipsToBounds = YES;
    aboutButton.frame = frame;
    [aboutButton setTitle:@"    A B O U T    " forState:UIControlStateNormal];
    [aboutButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    aboutButton.tag = 3;
    aboutButton.translatesAutoresizingMaskIntoConstraints = NO;
    [aboutButton setBackgroundColor:lightBlue];
    [aboutButton addTarget:self action:@selector(alertActionButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: startButton];
    [self.view addSubview: aboutButton];
    
    NSLayoutConstraint *aboutButtonPosition = [NSLayoutConstraint constraintWithItem:
                                               aboutButton
                                                                           attribute: NSLayoutAttributeBottom
                                                                           relatedBy: NSLayoutRelationEqual
                                               
                                                                              toItem: startButton
                                                                           attribute: NSLayoutAttributeBottom
                                                                          multiplier: 1.0f
                                                                            constant: 35.0f
                                               ];
    
    NSLayoutConstraint *pinToLeftAboutButton = [NSLayoutConstraint constraintWithItem:
                                                aboutButton
                                                                            attribute: NSLayoutAttributeLeading
                                                                            relatedBy: NSLayoutRelationEqual
                                                
                                                                               toItem: startButton
                                                                            attribute: NSLayoutAttributeLeading
                                                                           multiplier: 1.0f
                                                                             constant: 15.5f
                                                ];
    [self.view addConstraints:@[aboutButtonPosition,pinToLeftAboutButton]];
    
#pragma mark - Labels -
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 40)];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.attributedText = [[[NSAttributedString alloc] initWithString:@" WaterPipes" attributes:@{ NSStrokeColorAttributeName : naivyBlue, NSForegroundColorAttributeName : lightBlue, NSStrokeWidthAttributeName : @-3.5 }] autorelease];
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:50]];
   
    UILabel *teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    teamLabel.translatesAutoresizingMaskIntoConstraints = NO;
    teamLabel.text = @"   WaterPipes Team";
    [teamLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    teamLabel.textColor = [UIColor blackColor];
    
    UILabel *memberOne = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberOne.translatesAutoresizingMaskIntoConstraints = NO;
    memberOne.text = @"   Aliaksei Yelin";
    [memberOne setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberOne.textColor = [UIColor blackColor];
    UILabel *memberTwo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberTwo.translatesAutoresizingMaskIntoConstraints = NO;
    memberTwo.text = @"Victor Semenchuk";
    [memberTwo setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberTwo.textColor = [UIColor blackColor];
    UILabel *memberThree = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberThree.translatesAutoresizingMaskIntoConstraints = NO;
    memberThree.text = @"Mark Velichko      ";
    [memberThree setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberThree.textColor = [UIColor blackColor];
    UILabel *memberFour = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 40)];
    memberFour.translatesAutoresizingMaskIntoConstraints = NO;
    memberFour.text = @"Elizaveta Shulskaya ";
    [memberFour setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    memberFour.textColor = [UIColor blackColor];
    
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
                                                                           constant: -50.0f
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
                                                                          constant: 135.0f
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
                                                                          constant: 150.0f
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
                                                                          constant: 165.0f
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
                                                                            constant: 150.0f
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
                                                                           constant: 165.0f
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
    UIView *logo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 120)];
    logo.backgroundColor = background;
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    LogoClassView *logoView = [[LogoClassView alloc] initWithFrame:(CGRectMake(-25, -15, [logo frame].size.width, [logo frame].size.height))];
    logoView.backgroundColor = background;
    [logo addSubview:logoView];
    [self.view addSubview:logo];
    
    NSLayoutConstraint *leftLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:90];
    NSLayoutConstraint *rightLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-90];
    NSLayoutConstraint *topLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeTop multiplier:1 constant:-100];
    NSLayoutConstraint *heightLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:90];
    NSLayoutConstraint *widthLogo = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    
    [self.view addConstraints:@[leftLogo,rightLogo,topLogo]];
    [logo addConstraints:@[heightLogo, widthLogo]];
    
#pragma mark - Releasing -
    [startButton release];
    [aboutButton release];
    [titleLabel release];
    [teamLabel release];
    [memberOne release];
    [memberTwo release];
    [memberThree release];
    [memberFour release];
    [logo release];
    [logoView release];
    [lightGray release];
    [lightBlue release];
    [naivyBlue release];
    [background release];
    [myBlue release];
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
