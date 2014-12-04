//
//  TodayLuckViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "TodayLuckViewController.h"

@interface TodayLuckViewController ()
{
    UIScrollView * constellationScrl;
}
@end

@implementation TodayLuckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTopviewWithBackButton:YES title:@"今日运势" rightImage:@""];
    
    UIScrollView *scr = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    scr.backgroundColor = [UIColor whiteColor];
    scr.contentSize = CGSizeMake(0, 188+64+139+400);
    [self.view addSubview:scr];
    
    UIImageView *imageView1 =[[ UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
    imageView1.image = [UIImage imageNamed:@"todayYs"];
    [scr addSubview:imageView1];
    
    imageView1.userInteractionEnabled = YES;
    
    /*
     点击更换星座
     */
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    button.center = CGPointMake(width(self.view)/2, 50);
    button.backgroundColor = [UIColor clearColor];
    
    [button addTarget:self action:@selector(chooseConstellation:) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView1 addSubview:button];
    
    
    
    
    
    
    
    
    UIImageView *imageView2 =[[ UIImageView alloc]initWithFrame:CGRectMake(0,188, self.view.bounds.size.width, 139)];
    imageView2.image = [UIImage imageNamed:@"todayYs2"];
    [scr addSubview:imageView2];
    
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 188+139, self.view.bounds.size.width-40, 400)];
    textView.text = @"概述：\n       冲动、爱冒险、慷慨、天不怕地不怕，而且一旦下定决心，排除万难的要达到目的。大部分属于白羊座的人的脾气都很差，不过只是炮仗颈，绝对不会放在心上，很快便会没有事，而记仇的天蝎座便正好是白羊座的相反。白羊座是黄道第一宫，因此他最喜欢成为第一的强者星座，另外，火星掌管白羊座，他们必须燃起熊熊的烈火，否则人生黯然无光。白羊座就像小孩子一样，直率、热情、冲动，但也十分的自我为中心和孩子气。白羊座的男人都是典型的大男人主义者，一定要靠自己要开创自己的成功";
    textView.userInteractionEnabled = NO;
    textView.font = [UIFont systemFontOfSize:16];
    
    [scr addSubview:textView];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.leftButton addTarget:self action:@selector(gotoMenu:) forControlEvents:UIControlEventTouchUpInside];
    
}

/*
 创建 星座列表
 */

-(void)buildconstellationScroll
{
    constellationScrl = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 80)];
    constellationScrl.contentSize = CGSizeMake(1000, 0);
    [self.view addSubview:constellationScrl];
    
    for (int i = 0; i<12; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(80*i+10, 0, 80, 80)];
        button.tag = 1000+i;
        [button setImage:KUIImage(@"") forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changeConstellation:) forControlEvents:UIControlEventTouchUpInside];
        [button addSubview:constellationScrl];
        button.backgroundColor = [UIColor greenColor];
        
    }
    constellationScrl.hidden = YES;
    
}

//点击星座选择button方法
-(void)changeConstellation:(UIButton *)sender
{
    constellationScrl.hidden = YES;
    
/*
 后续添加 选择星座方法 并且添加网络请求 更换星座数据
 
 */
    
    
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

/*
 
 更换星座方法
 */

-(void)chooseConstellation:(UIButton *)sender
{
    constellationScrl.hidden = NO;
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
