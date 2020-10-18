//
//  HomeInteractor.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef HomeInteractor_h
#define HomeInteractor_h

#import <UIKit/UIKit.h>
#import "HomePresenter.h"

@protocol InteractorToPresenterHomeProtocol;

// Mark: - Protocol

@protocol PresenterToInteractorHomeProtocol
@property (strong, nonatomic) id<InteractorToPresenterHomeProtocol> presenter;
- (NSString*) getStartButtonTitle;
- (NSString*) getExplenationText;
- (NSArray<NSString*>*) getThemeArray;
- (NSUInteger) getRandomNumberFromArray:(NSArray *)array;
@end

// MARK: - Class

@interface HomeInteractor : NSObject <PresenterToInteractorHomeProtocol>
@property (strong, nonatomic) id<InteractorToPresenterHomeProtocol> presenter;
@end

#endif /* HomeInteractor_h */
