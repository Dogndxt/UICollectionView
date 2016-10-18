//
//  TestViewController.m
//  UICollectionView － test
//
//  Created by qingling_yang on 16/10/18.
//  Copyright © 2016年 yql. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

/**
 *  @brief  通过Frame添加到viewController
 *
 *  @param viewController 添加到的父视图
 */
- (void)addWithFrameToViewController:(UIViewController *)viewController {
    
    //建立父子关系
    [viewController addChildViewController:self];
    
    self.view.frame = CGRectMake(0, 200, 375, 678);
    
    //添加到视图上
    [viewController.view addSubview:self.view];
    
    //调用子控制器的didMoveToParentViewController , 通知子控制器完成父子关系的建立
    [self didMoveToParentViewController:viewController];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
