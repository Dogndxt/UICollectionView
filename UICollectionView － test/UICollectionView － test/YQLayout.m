//
//  YQLayout.m
//  UICollectionView － test
//
//  Created by qingling_yang on 16/10/14.
//  Copyright © 2016年 yql. All rights reserved.
//

#import "YQLayout.h"
#import "YReusableView.h"
#import "ReusableView.h"

@implementation YQLayout

- (void)prepareLayout {
    [super prepareLayout];
    // 注册装饰视图
    [self registerClass:[YReusableView class] forDecorationViewOfKind:@"Y"];
     // 注册行头和行尾
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kind"];
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"kindF"];
}

- (CGSize)collectionViewContentSize {
    
    return self.collectionView.frame.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(80 + indexPath.row * 10.2, 70 + indexPath.row * 6.2);
    attributes.center = CGPointMake(80 * (indexPath.item + 1), 100 + 175 * indexPath.section);
    return attributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    attributes.frame = CGRectMake(0, indexPath.section * 80 + 12, [[UIScreen mainScreen] bounds].size.width - 55, 36);
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



@end
