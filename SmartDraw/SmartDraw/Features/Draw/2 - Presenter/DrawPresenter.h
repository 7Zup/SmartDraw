//
//  DrawPresenter.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef DrawPresenter_h
#define DrawPresenter_h

#import <UIKit/UIKit.h>
#import "DrawViewController.h"
#import "DrawInteractor.h"
#import "DrawRouter.h"

@protocol PresenterToViewDrawProtocol;
@protocol PresenterToInteractorDrawProtocol;
@protocol PresenterToRouterDrawProtocol;

// MARK: - Protocol

@protocol ViewToPresenterDrawProtocol
@property (strong, nonatomic) id<PresenterToViewDrawProtocol> view;
@property (strong, nonatomic) id<PresenterToInteractorDrawProtocol> interactor;
@property (strong, nonatomic) id<PresenterToRouterDrawProtocol> router;
@property (strong, nonatomic) NSString* theme;

- (void) viewDidLoad;
- (void) viewDidAppear: (UISlider*) opacitySlider
                      : (UISlider*) thicknessSlider;
- (void) saveButtonTouched: (UIView*) viewToSave;
- (void) timerEnded: (UIView*) viewToSave;

- (void) showView: (UINavigationController*)navController;

// MARK: - CollectionView functions

- (NSUInteger) getNumberOfColors;
- (CGFloat) getCellCornerRadius;
- (UIColor*) getCellColorForIndex: (NSIndexPath*) indexPath;
- (void) didSelectItemAtIndexPath: (NSIndexPath*) indexPath;

@end

@protocol InteractorToPresenterDrawProtocol
@end

// MARK: - Class

@interface DrawPresenter : NSObject <ViewToPresenterDrawProtocol, InteractorToPresenterDrawProtocol>

// Mark: - ViewToPresenterProtocol

@property (strong, nonatomic) id<PresenterToViewDrawProtocol> view;
@property (strong, nonatomic) id<PresenterToInteractorDrawProtocol> interactor;
@property (strong, nonatomic) id<PresenterToRouterDrawProtocol> router;

@property NSUInteger remainingSeconds;
@property (strong, nonatomic) NSTimer* timer;
@property (strong, nonatomic) NSArray<UIColor*>* colorList;
@property (strong, nonatomic) NSString* theme;

- (void) initColorList;

- (void)saveImage:(UIImage *)image didFinishSavingWithError
                 : (NSError *)error contextInfo
                 : (void *) contextInfo;

- (void) showSuccessAlertView;
- (void) showFailureAlertView;
- (void) updateTimerLabel;
- (void) setupTimerForTimerLabel;
- (void) updateThemeLabel;
- (void) saveView: (UIView*) viewToSave;
- (void) updateDrawView;

@end

#endif /* DrawPresenter_h */
