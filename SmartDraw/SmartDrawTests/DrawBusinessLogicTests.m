//
//  DrawBusinessLogicTests.m
//  SmartDrawTests
//
//  Created by Fabrice Froehly on 08/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DrawInteractor.h"

@interface DrawBusinessLogicTests : XCTestCase

@property DrawInteractor* drawInteractor;

@end

@implementation DrawBusinessLogicTests

- (void)setUp {
    _drawInteractor = [[DrawInteractor alloc] init];
}

- (void)tearDown {
}

- (void)testTitleSuccessPopUp {
    XCTAssertEqualObjects([_drawInteractor getTitleSuccessPopUp],
                          @"Bravo",
                          @"Error: - Incorrect translation");
}

- (void)testMessageSuccessPopUp {
    XCTAssertEqualObjects([_drawInteractor getMessageSuccessPopUp],
                          @"Votre chef-d'oeuvre a été enregistré dans votre album photo",
                          @"Error: - Incorrect translation");
}

- (void)testButtonTextSuccessPopUp {
    XCTAssertEqualObjects([_drawInteractor getButtonTextSuccessPopUp],
                          @"C'est compris",
                          @"Error: - Incorrect translation");
}

- (void)testTitleFailurePopUp {
    XCTAssertEqualObjects([_drawInteractor getTitleFailurePopUp],
                          @"Erreur",
                          @"Error: - Incorrect translation");
}

- (void)testMessageFailurePopUp {
    XCTAssertEqualObjects([_drawInteractor getMessageFailurePopUp],
                          @"Malheureusement, nous ne pouvions enregistrer votre dessin. Essayez de changer les permissions de l'application SmartDraw",
                          @"Error: - Incorrect translation");
}

- (void)testButtonTextFailurePopUp {
    XCTAssertEqualObjects([_drawInteractor getButtonTextFailurePopUp],
                          @"C'est compris",
                          @"Error: - Incorrect translation");
}

- (void)testTimerUnitForSecond {
    XCTAssertEqualObjects([_drawInteractor getTimerUnitForSecond],
                          @"s",
                          @"Error: - Incorrect translation");
}

- (void)testThemePrefix {
    XCTAssertEqualObjects([_drawInteractor getThemePrefix],
                          @"Dessine ",
                          @"Error: - Incorrect translation");
}


- (void)testColorArray {
    NSArray<UIColor*>* arrayToTest = [_drawInteractor getColorList];
    NSArray* safeArray = [[NSArray alloc] initWithObjects:
                          @"#000000", @"#808080", @"#C0C0C0",
                          @"#FFFFFF", @"#FF0000", @"#800000",
                          @"#FFFF00", @"#808000", @"#00FF00",
                          @"#008000", @"#00FFFF", @"#008080",
                          @"#0000FF", @"#000080", @"#FF00FF",
                          @"#800080", nil];
    
    XCTAssertEqual([arrayToTest count], [safeArray count],
                   @"Error: - Incorrect number of elements in array");
    
    for (int i = 0; i < [arrayToTest count]; i++) {
        XCTAssertEqualObjects([self hexStringForColor: [arrayToTest objectAtIndex:i]],
                              [safeArray objectAtIndex:i],
                              @"Error: - Incorrect translation");
    }
}

- (NSString *)hexStringForColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"#%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}

@end
