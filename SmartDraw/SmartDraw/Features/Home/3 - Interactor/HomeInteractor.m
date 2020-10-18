//
//  HomeInteractor.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#include <stdlib.h>
#import <UIKit/UIKit.h>
#import "HomeInteractor.h"
#import "Mantle.h"

@implementation HomeInteractor

- (NSString*) getStartButtonTitle {
    return NSLocalizedString(@"HomeViewStartButton", nil);
}

- (NSString*) getExplenationText {
    return NSLocalizedString(@"HomeViewExplenationLabel", nil);
}

- (NSUInteger)getRandomNumberFromArray:(NSArray *)array {
    NSUInteger number = 0;
    if (array)
        number = arc4random() % [array count];
    return number;
}

- (NSArray<NSString *> *)getThemeArray {
    NSArray* array = [[NSArray alloc] initWithObjects:
                      NSLocalizedString(@"HomeViewTheme0", nil),
                      NSLocalizedString(@"HomeViewTheme1", nil),
                      NSLocalizedString(@"HomeViewTheme2", nil),
                      NSLocalizedString(@"HomeViewTheme3", nil),
                      NSLocalizedString(@"HomeViewTheme4", nil),
                      NSLocalizedString(@"HomeViewTheme5", nil),
                      NSLocalizedString(@"HomeViewTheme6", nil),
                      nil
                      ];
    return array;
}

@end
