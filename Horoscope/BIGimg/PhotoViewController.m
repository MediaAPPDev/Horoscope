//
//  PhotoViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/16.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView =[[ UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(KScreenWidth*self.photoArray.count, 0);
    scrollView.contentOffset = CGPointMake(KScreenWidth*self.num, 0);
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    
    
    for (int i = 0; i<self.photoArray.count; i++) {
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth*i, 0, KScreenWidth, KScreenHeight)];
        imageView.image = KUIImage(self.photoArray[i]);
        
        CGFloat imgW = imageView.image.size.width;
        CGFloat imgH = imageView.image.size.height;
        CGFloat imgViewWid ;
        CGFloat imgViewHie;
        
        //判断图片实际大小是否大于屏幕尺寸 如果大于则定其宽度等于屏幕宽度 等比缩放图片
        if (imgW>KScreenWidth) {
            imgViewWid = KScreenWidth;
            imgViewHie = KScreenWidth * imgH/imgW;
        }else{
            imgViewWid = imgW;
            imgViewHie = imgH;
        }
        
        imageView.frame = CGRectMake(0, 0, imgViewWid, imgViewHie);
        imageView.userInteractionEnabled = YES;
        imageView.center = CGPointMake(KScreenWidth *i+KScreenWidth/2, KScreenHeight/2);
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backView)]];
        [scrollView addSubview:imageView];
    }
    
    
    // Do any additional setup after loading the view.
}
-(void)backView
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
