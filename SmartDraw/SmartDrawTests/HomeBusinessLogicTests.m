//
//  HomeBusinessLogicTests.m
//  HomeBusinessLogicTests
//
//  Created by Fabrice Froehly on 01/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HomeInteractor.h"

@interface HomeBusinessLogicTests : XCTestCase

@property HomeInteractor* homeInteractor;

@end

@implementation HomeBusinessLogicTests

- (void)setUp {
    _homeInteractor = [[HomeInteractor alloc] init];
}

- (void)tearDown {
}

- (void)testStartButtonTitle {
    XCTAssertEqualObjects([_homeInteractor getStartButtonTitle],
                          @"C'est parti !",
                          @"Error: - Incorrect translation");
}

- (void)testExplenationText {
    XCTAssertEqualObjects([_homeInteractor getExplenationText],
                          @"Tous vos chef-d'oeuvres sont enregistrés dans votre album photo.\nA vos pinceaux !",
                          @"Error: - Incorrect translation");
}

- (void)testThemeArray {
    NSArray<NSString*>* arrayToTest = [_homeInteractor getThemeArray];
    NSArray* safeArray = [[NSArray alloc] initWithObjects:
                          @"une Maison",
                          @"une Voiture",
                          @"un Chien",
                          @"un Chat",
                          @"un Vélo",
                          @"une Fleur",
                          @"un Elephant",
                          nil
                          ];

    XCTAssertEqual([arrayToTest count], [safeArray count], @"Error: - Incorrect number of elements in array");
    
    for (int i = 0; i < [arrayToTest count]; i++) {
        XCTAssertEqualObjects([arrayToTest objectAtIndex:i],
                              [safeArray objectAtIndex:i],
                              @"Error: - Incorrect translation");
    }
}


@end
