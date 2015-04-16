//
//  BdViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BdViewController.h"
#import "BDContent.h"
@interface BdViewController ()
{
    UIImageView *blueImageView;
    UIScrollView *scrollView;
    UIView * starView;
    UIImageView * starImageView;
    NSMutableArray *ysArr;
    UIButton *rightBtn;
    UIScrollView *constellationScrl;
    NSMutableArray * cArray; //选择星座
    NSMutableArray * xArray; //星座
//    UIScrollView *txScr;
    NSString *textStr;
    NSInteger strLenth;
    NSInteger textHeight1;
    NSInteger textHeight2;
    NSInteger textHeight3;
    
    
    NSMutableParagraphStyle *paragraphStyle;
    NSDictionary *attributes;
//    UITableView *conth
}
@end

@implementation BdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:NO title:@"星座宝典" rightImage:@""];
//    self.view.backgroundColor = [UIColor blackColor];
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-60, KISHighVersion_7?20:0, 60, 44)];
    
    [rightBtn setTitle:@"白羊座" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    rightBtn.backgroundColor = [UIColor 3redColor];
    [rightBtn addTarget:self action:@selector(changeXing:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];

    cArray = [NSMutableArray array];
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"ys_c_by",@"ys_c_chunv",@"ys_c_jinniu",@"ys_c_juxie",@"ys_c_mojie",@"ys_c_sheshou",@"ys_c_shizi",@"ys_c_sp",@"ys_c_sy",@"ys_c_sz",@"ys_c_tc",@"ys_c_tx", nil];
    [cArray addObjectsFromArray:arr2];
    
    xArray = [NSMutableArray array];
    
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"白羊",@"处女",@"金牛",@"巨蟹",@"摩羯",@"射手",@"狮子",@"水瓶",@"双鱼",@"双子",@"天秤",@"天蝎",nil];
    [xArray addObjectsFromArray:arr1];

    
    scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, self.view.bounds.size.height*100)];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 0);
    scrollView.backgroundColor=  [UIColor clearColor];
    scrollView.pagingEnabled = YES;
//    scrollView.userInteractionEnabled = NO;

    
    [self.view addSubview:scrollView];
    [BDContent WithStar:@"白羊座"];
    
    
    NSArray * titleArr = [NSArray arrayWithObjects:@"传说",@"特点",@"爱情", nil];
    
    blueImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 108, self.view.bounds.size.width/3, 2)];
    blueImageView.backgroundColor = UIColorFromRGBA(0x1cb4f6, 1);
    [self.view addSubview:blueImageView];
    
    for (int i = 0;  i <3; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/3*i, 64, self.view.bounds.size.width/3, 44)];
        
        [button setBackgroundImage:[UIImage imageNamed:@"灰色底框"] forState:UIControlStateNormal];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        switch (i) {
            case 0:
                [button setTitleColor:UIColorFromRGBA(0x1bb5f5, 1) forState:UIControlStateNormal];
                break;
            case 1:
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                break;
            case 2:
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                break;
    
            default:
                break;
        }
        
        
        [button addTarget:self action:@selector(changeScroll:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i;
        [self.view addSubview:button];
        
        if (button.tag ==100) {
            [button setTitleColor:UIColorFromRGBA(0x1bb5f5, 1) forState:UIControlStateNormal];
        }
        

        UIScrollView *txScr = [[UIScrollView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, KScreenHeight-64-44)];
        txScr.showsHorizontalScrollIndicator = NO;
        txScr.showsVerticalScrollIndicator = NO;
        txScr.backgroundColor = [UIColor whiteColor];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, width(self.view)-30, (width(self.view)-30)/69*37)];
        imgView.tag = 19999+i;
         NSString *sss1 = [NSString stringWithFormat:@"img%d",i+1];
        NSString *headimgStr =KISDictionaryHaveKey(KISDictionaryHaveKey([BDContent WithStar:@"白羊座"],@"img" ), sss1);
        NSLog(@"pppppp     %@",headimgStr);
        imgView.image =KUIImage(headimgStr);
        
        [txScr addSubview:imgView];
        
        paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;// 字体的行间距

        attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:15],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        NSString *sss = [NSString stringWithFormat:@"content%d",i+1];

        textStr = KISDictionaryHaveKey([BDContent WithStar:@"白羊座"],sss );

        CGSize titleSize = [textStr boundingRectWithSize:CGSizeMake(KScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;

        
        [self getTextHeight:textStr];
        
        
        UILabel *txV = [[UILabel alloc]initWithFrame:CGRectMake(20, (width(self.view)-30)/69*37+30, width(txScr)-40, textHeight1*30+50)];
        [txV  sizeThatFits:titleSize];
        txV.backgroundColor = [UIColor whiteColor];
        txV.textColor = [UIColor blackColor];
        txV.font = [UIFont systemFontOfSize:15];
        txV.tag = 1999+i;
//        txV.textAlignment = UITextAlignmentRight;
        txV.adjustsFontSizeToFitWidth = YES;
        txV.numberOfLines = 0;
//        txV.delegate = self;
//        txV.scrollEnabled = NO;
//        txV.editable = NO;
        txV.userInteractionEnabled = NO;
        txV.attributedText = [[NSAttributedString alloc] initWithString:textStr attributes:attributes];

        [txScr addSubview:txV];
//self.view.bounds.size.width/3
        txScr.contentSize = CGSizeMake(0, textHeight1*30+self.view.bounds.size.width/3+150);
        [scrollView addSubview:txScr];
    }
    self.hud = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:self.hud];
    self.hud.labelText = @"加载中...";
    
    ysArr = [NSMutableArray arrayWithObjects:@"白羊座",@"处女座",@"金牛座",@"巨蟹座",@"摩羯座",@"射手座",@"狮子座",@"水瓶座",@"双鱼座",@"双子座",@"天秤座",@"天蝎座", nil];
    [self buildconstellationScroll];
    
