//
//  HomePresenter.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef HomePresenter_h
#define HomePresenter_h

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "HomeInteractor.h"
#import "HomeRouter.h"

@protocol PresenterToViewHomeProtocol;
@protocol PresenterToInteractorHomeProtocol;
@protocol PresenterToRouterHomeProtocol;

// MARK: - Protocol

@protocol ViewToPresenterHomeProtocol
@property (strong, nonatomic) id<PresenterToViewHomeProtocol> view;
@property (strong, nonatomic) id<PresenterToInteractorHomeProtocol> interactor;
@property (strong, nonatomic) id<PresenterToRouterHomeProtocol> router;

- (void) viewDidLoad;
- (void) showView: (UINavigationController*)navController;
@end

@protocol InteractorToPresenterHomeProtocol
@end


// Mark: - Class

@interface HomePresenter : NSObject <ViewToPresenterHomeProtocol, InteractorToPresenterHomeProtocol>

@property (strong, nonatomic) id<PresenterToViewHomeProtocol> view;
@property (strong, nonatomic) id<PresenterToInteractorHomeProtocol> interactor;
@property (strong, nonatomic) id<PresenterToRouterHomeProtocol> router;
@property (strong, nonatomic) NSArray<NSString*>* themeList;
- (void) updateStartContainerView;
@end

#endif /* HomePresenter_h */
