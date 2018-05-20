//
//  LogoClassView.m
//  WaterPipes
//
//  Created by LESHA on 5/20/18.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "LogoClassView.h"
#import "StartController.h"

@implementation LogoClassView


- (void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //scale
    CGFloat height = self.bounds.size.height;
    
    CGFloat scale = height/200;
    //colors
    CGColorRef deepBlue = [UIColor colorWithRed:10/255.f green:66/255.f blue:145/255.f alpha:1].CGColor;
    CGColorRef lighBlue = [UIColor colorWithRed:15/255.f green:163/255.f blue:225/255.f alpha:1].CGColor;
    CGColorRef lighGray = [UIColor colorWithRed:178/255.f green:183/255.f blue:187/255.f alpha:1].CGColor;

    //First Pipe
    CGContextSetFillColorWithColor(context, lighGray);
    CGContextMoveToPoint(context, 18*scale, 22*scale);
    CGContextAddLineToPoint(context, 18*scale, 18*scale);
    CGContextAddLineToPoint(context, 35*scale, 18*scale);
    CGContextAddLineToPoint(context, 35*scale, 22*scale);
    CGContextAddLineToPoint(context, 80*scale, 22*scale);
    CGContextAddLineToPoint(context, 100*scale, 42*scale);
    CGContextAddLineToPoint(context, 100*scale, 146*scale);
    CGContextAddLineToPoint(context, 137*scale, 146*scale);
    CGContextAddLineToPoint(context, 141*scale, 142*scale);
    CGContextAddLineToPoint(context, 141*scale, 133*scale);
    CGContextAddLineToPoint(context, 135*scale, 133*scale);
    CGContextAddLineToPoint(context, 135*scale, 100*scale);
    CGContextAddLineToPoint(context, 175*scale, 100*scale);
    CGContextAddLineToPoint(context, 175*scale, 133*scale);
    CGContextAddLineToPoint(context, 170*scale, 133*scale);
    CGContextAddLineToPoint(context, 170*scale, 150*scale);
    CGContextAddLineToPoint(context, 148*scale, 171*scale);
    CGContextAddLineToPoint(context, 75*scale, 171*scale);
    CGContextAddLineToPoint(context, 75*scale, 53*scale);
    CGContextAddLineToPoint(context, 35*scale, 53*scale);
    CGContextAddLineToPoint(context, 35*scale, 57*scale);
    CGContextAddLineToPoint(context, 18*scale, 57*scale);
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, deepBlue);
    CGContextMoveToPoint(context, 17*scale, 21*scale);
    CGContextAddLineToPoint(context, 17*scale, 17*scale);
    CGContextAddLineToPoint(context, 34*scale, 17*scale);
    CGContextAddLineToPoint(context, 34*scale, 21*scale);
    CGContextAddLineToPoint(context, 79*scale, 21*scale);
    CGContextAddLineToPoint(context, 99*scale, 41*scale);
    CGContextAddLineToPoint(context, 99*scale, 145*scale);
    CGContextAddLineToPoint(context, 136*scale, 145*scale);
    CGContextAddLineToPoint(context, 140*scale, 141*scale);
    CGContextAddLineToPoint(context, 140*scale, 132*scale);
    CGContextAddLineToPoint(context, 134*scale, 132*scale);
    CGContextAddLineToPoint(context, 134*scale, 99*scale);
    CGContextAddLineToPoint(context, 174*scale, 99*scale);
    CGContextAddLineToPoint(context, 174*scale, 132*scale);
    CGContextAddLineToPoint(context, 169*scale, 132*scale);
    CGContextAddLineToPoint(context, 169*scale, 149*scale);
    CGContextAddLineToPoint(context, 147*scale, 170*scale);
    CGContextAddLineToPoint(context, 74*scale, 170*scale);
    CGContextAddLineToPoint(context, 74*scale, 52*scale);
    CGContextAddLineToPoint(context, 34*scale, 52*scale);
    CGContextAddLineToPoint(context, 34*scale, 56*scale);
    CGContextAddLineToPoint(context, 17*scale, 56*scale);
    CGContextFillPath(context);
    
    //Second Pipe
    CGContextSetFillColorWithColor(context, lighBlue);
    CGContextMoveToPoint(context, 135*scale, 85*scale);
    CGContextAddLineToPoint(context, 135*scale, 60*scale);
    CGContextAddLineToPoint(context, 141*scale, 60*scale);
    CGContextAddLineToPoint(context, 163*scale, 23*scale);
    CGContextAddLineToPoint(context, 235*scale, 23*scale);
    CGContextAddLineToPoint(context, 235*scale, 141*scale);
    CGContextAddLineToPoint(context, 274*scale, 141*scale);
    CGContextAddLineToPoint(context, 274*scale, 137*scale);
    CGContextAddLineToPoint(context, 292*scale, 137*scale);
    CGContextAddLineToPoint(context, 292*scale, 177*scale);
    CGContextAddLineToPoint(context, 274*scale, 177*scale);
    CGContextAddLineToPoint(context, 274*scale, 173*scale);
    CGContextAddLineToPoint(context, 230*scale, 173*scale);
    CGContextAddLineToPoint(context, 210*scale, 153*scale);
    CGContextAddLineToPoint(context, 210*scale, 48*scale);
    CGContextAddLineToPoint(context, 175*scale, 48*scale);
    CGContextAddLineToPoint(context, 170*scale, 53*scale);
    CGContextAddLineToPoint(context, 170*scale, 60*scale);
    CGContextAddLineToPoint(context, 175*scale, 60*scale);
    CGContextAddLineToPoint(context, 175*scale, 85*scale);
    CGContextAddLineToPoint(context, 135*scale, 85*scale);
    CGContextFillPath(context);

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
