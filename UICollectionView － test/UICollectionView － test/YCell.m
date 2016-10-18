//
//  YCell.m
//  UICollectionView － test
//
//  Created by qingling_yang on 16/10/17.
//  Copyright © 2016年 yql. All rights reserved.
//

#import "YCell.h"

@implementation YCell

- (UILabel *)title {
    if (!_title) {
        self.title = [[UILabel alloc] initWithFrame:self.bounds];
        _title.backgroundColor = [UIColor whiteColor];
        _title.textColor = [UIColor blackColor];
        _title.font = [UIFont systemFontOfSize:16];
        _title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_title];
    }
    return _title;
}

@end
