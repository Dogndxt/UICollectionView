//
//  ViewController.m
//  UICollectionView － test
//
//  Created by qingling_yang on 16/10/11.
//  Copyright © 2016年 yql. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "ReusableView.h"

#import "YLayout.h"
#import "YQLayout.h"

#import "YCell.h"
#import "LCell.h"

#import "TestViewController.h"

@interface ViewController ()

@property (nonatomic, strong) ReusableView *reusableView;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) YQLayout *yqLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 1. 在创建集合对象之前需要创建集合视图的布局对象，用于对集合视图的单元格做布局 （一个布局对象管理一个布局）
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    flowLayout.headerReferenceSize = CGSizeMake(0, 160);
    flowLayout.footerReferenceSize = CGSizeMake(0, 140);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    YLayout *yLayout = [[YLayout alloc] init];
    
    _yqLayout = [[YQLayout alloc] init];
    
    self.collectionView.collectionViewLayout = _yqLayout;
 
    self.array = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", nil];
    
    [self.collectionView registerClass:[YCell class] forCellWithReuseIdentifier:@"YCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"LCell" bundle:nil] forCellWithReuseIdentifier:@"LCell"];
    
//    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kind"];
//    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"kindF"];

//    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
//    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}

- (IBAction)changeLayout:(UIButton *)sender {
    
//    - (void)setCollectionViewLayout:(UICollectionViewLayout *)layout animated:(BOOL)animated;
    [self.collectionView setCollectionViewLayout:_yqLayout animated:YES];
    
//    TestViewController *test = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
//
//    [test addWithFrameToViewController:self];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

//    CollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
//    cell.label.text = self.array[indexPath.row];
//    cell.backgroundColor = [UIColor clearColor];
    
//    YCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YCell" forIndexPath:indexPath];
//    cell.title.text = @"yql";
    
    LCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LCell" forIndexPath:indexPath];
    cell.label.text = @"lll";
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        self.reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"kind" forIndexPath:indexPath];
//        self.reusableView.backgroundColor = [UIColor greenColor];
        return self.reusableView;
    } else {
    
        self.reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"kindF" forIndexPath:indexPath];
//        self.reusableView.backgroundColor = [UIColor yellowColor];
        return self.reusableView;
    }
}


//  cell 被选中的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor grayColor];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
 

// 返回是否可以选择（哪个collectionView，哪行，哪个cell）
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        return NO;
    }
    return YES;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(indexPath.row * 30 + 50, 100 + indexPath.row * 20);
}

// 长按某个 item，弹出 copy 和 paste 的菜单
// These methods provide support for copy/paste actions on cells.
// All three should be implemented if any are.
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {

    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender {

    
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender {

    NSLog(@"%@", NSStringFromSelector(action));
    if ([NSStringFromSelector(action) isEqualToString:@"cut:"]) {
        [self.collectionView performBatchUpdates:^{
            
            [self.array removeObjectAtIndex:indexPath.row];
            [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
    }
    if ([NSStringFromSelector(action) isEqualToString:@"paste:"]) {
        [self.collectionView performBatchUpdates:^{
            
            [self.array addObject:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
            [_collectionView insertItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