//    [self buildYsView];
//    [self.leftButton addTarget:self action:@selector(gotoMenu:) forControlEvents:UIControlEventTouchUpInside];
    
}
//得到文本高度
-(CGFloat)getTextHeight:(NSString *)str
{

    NSString *subString = @"\n";
    NSArray *array = [str componentsSeparatedByString:subString];
//    NSLog(@"^^^^^^^^^^^^^^^^    %ld",array.count);
    NSInteger count = [array count] - 1;
//    NSLog(@"888888     %ld",str.length);
    if ((unsigned long)KScreenWidth==375) {
        //6
        textHeight1 = (str.length+count*12)/24;
    }else if ((unsigned long)KScreenWidth==320){
        //4
        textHeight1 = (str.length+count*10)/20;
    }else if((unsigned long)KScreenWidth==414){
        //6p
        textHeight1 = (str.length+count*13)/26;
        
    }else{
        //5
        textHeight1 = (str.length+count*10)/20;
        
    }
    int i = 0;
    NSLog(@"==========%d     %ld",i,textHeight1);
    i++;
    return textHeight1;
}




-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self getInfoFromNetWithStar:@"1"];

}

-(void)buildconstellationScroll
{
    constellationScrl = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -16, KScreenWidth, 80)];
    constellationScrl.contentSize = CGSizeMake(600, 0);
    constellationScrl.backgroundColor = UIColorFromRGBA(0x2f2f2f, 1);
//    constellationScrl.backgroundColor = [UIColor yellowColor];

    [self.view addSubview:constellationScrl];
    
    for (int i = 0; i<12; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50*i+10, 0, 50, 50)];
        button.tag = 1000+i;
        [button setImage:KUIImage(cArray[i]) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changeConstellation:) forControlEvents:UIControlEventTouchUpInside];
        [constellationScrl addSubview:button];
        
        UILabel *lb= [[UILabel alloc]initWithFrame:CGRectMake(50*i+10, 50, 50, 30)];
        lb.backgroundColor = [UIColor clearColor];
        lb.textColor = [UIColor whiteColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.text = xArray[i];
        lb.font = [UIFont systemFontOfSize:15];
        [constellationScrl addSubview:lb];
        
        
    }
    constellationScrl.hidden = YES;
    
}




//点击星座选择button方法
-(void)changeConstellation:(UIButton *)sender
{
    if (constellationScrl.hidden ==NO) {
        [UIView animateWithDuration:0.3 animations:^{
            constellationScrl.frame = CGRectMake(0, -16, KScreenWidth, 80);
//            scr.frame = CGRectMake(0, 64, KScreenWidth, KScreenHeight-64);
            
        } completion:^(BOOL finished) {
            constellationScrl. hidden =YES;
            [rightBtn setTitle:[NSString stringWithFormat:@"%@座",xArray[sender.tag-1000]] forState:UIControlStateNormal];

        }];
    }    
    [self getInfoFromNetWithStar:[xArray[sender.tag-1000] stringByAppendingString:@"座"]];
    
    /*
     后续添加 选择星座方法 并且添加网络请求 更换星座数据
     
     */
    
    
}

