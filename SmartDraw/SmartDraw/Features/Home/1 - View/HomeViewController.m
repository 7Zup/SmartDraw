//
//  HomeViewController.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 05/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import "HomeViewController.h"
#import "AppColors.h"

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_presenter viewDidLoad];
}

- (void)updateLabels: (NSString *)startButtonTitle : (NSString*) explenationsLabelTitle {
    [self.startButton setTitle:startButtonTitle forState: UIControlStateNormal];
    self.explenationsLabel.text = explenationsLabelTitle;
}

- (void) updateStartContainerView: (CGFloat) cornerRadius
                                 : (Boolean) maskToBounds
                                 : (CGFloat) borderWidth
                                 : (CGColorRef) cgColor {
    _startButtonContainerView.layer.cornerRadius = cornerRadius;
    _startButtonContainerView.layer.masksToBounds = maskToBounds;
    _startButtonContainerView.layer.borderWidth = borderWidth;
    _startButtonContainerView.layer.borderColor = cgColor;
}

- (void)updateNavBarColor:(UIColor *)barTintColor :(UIColor *)tintColor {
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar setBarTintColor: barTintColor];
    [bar setTintColor: tintColor];
}

// MARK: - Outlets
- (IBAction)pushStartButton:(id)sender {
    [_presenter showView: [self navigationController]];
}

@end
