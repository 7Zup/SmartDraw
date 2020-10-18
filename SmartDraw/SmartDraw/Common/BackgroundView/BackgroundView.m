//
//  BackgroundView.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 08/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [[NSBundle mainBundle] loadNibNamed:@"BackgroundView" owner:self options:nil];
    [self addSubview:_contentView];
    _contentView.frame = [self bounds];
    _contentView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
}

@end
