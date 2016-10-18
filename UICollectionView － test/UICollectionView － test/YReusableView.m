//
//  YReusableView.m
//  UICollectionView － test
//
//  Created by qingling_yang on 16/10/13.
//  Copyright © 2016年 yql. All rights reserved.
//

#import "YReusableView.h"

@implementation YReusableView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:@"b"];
        [self addSubview:imageView];
    }
    return self;
}

@end
