//
//  DrawRouter.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import "DrawRouter.h"
#import "DrawPresenter.h"
#import "DrawInteractor.h"

@implementation DrawRouter

+ (DrawViewController *)createDrawModule: (NSString*) theme {
    DrawViewController* module =
    [[UIStoryboard storyboardWithName: @"Main"
                               bundle: [NSBundle mainBundle]]
     instantiateViewControllerWithIdentifier: @"DrawViewController"];
    
    DrawPresenter* presenter = [[DrawPresenter alloc] init];
    DrawInteractor* interactor = [[DrawInteractor alloc] init];
    DrawRouter* router = [[DrawRouter alloc] init];
    
    // Link viper architecture together
    presenter.router = router;
    presenter.interactor = interactor;
    presenter.view = module;
    presenter.theme = theme;
    interactor.presenter = presenter;
    module.presenter = presenter;
    
    return module;
}

- (void)pushToView:(UINavigationController *)navController {
    // Info: Uncomment when there is another router to be used
    //     DrawViewController* secondModule = [DrawRouter createSampleModule];
    //     [navController pushViewController: secondModule
    //                             animated: true]
}

@end
