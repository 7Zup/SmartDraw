//
//  DrawViewController.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import "DrawViewController.h"
#import "UIView+Extension.h"
#import "FCAlertView.h"

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_presenter viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_presenter viewDidAppear:_opacitySlider : _thicknessSlider];
}

// Presenter Delegate

- (void)updateThemeLabel: (NSString*) title {
    _themeLabel.text = title;
}

- (void)updateTimerLabel: (NSString*) title {
    _timerLabel.text = title;
}

- (void)initDrawView: (UIColor*) color
                    : (CGFloat) opacity
                    : (CGFloat) thickness {
    [_drawBoardView updateColor:color];
    [_drawBoardView updateOpacity:opacity];
    [_drawBoardView updateThickness: thickness];
}

- (void)updateSelectedColor: (UIColor*) color {
    [_drawBoardView updateColor:color];
}

- (void) updateDrawViewWith: (CGFloat) cornerRadius
                           : (Boolean) maskToBounds
                           : (CGFloat) borderWidth
                           : (CGColorRef) cgColor {
    _drawBoardView.layer.cornerRadius = cornerRadius;
    _drawBoardView.layer.masksToBounds = maskToBounds;
    _drawBoardView.layer.borderWidth = borderWidth;
    _drawBoardView.layer.borderColor = cgColor;
}

- (void) dismissCurrentViewController {
    [[self navigationController] popViewControllerAnimated:true];
}

- (void)showSuccessAlertView:(FCAlertView*) alert :(NSString *)title :(NSString *)message :(NSString *)buttonTitle {
    [alert showAlertInView:self
                 withTitle:title
              withSubtitle:message
           withCustomImage:nil
       withDoneButtonTitle:buttonTitle
                andButtons:nil];
}

- (void)showFailureAlertView:(FCAlertView*)alert :(NSString *)title :(NSString *)message :(NSString *)buttonTitle {
    [alert showAlertInView:self
                 withTitle:title
              withSubtitle:message
           withCustomImage:nil
       withDoneButtonTitle:buttonTitle
                andButtons:nil];
}

- (void) timerEnded {
    [_presenter timerEnded: _drawBoardView];
}

// MARK: - IBActions

- (IBAction)UndoButtonTUI:(id)sender {
    [_drawBoardView undoDraw];
}

- (IBAction)SaveButtonTUI:(id)sender {
    [_presenter saveButtonTouched: _drawBoardView];
}

- (IBAction)ThicknessSliderChanged:(UISlider *)sender {
    [_drawBoardView updateThickness: sender.value];
}

- (IBAction)OpacitySliderChanged:(UISlider *)sender {
    [_drawBoardView updateOpacity: sender.value];
}

@end
