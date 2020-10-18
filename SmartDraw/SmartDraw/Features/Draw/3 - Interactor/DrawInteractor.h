//
//  DrawInteractor.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef DrawInteractor_h
#define DrawInteractor_h

#import <UIKit/UIKit.h>
#import "DrawPresenter.h"

@protocol InteractorToPresenterDrawProtocol;

// MARK: - Protocol

@protocol PresenterToInteractorDrawProtocol
@property (strong, nonatomic) id<InteractorToPresenterDrawProtocol> presenter;
- (NSMutableArray<UIColor*>*) getColorList;
- (FCAlertView*) getSuccessAlertView;
- (FCAlertView*) getFailureAlertView;
- (NSString*) getTitleSuccessPopUp;
- (NSString*) getMessageSuccessPopUp;
- (NSString*) getButtonTextSuccessPopUp;
- (NSString*) getTitleFailurePopUp;
- (NSString*) getMessageFailurePopUp;
- (NSString*) getButtonTextFailurePopUp;
- (NSString*) getTimerUnitForSecond;
- (NSUInteger) getMaxTimer;
- (NSString*) getThemePrefix;
@end

// MARK: - Class

@interface DrawInteractor : NSObject <PresenterToInteractorDrawProtocol>

@property (strong, nonatomic) id<InteractorToPresenterDrawProtocol> presenter;
@end

#endif /* DrawInteractor_h */
