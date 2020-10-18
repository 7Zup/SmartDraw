//
//  DrawInteractor.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawInteractor.h"
#import "Mantle.h"
#import "Colours.h"

@implementation DrawInteractor

- (NSMutableArray<UIColor*>*) getColorList {
    NSArray<NSString*>* hexStringList = [NSArray<NSString*> arrayWithObjects: @"#000000", @"#808080", @"#C0C0C0", @"#FFFFFF", @"#FF0000", @"#800000", @"#FFFF00", @"#808000", @"#00FF00", @"#008000", @"#00FFFF", @"#008080", @"#0000FF", @"#000080", @"#FF00FF", @"#800080", nil];
    NSMutableArray<UIColor*>* colorList = [NSMutableArray<UIColor*> array];
    
    for (NSString* hexColor in hexStringList) {
        [colorList addObject: [UIColor colorFromHexString: hexColor]];
    }
    return colorList;
}

- (FCAlertView*) getSuccessAlertView {
    FCAlertView *alert = [[FCAlertView alloc] init];
    [alert makeAlertTypeSuccess];
    return alert;
}

- (FCAlertView*) getFailureAlertView {
    FCAlertView *alert = [[FCAlertView alloc] init];
    [alert makeAlertTypeWarning];
    return alert;
}

- (NSString*) getTitleSuccessPopUp {
    return NSLocalizedString(@"DrawViewSuccessPopUpTitle", nil);
}

- (NSString*) getMessageSuccessPopUp {
    return NSLocalizedString(@"DrawViewSuccessPopUpMessage", nil);
}

- (NSString*) getButtonTextSuccessPopUp {
    return NSLocalizedString(@"DrawViewSuccessPopUpButton", nil);
}

- (NSString*) getTitleFailurePopUp {
    return NSLocalizedString(@"DrawViewFailurePopUpTitle", nil);
}

- (NSString*) getMessageFailurePopUp {
    return NSLocalizedString(@"DrawViewFailurePopUpMessage", nil);
}

- (NSString*) getButtonTextFailurePopUp {
    return NSLocalizedString(@"DrawViewFailurePopUpButton", nil);
}

- (NSString*) getTimerUnitForSecond {
    return NSLocalizedString(@"CommonTimerUnitSecond", nil);
}

- (NSUInteger) getMaxTimer {
    return 30;
}

- (NSString*) getThemePrefix {
    return NSLocalizedString(@"CommonDrawPrefix", nil);
}

@end
