//
//  HomeRouter.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import "HomePresenter.h"
#import "HomeInteractor.h"
#import "HomeRouter.h"
#import "DrawRouter.h"

@implementation HomeRouter

+ (HomeViewController *)createHomeModule {
    HomeViewController* module =
    [[UIStoryboard storyboardWithName: @"Main"
                               bundle: [NSBundle mainBundle]]
     instantiateViewControllerWithIdentifier: @"HomeViewController"];
    
    HomePresenter* presenter = [[HomePresenter alloc] init];
    HomeInteractor* interactor = [[HomeInteractor alloc] init];
    HomeRouter* router = [[HomeRouter alloc] init];
    
    // Link viper architecture together
    presenter.router = router;
    presenter.interactor = interactor;
    presenter.view = module;
    interactor.presenter = presenter;
    module.presenter = presenter;
    
    return module;
}

- (void)pushToDrawView: (UINavigationController *)navController
            withTheme : (NSString *)theme {
    DrawViewController* drawVC = [DrawRouter createDrawModule: theme];
    [navController pushViewController: drawVC
                             animated: true];
}

@end
