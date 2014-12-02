//
//  BaseViewController.m
//  Demo4
//
//  Created by Satellite on 14/11/27.
//  Copyright (c) 2014年 Satellite. All rights reserved.
//

#import "BaseViewController.h"
#import "JDSideMenu.h"
#import "MenuViewController.h"
#import "MainViewController.h"
//#import "UIViewController+JDSideMenu.h"
//#import "JDSideMenu.h"
@implementation BaseViewController


/*
 创建tabbar头条快捷方式
 */
-(void)buildTopviewWithBackButton:(BOOL)isHave title:(NSString *)title rightImage:(NSString *)rightImage
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    imageView.backgroundColor = [UIColor colorWithRed:0/225.0f green:0/225.0f blue:0/225.0f alpha:1];
    imageView.image =[UIImage imageNamed:@""];
    imageView.userInteractionEnabled =  YES;
    [self.view addSubview:imageView];
    
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, self.view.bounds.size.width-140, 44)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, self.view.bounds.size.width-140, 44)];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:22];
    label.textAlignment =NSTextAlignmentCenter;
    label.backgroundColor= [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    
    [imageView addSubview:label];
    
    
    _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 60, 44)];
    [_leftButton setImage:[UIImage imageNamed:@"emnu.png"] forState:UIControlStateNormal];
    [imageView addSubview:_leftButton];
    
    
//    [leftButton addTarget:self action:@selector(tapTheLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, 20, 60, 44)];
    
    [rightButton setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    if (isHave) {
        rightButton.hidden = NO;
    }else{
        rightButton.hidden = YES;
    }
    [imageView addSubview:rightButton];
    
    [self.leftButton addTarget:self action:@selector(gotoMenu:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)gotoMenu:(UIGestureRecognizer * )ges
{
    if ([self.sideMenuController isMenuVisible]) {
        [self.sideMenuController hideMenuAnimated:YES];
    }else
    {
        [self.sideMenuController showMenuAnimated:YES];
    }
    
    
}
//- (void)tapTheLeftButton:(UIGestureRecognizer *)gesture
//{
//    
////  <#condition#>) {
////        <#statements#>  if (
////    }
////    JDSideMenu * sideMenu =[[JDSideMenu alloc]init];
////    
////    
////    
////   [ sideMenu showMenuAnimated:YES];
//
//    
//}

-(void)buildScrollViewWithFrame:(CGRect)frame contentSize:(CGSize)size Image:(NSString *)image
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = size;
    [self.view addSubview:scrollView];
    
    UIImageView *imageView =[[ UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, size.height)];
    imageView.image = [UIImage imageNamed:image];
    [scrollView addSubview:imageView];
}
@end
