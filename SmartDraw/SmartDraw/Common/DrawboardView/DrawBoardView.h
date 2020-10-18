//
//  DrawboardView.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 06/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef DrawboardView_h
#define DrawboardView_h

#import <UIKit/UIKit.h>

@interface MyPoint : NSObject
@property CGFloat x;
@property CGFloat y;

- (void) setup: (CGFloat) x
             : (CGFloat) y;
- (NSInteger) getXInt;
- (NSInteger) getYInt;
@end

@interface DrawLine : NSObject
@property (copy, nonatomic) UIColor* color;
@property CGFloat thickness;
@property CGFloat opacity;
@property (retain, nonatomic) NSMutableArray<MyPoint*>* points;

- (void) setup: (UIColor*) color
       points : (NSMutableArray<MyPoint*>*) points
    thickness : (CGFloat) thickness
      opacity : (CGFloat) opacity;
@end

@interface DrawBoardView : UIView
@property (strong, nonatomic) NSMutableArray* lines;
@property CGFloat strokeThickness;
@property CGFloat strokeOpacity;
@property (strong, nonatomic) UIColor* strokeColor;

- (void) initVariables;
- (void) updateColor:(UIColor*) color;
- (void) updateOpacity:(CGFloat) opacity;
- (void) updateThickness:(CGFloat) thickness;
- (void) undoDraw;
@end

#endif /* DrawboardView_h */
