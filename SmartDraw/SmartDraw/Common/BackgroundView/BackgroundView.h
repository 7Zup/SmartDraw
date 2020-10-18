//
//  BackgroundView.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 08/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#ifndef BackgroundView_h
#define BackgroundView_h

#import <UIKit/UIKit.h>

@interface BackgroundView : UIView
@property (weak, nonatomic) IBOutlet UIView *contentView;
- (void) commonInit;
@end

#endif /* BackgroundView_h */
