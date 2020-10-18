//
//  DrawboardView.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 06/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import "DrawBoardView.h"
#import "UIView+Extension.h"

@implementation MyPoint

- (void)setup:(CGFloat)x :(CGFloat)y {
    _x = x;
    _y = y;
}

- (NSInteger)getXInt {
    return (NSInteger)_x;
}

- (NSInteger)getYInt {
    return (NSInteger)_y;
}

@end

@implementation DrawLine

- (instancetype)init
{
    self = [super init];
    if (self) {
        _points = [NSMutableArray<MyPoint*> array];
        _opacity = 1.0;
        _color = UIColor.blackColor;
        _thickness = 1.0;
    }
    return self;
}

- (void) setup: (UIColor*) color
       points : (NSMutableArray<MyPoint*>*) points
    thickness : (CGFloat) thickness
      opacity : (CGFloat) opacity {
    _points = points;
    _color = color;
    _thickness = thickness;
    _opacity = opacity;
}

@end

@implementation DrawBoardView

// MARK: - Init

- (void)initVariables {
    if (_lines == nil) {
        _lines = [NSMutableArray<MyPoint*> array];
        _strokeOpacity = 1.0;
        _strokeColor = UIColor.blackColor;
        _strokeThickness = 1.0;
    }
}

- (void) updateColor:(UIColor*) color {
    _strokeColor = color;
}

- (void) updateOpacity:(CGFloat) opacity {
    _strokeOpacity = opacity / 100;
}

- (void) updateThickness:(CGFloat) thickness {
    _strokeThickness = thickness / 100;
}

// MARK: - View functions

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    [self initVariables];
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) {
        return;
    }

    for (DrawLine* line in _lines) {
        for (NSUInteger i = 0; i < [line.points count]; i++) {
            MyPoint* point = [line.points objectAtIndex: i];
            UIColor* color = [line color];
            CGFloat opacity = [line opacity];
            CGFloat thickness = [line thickness];
            if (i == 0) {
                CGContextMoveToPoint(context, [point x] - self.frame.origin.x, [point y] - self.frame.origin.y);
            } else {
                CGContextAddLineToPoint(context, [point x] - self.frame.origin.x, [point y] - self.frame.origin.y);
            }
            CGContextSetStrokeColorWithColor(context, [[color colorWithAlphaComponent: opacity] CGColor]);
            CGContextSetLineWidth(context, thickness);
        }
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextStrokePath(context);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DrawLine* line = [[DrawLine alloc] init];
    line.points = [NSMutableArray<MyPoint*> array];
    line.color = UIColor.blackColor;
    [_lines addObject: line];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [[touches allObjects] firstObject];
    if (!touch) {
        printf("Error - DrawboardView.m - touchesMoved - Touch is nil");
        return;
    }
    
    if ([_lines count] == 0)
        return;
    DrawLine* lastLine = [_lines objectAtIndex: [_lines count] - 1];
    [_lines removeObjectAtIndex: [_lines count] - 1];
    MyPoint* point = [[MyPoint alloc] init];
        [point setup: [touch locationInView: nil].x
                : [touch locationInView: nil].y];
    if (lastLine.points) {
        [lastLine.points addObject: point];
    } else {
        lastLine.points = [lastLine.points initWithObjects: point, nil];
    }
    lastLine.color = _strokeColor;
    lastLine.thickness = _strokeThickness;
    lastLine.opacity = _strokeOpacity;
    [_lines addObject:lastLine];
    [self setNeedsDisplay];
}

- (void) undoDraw {
    if ([_lines count] > 0) {
        [_lines removeLastObject];
        [self setNeedsDisplay];
    }
}

@end
