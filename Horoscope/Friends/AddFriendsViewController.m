//
//  AddFriendsViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "AddFriendsViewController.h"

@interface AddFriendsViewController ()

@end

@implementation AddFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self buildTopviewWithBackButton:NO title:@"添加好友" rightImage:@""];
    
    
    UITextField *tf= [[ UITextField alloc]initWithFrame:CGRectMake(10, KISHighVersion_7?74:54, KScreenWidth-70, 34)];
    tf.placeholder = @"通过星缘号查找";
    [self.view addSubview:tf];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(sx(tf)+10, 10, 50, 30);
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    NSArray *imgArr = [NSArray arrayWithObjects:@"shouji",@"weixin",@"QQ",@"weibo", nil];
    NSArray *textArr = [NSArray arrayWithObjects:@"通讯录好友",@"微信好友",@"QQ好友",@"微博好友", nil];
    for (int i = 0; i<4; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, sy(tf)+i*80, KScreenWidth, 80)];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 60, 60)];
        imageView.image = KUIImage(imgArr[i]);
        [view addSubview:imageView];
        
        UILabel *lb = [self buildLabelWithFrame:CGRectMake(sx(imageView)+10, 0, 200, 60) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentLeft text:nil];
        [view addSubview:lb];
        [self.view addSubview:view];
        lb.text = textArr[i];
        
    }
    
    
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
