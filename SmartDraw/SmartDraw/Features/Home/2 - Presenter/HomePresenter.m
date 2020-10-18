//
//  HomePresenter.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppColors.h"
#import "HomePresenter.h"

@implementation HomePresenter

// Mark: - InteractorToPresenterProtocol

- (void)viewDidLoad {
    _themeList = [_interactor getThemeArray];
    NSString* buttonTitle = [_interactor getStartButtonTitle];
    NSString* explenationTitle = [_interactor getExplenationText];
    [self.view updateLabels: buttonTitle
                           : explenationTitle];
    [self.view updateNavBarColor: [AppColors grey] : [AppColors orange]];
    [self updateStartContainerView];

}

- (void) updateStartContainerView {
    [_view updateStartContainerView: 10
                                   : true
                                   : 3
                                   : [[AppColors orange] CGColor]];
}

- (void)showView:(UINavigationController *)navController {
    NSUInteger randomNumber = [_interactor getRandomNumberFromArray: self.themeList];
    [_router pushToDrawView:navController withTheme: [_themeList objectAtIndex:randomNumber]];
}

@end
