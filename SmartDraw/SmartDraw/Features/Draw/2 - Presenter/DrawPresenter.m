//
//  DrawPresenter.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawPresenter.h"
#import "UIView+Extension.h"
#import "FCAlertView.h"
#import "AppColors.h"

@implementation DrawPresenter

// MARK: - View Delegate

- (void)viewDidLoad {
    [self initColorList];
    [self setupTimerForTimerLabel];
    [self updateThemeLabel];
    [self updateDrawView];
}

- (void) viewDidAppear: (UISlider*) opacitySlider
                      : (UISlider*) thicknessSlider {
    [self.view initDrawView: [_colorList firstObject]
                           : [opacitySlider value]
                           : [thicknessSlider value]];
}

- (void) setupTimerForTimerLabel {
    _remainingSeconds = [_interactor getMaxTimer];
    [self updateTimerLabel];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimerLabel) userInfo:nil repeats:true];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void) updateDrawView {
    [self.view updateDrawViewWith: 15
                                 : true
                                 : 3
                                 : [[AppColors orange] CGColor]];
}

- (void) updateTimerLabel {
    _remainingSeconds--;
    NSString* text = [NSString stringWithFormat:@"%d%@", (int)_remainingSeconds, [_interactor getTimerUnitForSecond]];
    [_view updateTimerLabel: text];
    
    if (_remainingSeconds <= 0) {
        [_timer invalidate];
        [_view timerEnded];
    }
}

- (void) updateThemeLabel {
    [_view updateThemeLabel: [NSString stringWithFormat:@"%@%@", [_interactor getThemePrefix],_theme]];
}

- (void) initColorList {
    _colorList = [_interactor getColorList];
}

- (void) timerEnded:(UIView *)viewToSave {
    [self saveView: viewToSave];
}

- (void) saveButtonTouched:(UIView*) viewToSave {
    [_timer invalidate];
    [self saveView: viewToSave];
}

- (void) saveView:(UIView *)viewToSave {
    UIImage* drawing = [viewToSave toImage];
    UIImageWriteToSavedPhotosAlbum(drawing,
                                   self,
                                   @selector(saveImage:didFinishSavingWithError:contextInfo:),
                                   nil);
}

- (void)saveImage:(UIImage *)image didFinishSavingWithError
                 : (NSError *)error contextInfo
                 : (void *) contextInfo {
    if (error) {
        [self showFailureAlertView];
    } else {
        [self showSuccessAlertView];
    }
}

- (void) showSuccessAlertView {
    NSString* title = [_interactor getTitleSuccessPopUp];
    NSString* message = [_interactor getMessageSuccessPopUp];
    NSString* buttonMessage = [_interactor getButtonTextSuccessPopUp];
    FCAlertView* alert = [_interactor getSuccessAlertView];
    
    [alert doneActionBlock:^{
        [self.view dismissCurrentViewController];
    }];
    [_view showSuccessAlertView:alert :title :message :buttonMessage];
}

- (void) showFailureAlertView {
    NSString* title = [_interactor getTitleFailurePopUp];
    NSString* message = [_interactor getMessageFailurePopUp];
    NSString* buttonMessage = [_interactor getButtonTextFailurePopUp];
    FCAlertView* alert = [_interactor getFailureAlertView];
    
    [alert doneActionBlock:^{
        [self.view dismissCurrentViewController];
    }];
    [_view showFailureAlertView:alert :title :message :buttonMessage];
}

// MARK: - Router Delegate

- (void)showView:(UINavigationController *)navController {
    [_router pushToView: navController];
}

// MARK: - CollectionView functions

- (NSUInteger)getNumberOfColors {
    return [_colorList count];
}

- (UIColor*) getCellColorForIndex: (NSIndexPath*) indexPath {
    UIColor* cellColor = [UIColor blackColor];
    if ([_colorList count] >= [indexPath row]) {
        cellColor = [_colorList objectAtIndex: [indexPath row]];
    }
    return cellColor;
}

- (CGFloat) getCellCornerRadius {
    return 3.0;
}

- (void) didSelectItemAtIndexPath: (NSIndexPath*) indexPath {
    UIColor* selectedColor = [UIColor blackColor];
    if ([_colorList count] >= [indexPath row]) {
        selectedColor = [_colorList objectAtIndex: [indexPath row]];
    }
    [_view updateSelectedColor:selectedColor];
}

@end
