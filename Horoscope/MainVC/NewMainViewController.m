//
//  NewMainViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/2.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "NewMainViewController.h"
#import "MainCollectionViewCell.h"
#import "AddButton.h"
#import "TopView.h"
#import "MineViewController.h"
@interface NewMainViewController ()
{
    UICollectionView * m_CollView;
    UICollectionViewFlowLayout * m_layout;
    UIImageView * blackImageView;
    AddButton * ccButton;
}
@end

@implementation NewMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
    
    [self buildTopviewWithBackButton:NO title:@"星座达人秀 - TOP" rightImage:@""];
    
    m_layout = [[UICollectionViewFlowLayout alloc]init];
    [m_layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    m_layout.minimumLineSpacing = 3;
    m_layout.minimumInteritemSpacing = 2;
    m_CollView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, width(self.view), height(self.view)-64) collectionViewLayout:m_layout];
   
    [m_CollView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell1"];
    
    [m_CollView registerClass:[TopView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headViewww"];

    //设置代理
    m_layout.itemSize = CGSizeMake(width(self.view)/3-2, width(self.view)/3+15);
    m_CollView.delegate = self;
    m_CollView.dataSource = self;
    
    [self.view addSubview:m_CollView];
    [self buildBlackView];
    
    
    
    
}



#pragma mark---collectionViewDELEGATE


//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 24;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *identify = @"cell";
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell1" forIndexPath:indexPath];
//    [cell sizeToFit];
    if (!cell) {
//        cell = [[MainCollectionViewCell alloc]init];
    }
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 6.0;
    cell.layer.borderWidth = 1.0;
//    cell.layer.borderColor = [[UIColor blackColor] CGColor];
    cell.numLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row+7];
    cell.leftImageView.image = KUIImage(@"排名色块小");
    cell.MainImageView.image = KUIImage(@"1.jpg");
    NSLog(@"%@",cell);
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *titleView;
    
    if (kind == UICollectionElementKindSectionHeader) {
        titleView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headViewww" forIndexPath:indexPath];
        [(TopView *)titleView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(customViewDidClick:)]];
        
        }
    return titleView;

        

    return titleView;
}



//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {0,0,0,0};//{5,5,5,5};
    return top;
}

//设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={width(self.view),width(self.view)+55};
    return size;
}
//设置元素大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
////    if (indexPath.row==0) {
////        return CGSizeMake(width(self.view)/3*2-10, width(self.view)/3*2-10);
////    }
//    
//    return CGSizeMake(width(self.view)/3, width(self.view)/3+10 );
//}


-(void)customViewDidClick:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        ccButton.frame =CGRectMake(0, 400, 307, 72);
        
    } completion:^(BOOL finished) {
    }];
    ccButton.tag = 100;
    
    blackImageView.hidden = NO;
    ccButton.hidden = NO;
    ccButton.constellationLab.text = @"白羊座";
    ccButton.constellationImg.image = KUIImage(@"白羊座");
    ccButton.nameLab.text = @"昵称:奥妮克希亚";
    ccButton.lineLab.text = @"you can do it no zuo no die why you try?";
    // 透明界面出现  添加点击手势
    [blackImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didHiddenBlView:)]];

}



//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor yellowColor];
    [UIView animateWithDuration:0.5 animations:^{
        ccButton.frame =CGRectMake(0, 400, 307, 72);
        
    } completion:^(BOOL finished) {
    }];
    ccButton.tag = 100+indexPath.row+7;
    
    blackImageView.hidden = NO;
    ccButton.hidden = NO;
    ccButton.constellationLab.text = @"白羊座";
    ccButton.constellationImg.image = KUIImage(@"白羊座");
    ccButton.nameLab.text = @"昵称:奥妮克希亚";
    ccButton.lineLab.text = @"you can do it no zuo no die why you try?";
    // 透明界面出现  添加点击手势
    [blackImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didHiddenBlView:)]];

}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)buildBlackView
{
    blackImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    blackImageView.image = [UIImage imageNamed:@"blackView"];
    blackImageView.hidden = YES;
    blackImageView.userInteractionEnabled = YES;
    [self.view addSubview:blackImageView];
    
    ccButton = [[AddButton alloc]initWithFrame:CGRectMake(-307, 400, 307, 72)];
    
    
    
    //    ccButton.backgroundColor = [UIColor clearColor];
//    [ccButton setImage:[UIImage imageNamed:@"btimg"] forState:UIControlStateNormal];
    [ccButton addTarget:self action:@selector(didClickTap:) forControlEvents:UIControlEventTouchUpInside];
    ccButton.hidden = YES;
    [blackImageView addSubview:ccButton];
}


//点击显示菜单栏

-(void)didClickTap:(UIButton *)sender
{
    NSLog(@"%ld",(long)ccButton.tag);
    MineViewController *mineView = [[MineViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:self];
    nav.navigationBarHidden= YES;
    
    [nav pushViewController:mineView animated:YES];
    
//    [self presentViewController:mineView animated:YES completion:^{
    
//    }];
    
    
}

//点击隐藏遮罩层 显示主页面
-(void)didHiddenBlView:(UIGestureRecognizer*)sender
{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        ccButton.frame =CGRectMake(-307, 400, 307, 72);
        
        
    } completion:^(BOOL finished) {
    }];
    blackImageView.hidden = YES;
    ccButton.hidden = YES;
    //透明遮罩隐藏 remove手势
    [blackImageView removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didHiddenBlView:)]];
    
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
