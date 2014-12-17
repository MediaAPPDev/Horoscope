//
//  ChangeViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self buildTopviewWithBackButton:NO title:@"修改" rightImage:@""];
    
    [self setTopViewWithTitle:@"修改" withBackButton:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, KISHighVersion_7?20:0, 60, 44)];
//    [button setImage:KUIImage(@"123123") forState:UIControlStateNormal];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backToLastPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UITextField *tf =[[UITextField alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth-40, 40)];
    tf.center = CGPointMake(KScreenWidth/2, (KISHighVersion_7?64:44)+40);
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.text = self.contentStr;
    [self.view addSubview:tf];
    
    
    
    // Do any additional setup after loading the view.
}


-(void)backToLastPage:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
