//
//  StartController.m
//  WaterPipes
//
//  Created by Victor Macintosh on 15/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "StartController.h"
#import "GameViewController.h"

@interface StartController ()

@end

@implementation StartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor redColor]];
    [self setTitle:@"Start"];
    
    UIButton *playButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [playButton setCenter:CGPointMake([[self view] center].x, [[self view] center].y)];
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    [playButton setBackgroundColor:[UIColor greenColor]];
    [playButton addTarget:self action:@selector(pushNextController:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:playButton];
    
    [playButton release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushNextController:(UIButton *)sender {
    GameViewController *gameVC = [[GameViewController alloc] init];
    [[self navigationController] pushViewController:gameVC animated:true];
    [gameVC release];
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