-(void)getInfoFromNetWithStar:(NSString *)star
{

//    NSLog(@"0000000     %@",star);
    NSDictionary *dic = [BDContent WithStar:star];
    UILabel *text1 = (UILabel *)[self.view viewWithTag:1999+0];
    UILabel *text2 = (UILabel *)[self.view viewWithTag:1999+1];
    UILabel *text3 = (UILabel *)[self.view viewWithTag:1999+2];

    for (int i =0; i<3; i++) {
        UIImageView *image = (UIImageView *)[self.view viewWithTag:19999+i];
        NSString *sss1 = [NSString stringWithFormat:@"img%d",i+1];
        NSString *headimgStr =KISDictionaryHaveKey(KISDictionaryHaveKey([BDContent WithStar:star],@"img" ), sss1);
        NSLog(@"------------%@",headimgStr);
        image.image =KUIImage(headimgStr);

    }

    UIScrollView *scr1 = (UIScrollView*)text1.superview;
    UIScrollView *scr2 = (UIScrollView*)text2.superview;
    UIScrollView *scr3 = (UIScrollView*)text3.superview;
    
    
    text1.text = KISDictionaryHaveKey(dic, @"content1");
    text2.text = KISDictionaryHaveKey(dic, @"content2");
    text3.text = KISDictionaryHaveKey(dic, @"content3");

    
    CGSize size1 = [self labelAutoCalculateRectWith:text1.text FontSize:15 MaxSize:CGSizeMake(self.view.bounds.size.width-40, 30000)];
    CGSize size2 = [self labelAutoCalculateRectWith:text2.text FontSize:15 MaxSize:CGSizeMake(self.view.bounds.size.width-40, 30000)];
    CGSize size3 = [self labelAutoCalculateRectWith:text3.text FontSize:15 MaxSize:CGSizeMake(self.view.bounds.size.width-40, 30000)];
    
    
    text1.frame = CGRectMake(20, (width(self.view)-30)/69*37+30, width(self.view)-40, size1.height);
    text2.frame = CGRectMake(20, (width(self.view)-30)/69*37+30, width(self.view)-40, size2.height);
    text3.frame = CGRectMake(20, (width(self.view)-30)/69*37+30, width(self.view)-40, size3.height);
    
    
    scr1.contentSize = CGSizeMake(0, size1.height+(width(self.view)-30)/69*37+40);
    scr2.contentSize = CGSizeMake(0, size2.height+(width(self.view)-30)/69*37+40);
    scr3.contentSize = CGSizeMake(0, size3.height+(width(self.view)-30)/69*37+40);
    

}



//更改星座
-(void)changeXing:(UIButton *)sender
{

    if (constellationScrl.hidden) {
        constellationScrl.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            constellationScrl.frame = CGRectMake(0, startX, KScreenWidth, 80);

        } completion:^(BOOL finished) {
        }];

    }else{
        constellationScrl.hidden = YES;
        [UIView animateWithDuration:0.3 animations:^{
            constellationScrl.frame = CGRectMake(0, -startX, KScreenWidth, 80);

            
        } completion:^(BOOL finished) {
        }];
  
    }
    

    
}
-(void)changeTitle:(UIButton *)sender
{
    UIButton *button = (UIButton *)[self.view viewWithTag:sender.tag];
    [rightBtn setTitle:button.titleLabel.text forState:UIControlStateNormal];
    
    [self getInfoFromNetWithStar:[NSString stringWithFormat:@"%ld",(long)sender.tag-999]];
    
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
        [button1 setTitleColor:UIColorFromRGBA(0x1bb5f5, 1) forState:UIControlStateNormal];
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
        [button2 setTitleColor:UIColorFromRGBA(0x1bb5f5, 1) forState:UIControlStateNormal];
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
        [button3 setTitleColor:UIColorFromRGBA(0x1bb5f5, 1) forState:UIControlStateNormal];
        
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
    return @"baodian";
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%f",scrollView.contentOffset.y);
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
