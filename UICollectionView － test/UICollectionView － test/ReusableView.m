//
//  ReusableView.m
//  UICollectionView － test
//
//  Created by qingling_yang on 16/10/11.
//  Copyright © 2016年 yql. All rights reserved.
//

#import "ReusableView.h"

@implementation ReusableView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:@"a"];
        [self addSubview:imageView];
    }
    return self;
}

@end
