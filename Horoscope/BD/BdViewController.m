//
//  BdViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BdViewController.h"

@interface BdViewController ()
{
    UIImageView *blueImageView;
    UIScrollView *scrollView;
    UIView * starView;
    UIImageView * starImageView;
    NSMutableArray *ysArr;
    UIButton *rightBtn;
}
@end

@implementation BdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:NO title:@"星座宝典" rightImage:@""];
   
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-60, KISHighVersion_7?20:0, 60, 44)];
    
    [rightBtn setTitle:@"白羊座" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    rightBtn.backgroundColor = [UIColor 3redColor];
    [rightBtn addTarget:self action:@selector(changeXing:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];

    
    
    scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, self.view.bounds.size.height-110)];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*3, 0);
    scrollView.pagingEnabled = YES;
    scrollView.userInteractionEnabled = NO;
    [self.view addSubview:scrollView];
    
    
    
    NSArray *arr= [ NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    
    NSArray * titleArr = [NSArray arrayWithObjects:@"传说",@"特点",@"爱情", nil];
    
    blueImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 108, self.view.bounds.size.width/3, 2)];
    blueImageView.image = [UIImage imageNamed:@"蓝色进度条(＃1cb4f6)"];
    [self.view addSubview:blueImageView];
    
    for (int i = 0;  i <3; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/3*i, 64, self.view.bounds.size.width/3, 44)];
        
        [button setBackgroundImage:[UIImage imageNamed:@"灰色底框"] forState:UIControlStateNormal];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changeScroll:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i;
        [self.view addSubview:button];
        
        if (button.tag ==100) {
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
        
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-44)];
//        imageView.image = [UIImage imageNamed:arr[i]];
//        [scrollView addSubview:imageView];
        
        UITextView *txV = [[UITextView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-44)];
        txV.backgroundColor = [UIColor grayColor];
        txV.textColor = [UIColor redColor];
        txV.font = [UIFont systemFontOfSize:16];
        txV.tag = 1999+i;
        [scrollView addSubview:txV];
    }
    self.hud = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:self.hud];
    self.hud.labelText = @"加载中...";
    [self getInfoFromNetWithStar:@"1"];
    
    ysArr = [NSMutableArray arrayWithObjects:@"白羊座",@"处女座",@"金牛座",@"巨蟹座",@"摩羯座",@"射手座",@"狮子座",@"水瓶座",@"双鱼座",@"双子座",@"天秤座",@"天蝎座", nil];
    [self buildYsView];
//    [self.leftButton addTarget:self action:@selector(gotoMenu:) forControlEvents:UIControlEventTouchUpInside];
    
}
//- (void)gotoMenu:(UIGestureRecognizer * )ges
//{
//    if ([self.sideMenuController isMenuVisible]) {
//        [self.sideMenuController hideMenuAnimated:YES];
//    }else
//    {
//        [self.sideMenuController showMenuAnimated:YES];
//    }
//    
//    
//}
-(void)buildYsView
{
    starView = [[UIView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, KScreenHeight-(KISHighVersion_7?64:44))];
    starView.backgroundColor = kColorWithRGB(0, 0, 0, 0.5);
    starView.hidden = YES;
    [self.view addSubview:starView];
    
    starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 432)];
    starImageView.image = KUIImage(@"ys_c_down");
    starImageView.center = CGPointMake(KScreenWidth, 216);
    starImageView.userInteractionEnabled = YES;
    [starView addSubview:starImageView];
    
    
    for (int i = 0; i<12; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, i*36, 100, 36)];
        [btn setTitle:ysArr[i] forState:UIControlStateNormal];
        [btn setTag: 1000+i];
        [btn addTarget:self action:@selector(changeTitle:) forControlEvents:UIControlEventTouchUpInside];
        [starImageView addSubview:btn];
    }
    
    
}

-(void)getInfoFromNetWithStar:(NSString *)star
{
//    NSString *urlStr=[NSString string];
    [self.hud show:YES];
    NSString *urlStr = [NSString stringWithFormat:@"http://120.131.70.218/book.php?name=%@",star];
//    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"urlstr---%@",urlStr);

[[AFHTTPSessionManager manager]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    [self.hud hide:YES];
        NSLog(@"responseObject -- %@",responseObject);
    if (![responseObject isKindOfClass:[NSDictionary class]]) {
        return ;
    }
    NSDictionary *dic = responseObject;
    UITextView *text1 = (UITextView *)[self.view viewWithTag:1999+0];
    UITextView *text2 = (UITextView *)[self.view viewWithTag:1999+1];
    UITextView *text3 = (UITextView *)[self.view viewWithTag:1999+2];
    text1.text = KISDictionaryHaveKey(dic, @"content1");
    text2.text = KISDictionaryHaveKey(dic, @"content2");
    text3.text = KISDictionaryHaveKey(dic, @"content3");
    
    
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self.hud hide:YES];
        [self showAlertViewWithtitle:@"提示" message:@"请求失败"];
    }];
}

//更改星座
-(void)changeXing:(UIButton *)sender
{
    starView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        starImageView.center = CGPointMake(KScreenWidth-50, 216);
    } completion:^(BOOL finished) {
        [starView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenYsView:)]];
    }];

}
-(void)changeTitle:(UIButton *)sender
{
    UIButton *button = (UIButton *)[self.view viewWithTag:sender.tag];
    [rightBtn setTitle:button.titleLabel.text forState:UIControlStateNormal];
    
    [self getInfoFromNetWithStar:[NSString stringWithFormat:@"%ld",(long)sender.tag-1000]];
    
    starView.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        starImageView.center = CGPointMake(KScreenWidth, 216);
    } completion:^(BOOL finished) {
        [starView removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenYsView:)]];
    }];

}
-(void)hiddenYsView:(id)sender
{
    starView.hidden = YES;

    [UIView animateWithDuration:0.3 animations:^{
        starImageView.center = CGPointMake(KScreenWidth,216);
    } completion:^(BOOL finished) {
        [starView removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenYsView:)]];
    }];
}


-(void)changeScroll:(UIButton *)sender
{
    if (sender.tag ==100) {
        UIButton *button1 = (UIButton *)[self.view viewWithTag:100];
        [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        UIButton *button2 = (UIButton *)[self.view viewWithTag:101];
        [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        UIButton *button3 = (UIButton *)[self.view viewWithTag:102];
        [button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^{
            blueImageView.frame = CGRectMake(0, 108, self.view.bounds.size.width/3, 2);
            scrollView.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
        }];
        
        
    }else if (sender.tag ==101)
    {
        UIButton *button1 = (UIButton *)[self.view viewWithTag:100];
        [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        UIButton *button2 = (UIButton *)[self.view viewWithTag:101];
        [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        UIButton *button3 = (UIButton *)[self.view viewWithTag:102];
        [button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^{
            blueImageView.frame = CGRectMake(self.view.bounds.size.width/3, 108, self.view.bounds.size.width/3, 2);
            scrollView.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
        } completion:^(BOOL finished) {
        }];
        
        
    }
    else if (sender.tag==102)
    {
        UIButton *button1 = (UIButton *)[self.view viewWithTag:100];
        [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        UIButton *button2 = (UIButton *)[self.view viewWithTag:101];
        [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        UIButton *button3 = (UIButton *)[self.view viewWithTag:102];
        [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^{
            blueImageView.frame = CGRectMake(self.view.bounds.size.width/3*2, 108, self.view.bounds.size.width/3, 2);
            scrollView.contentOffset = CGPointMake(self.view.bounds.size.width*2, 0);
        } completion:^(BOOL finished) {
        }];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"星座宝典";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"baodian.png";
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
