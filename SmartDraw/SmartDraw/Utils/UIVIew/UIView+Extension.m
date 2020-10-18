//
//  UIView+Extension.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 07/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

@implementation UIView (UIViewScreenShotExtension)

- (UIImage*) toImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen.scale);
    [self drawViewHierarchyInRect: self.bounds afterScreenUpdates: true];
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (image == nil) {
        image = [[UIImage alloc] init];
    }
    return image;
}

@end
