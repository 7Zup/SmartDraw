//
//  DrawRouter.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef DrawRouter_h
#define DrawRouter_h

#import <UIKit/UIKit.h>
#import "DrawViewController.h"

@class DrawViewController;

// MARK: - Protocol

@protocol PresenterToRouterDrawProtocol
+ (DrawViewController*) createDrawModule: (NSString*) theme;
- (void) pushToView: (UINavigationController*)navController;
@end


// MARK: - Class

@interface DrawRouter : NSObject <PresenterToRouterDrawProtocol>
@end

#endif /* DrawRouter_h */
