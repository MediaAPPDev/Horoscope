//
//  NewMainViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/2.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "NewMainViewController.h"

@interface NewMainViewController ()
{
    UICollectionView * m_CollView;
    UICollectionViewFlowLayout * m_layout;
}
@end

@implementation NewMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self buildTopviewWithBackButton:NO title:@"星座达人秀 - TOP" rightImage:@""];
    
    m_layout = [[UICollectionViewFlowLayout alloc]init];
    [m_layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    m_CollView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, width(self.view), height(self.view)-64)];
   
    
    
    
    
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
