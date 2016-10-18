//
//  YLayout.m
//  UICollectionView － test
//
//  Created by qingling_yang on 16/10/13.
//  Copyright © 2016年 yql. All rights reserved.
//

#import "YLayout.h"
#import "YReusableView.h"
#import "ReusableView.h"

@implementation YLayout

- (void)prepareLayout {
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    _center=CGPointMake(size.width/2, size.height/2);
    [self registerClass:[YReusableView class] forDecorationViewOfKind:@"Y"];
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kind"];
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"kindF"];
}

- (CGSize)collectionViewContentSize {

    return self.collectionView.frame.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size =  CGSizeMake(100 + indexPath.row * 10.2, 100 + indexPath.row * 10.2);
    attributes.center = CGPointMake(80 * (indexPath.item + 1), 122.5 + 165 * indexPath.section);
    return attributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    attributes.frame = CGRectMake(0, indexPath.section * 100, [[UIScreen mainScreen] bounds].size.width, 30);
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    attributes.frame = CGRectMake(0, (80*indexPath.section) + 30, 320, 125);
    attributes.zIndex = -1;
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 3; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:3 inSection:i];
        [array addObject:[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath]];
        [array addObject:[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath]];
    }
    for (int y = 0; y < 3; y ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:3 inSection:y];
        [array addObject:[self layoutAttributesForDecorationViewOfKind:@"Y" atIndexPath:indexPath]];
    }
    for (NSInteger i = 0; i < 3; i ++) {
        for (NSInteger t = 0; t < 3; t ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:t inSection:i];
            [array addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath *)itemIndexPath {

    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attributes;
}


@end
