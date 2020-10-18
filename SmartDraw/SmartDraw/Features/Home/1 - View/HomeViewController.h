//
//  HomeViewController.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef HomeViewController_h
#define HomeViewController_h

#import <UIKit/UIKit.h>
#import "HomePresenter.h"
#import "BackgroundView.h"

@protocol ViewToPresenterHomeProtocol;

// MARK: - Protocol

@protocol PresenterToViewHomeProtocol
@property (strong, nonatomic) id<ViewToPresenterHomeProtocol> presenter;
- (void) updateLabels: (NSString*) startButtonTitle : (NSString*) explenationsLabelTitle;
- (void) updateStartContainerView: (CGFloat) cornerRadius
                                 : (Boolean) maskToBounds
                                 : (CGFloat) borderWidth
                                 : (CGColorRef) cgColor;
- (void) updateNavBarColor: (UIColor*) barTintColor
                          : (UIColor*) tintColor;
@end

// MARK: - Class

@interface HomeViewController : UIViewController <PresenterToViewHomeProtocol>
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *explenationsLabel;
@property (weak, nonatomic) IBOutlet UIView *startButtonContainerView;

@property (strong, nonatomic) id<ViewToPresenterHomeProtocol> presenter;

@end

#endif /* HomeViewController_h */
