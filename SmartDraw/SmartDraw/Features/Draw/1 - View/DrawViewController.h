//
//  DrawViewController.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef DrawViewController_h
#define DrawViewController_h

#import <UIKit/UIKit.h>
#import "DrawBoardView.h"
#import "FCAlertView.h"
#import "DrawPresenter.h"

@protocol ViewToPresenterDrawProtocol;

// MARK: - Protocol

@protocol PresenterToViewDrawProtocol
@property (strong, nonatomic) id<ViewToPresenterDrawProtocol> presenter;
- (void)updateSelectedColor: (UIColor*) color;
- (void)updateThemeLabel: (NSString*) title;
- (void)updateTimerLabel: (NSString*) title;
- (void)initDrawView: (UIColor*) color
                    : (CGFloat) opacity
                    : (CGFloat) thickness;
- (void)showSuccessAlertView: (FCAlertView*) alert
                            : (NSString*)title
                            : (NSString*) message
                            : (NSString*) buttonTitle;

- (void)showFailureAlertView: (FCAlertView*) alert
                            : (NSString*)title
                            : (NSString*) message
                            : (NSString*) buttonTitle;
- (void) dismissCurrentViewController;
- (void) timerEnded;
- (void) updateDrawViewWith: (CGFloat) cornerRadius
                           : (Boolean) maskToBounds
                           : (CGFloat) borderWidth
                           : (CGColorRef) cgColor;

@end

// MARK: - Class

@interface DrawViewController : UIViewController <PresenterToViewDrawProtocol>
@property (strong, nonatomic) id<ViewToPresenterDrawProtocol> presenter;

// Theme
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

// DrawBoard
@property (weak, nonatomic) IBOutlet DrawBoardView *drawBoardView;

// Settings
@property (weak, nonatomic) IBOutlet UICollectionView *colorsCollectionView;
@property (weak, nonatomic) IBOutlet UISlider *thicknessSlider;
@property (weak, nonatomic) IBOutlet UISlider *opacitySlider;

- (void) dismissCurrentViewController;
@end

#endif /* DrawViewController_h */
