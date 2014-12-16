//
//  MineViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/11.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self buildTopviewWithBackButton:YES title:@"西门吹雪" rightImage:@""];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self buildFirstView];
    
    
    
}

//创建第一条
-(void)buildFirstView
{
    UIView * blackView =[[ UIView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44+1, KScreenWidth, KScreenWidth/2-30)];
    blackView.backgroundColor =[ UIColor blackColor];
    [self.view addSubview:blackView];
    
    //头像
    UIImageView *headImgView =[[ UIImageView alloc]initWithFrame:CGRectMake(47, 30, 80, 80)];
    headImgView.image = KUIImage(@"1.jpg");
    [blackView addSubview:headImgView];
    
    //星座图标
    UIImageView * xzImgViwe = [[UIImageView alloc]initWithFrame:CGRectMake(sx(headImgView)+10, 35, 30, 30)];
    xzImgViwe.image = KUIImage(@"ys_c_sp");
    [blackView addSubview:xzImgViwe];
    
    //星座LB
    UILabel *xzLabel = [[UILabel alloc]initWithFrame:CGRectMake(sx(xzImgViwe)+10, 40, 50, 20)];
    xzLabel.textColor = [UIColor whiteColor];
    xzLabel.font = [UIFont boldSystemFontOfSize:15];
    xzLabel.backgroundColor = [UIColor clearColor];
    xzLabel.text = @"水瓶座";
    [blackView addSubview:xzLabel];
    
    
    //年龄LB
    UILabel *ageLabel = [self buildLabelWithFrame:CGRectMake(sx(xzLabel)+10, 40, 30, 20) backgroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter text:@"22"];
    [blackView addSubview:ageLabel];
    
    
    
    //签名LB
    UILabel * qmLabel = [self buildLabelWithFrame:CGRectMake(sx(headImgView)+10, sy(xzImgViwe), 200, 20) backgroundColor:[UIColor clearColor] textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentLeft text:@"no zuo no die why you try?"];
    [blackView addSubview:qmLabel];
    
    
    UIButton * button1= [[UIButton alloc]initWithFrame:CGRectMake(0, height(blackView)-40, width(blackView)/2, 40)];
    
    button1.backgroundColor = [UIColor clearColor];
    [button1 setTitle:@"粉丝 205" forState:UIControlStateNormal];
    [blackView addSubview:button1];
    
    UIButton * button2= [[UIButton alloc]initWithFrame:CGRectMake(width(blackView)/2, height(blackView)-40, width(blackView)/2, 40)];
    
    button2.backgroundColor = [UIColor clearColor];
    [button2 setTitle:@"关注 250" forState:UIControlStateNormal];
    [blackView addSubview:button2];
    
    
    
    
}


-(void)buildPhotosWall
{
    
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
