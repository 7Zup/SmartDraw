//
//  ColorCollectionViewController.m
//  SmartDraw
//
//  Created by Fabrice Froehly on 06/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorCollectionViewController.h"
#import "DrawViewController.h"

@implementation DrawViewController (ColorsCollectionViewController)

// MARK: - UICollectionView Delegate & Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell =
    [collectionView dequeueReusableCellWithReuseIdentifier: @"collectionViewCellColor"
                                              forIndexPath: indexPath];

    cell.backgroundColor = [self.presenter getCellColorForIndex: indexPath];
    cell.layer.cornerRadius = [self.presenter getCellCornerRadius];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.presenter getNumberOfColors];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter didSelectItemAtIndexPath: indexPath];
}

@end
