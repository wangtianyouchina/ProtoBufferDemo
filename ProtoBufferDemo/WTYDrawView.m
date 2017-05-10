
//
//  WTYDrawView.m
//  ProtoBufferDemo
//
//  Created by WTY on 17/3/30.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import "WTYDrawView.h"

@implementation WTYDrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    /*
    CGContextSaveGState(ctx);
    // 2.设置绘图信息(拼接路径)
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 10;
    
    // 设置起点
    [path moveToPoint:CGPointMake(10, 10)];
    
    // 添加一条线到某个点
    for (NSValue *pointValue in self.array) {
        CGPoint point = [pointValue CGPointValue];
        [path addLineToPoint:point];

    }
    // 3.把路径添加到上下文
    // 直接把UIKit的路径转换成CoreGraphics，CG开头就能转
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.把上下文渲染到视图
    // Stroke描边
    [path stroke];
    //CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
     */
    
    CGContextSetLineWidth(ctx, 10);
    CGContextBeginPath(ctx);
    CGPoint startPoint  = [[self.arrayTwo firstObject] CGPointValue];
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    
    for (int i = 0; i < self.arrayTwo.count; i ++) {
        NSValue *vaur = [self.arrayTwo objectAtIndex:i];
        NSValue *vaur2 = [self.arrayTwo objectAtIndex:i];
        if (i < self.arrayTwo.count-1) {
            vaur2 = [self.arrayTwo objectAtIndex:i +1];

        }
        
        CGPoint point  = vaur.CGPointValue;
        CGPoint point2 = vaur2.CGPointValue;
        
        CGContextAddQuadCurveToPoint(ctx, point.x, point.y, point2.x, point2.y);
    }

    CGContextStrokePath(ctx);
    
}


@end
