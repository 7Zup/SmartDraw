//
//  HomeRouter.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef HomeRouter_h
#define HomeRouter_h

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@class HomeViewController;

// Mark: - Protocol

@protocol PresenterToRouterHomeProtocol
+ (HomeViewController*) createHomeModule;
- (void) pushToDrawView: (UINavigationController*)navController
             withTheme : (NSString*) theme;
@end

// MARK: - Class

@interface HomeRouter : NSObject <PresenterToRouterHomeProtocol>
@end

#endif /* HomeRouter_h */
