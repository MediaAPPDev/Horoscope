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
    UIScrollView *scr;
    
    NSMutableArray * cArray; //选择星座
    NSMutableArray * xArray; //星座
    
    UIButton *starButton;
    UILabel *nameLabel;
    UILabel * dateLabel;
    UIButton * titleBtn;
    UIView *ysView;
    UIImageView * ysImgView;
    NSArray *ysArr;
    
    NSString * dateStr;//日期
    NSString * StarStr;//星座
    
    UITextView *ysTextView;//正文介绍
    
    UIImageView * zhImgeView;//综合Img
    UIImageView * loveImgView;//爱情
    UIImageView * workImgView;//工作
    UIImageView * moneyImgView;//财运
    UIImageView * healthLabel;//健康
    UILabel     * colorLabel;//幸运色
    UILabel     * numLabel;//幸运数字
    UILabel     * spStarLabel;//速配星座
    
    UIView *customysView;
    
}
@end

@implementation TodayLuckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ysArr =[ NSArray arrayWithObjects:@"今日运势",@"明日运势",@"本周运势",@"本月运势", nil];

    cArray = [NSMutableArray array];
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"ys_c_by",@"ys_c_chunv",@"ys_c_jinniu",@"ys_c_juxie",@"ys_c_mojie",@"ys_c_sheshou",@"ys_c_shizi",@"ys_c_sp",@"ys_c_sy",@"ys_c_sz",@"ys_c_tc",@"ys_c_tx", nil];
    [cArray addObjectsFromArray:arr];
    
    xArray = [NSMutableArray array];
    
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"白羊",@"处女",@"金牛",@"巨蟹",@"摩羯",@"射手",@"狮子",@"水瓶",@"双鱼",@"双子",@"天秤",@"天蝎",nil];
    [xArray addObjectsFromArray:arr1];

    
    
    [self buildconstellationScroll];

    [self buildYsView];

    
    [self buildTopviewWithBackButton:YES title:@"" rightImage:@""];
    titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, KISHighVersion_7?20:0, KScreenWidth-100, 40)];
    [titleBtn setTitle:@"今日运势" forState:UIControlStateNormal];
    titleBtn.backgroundColor =[ UIColor clearColor];
    [titleBtn addTarget:self action:@selector(changeTitle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:titleBtn];
    
    
    
    
    scr = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    scr.backgroundColor = [UIColor whiteColor];
    scr.contentSize = CGSizeMake(0, 188+64+139+400);
    [self.view addSubview:scr];
    
    UIImageView *imageView1 =[[ UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
    imageView1.userInteractionEnabled = YES;

    imageView1.image = [UIImage imageNamed:@"ys_c_Topbg"];
    [scr addSubview:imageView1];
    
    
    /*
     点击更换星座
     */
    starButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 57, 66)];
    starButton.center = CGPointMake(width(self.view)/2, 65);
    starButton.backgroundColor = [UIColor clearColor];
    [starButton setBackgroundImage:KUIImage(@"白羊") forState:UIControlStateNormal];
    [starButton addTarget:self action:@selector(chooseConstellation:) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView1 addSubview:starButton];
  
  /*
   **
   * nameLabel     ------ 星座名称
   * dateBgImgView ------ 星座时间背景图
   * dateLabel     ------ 星座时间
   */
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 20)];
    nameLabel.center = CGPointMake(KScreenWidth/2, 115);
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor  = [UIColor whiteColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:17];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"白羊座";
    [imageView1 addSubview:nameLabel];
    
    
    
    
    UIImageView *dateBgImgView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 88, 19)];
    dateBgImgView.image = KUIImage(@"ys_c_datebg");
    dateBgImgView.center = CGPointMake(KScreenWidth/2, 140);
    [imageView1 addSubview:dateBgImgView];
    
    dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 88, 19)];
    dateLabel.center = CGPointMake(KScreenWidth/2, 140);
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.textColor  = [UIColor whiteColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:13];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.text = @"4.19-5.19";
    [imageView1 addSubview:dateLabel];

    
    
    
//    UIImageView *imageView2 =[[ UIImageView alloc]initWithFrame:CGRectMake(0,188, self.view.bounds.size.width, 139)];
//    imageView2.image = [UIImage imageNamed:@"todayYs2"];
//    [scr addSubview:imageView2];
    [self buildCustomYSView];
    [self buildYsView];

    ysTextView = [[UITextView alloc]initWithFrame:CGRectMake(20, 188+139, self.view.bounds.size.width-40, 400)];
//    ysTextView.text = @"概述：\n       冲动、爱冒险、慷慨、天不怕地不怕，而且一旦下定决心，排除万难的要达到目的。大部分属于白羊座的人的脾气都很差，不过只是炮仗颈，绝对不会放在心上，很快便会没有事，而记仇的天蝎座便正好是白羊座的相反。白羊座是黄道第一宫，因此他最喜欢成为第一的强者星座，另外，火星掌管白羊座，他们必须燃起熊熊的烈火，否则人生黯然无光。白羊座就像小孩子一样，直率、热情、冲动，但也十分的自我为中心和孩子气。白羊座的男人都是典型的大男人主义者，一定要靠自己要开创自己的成功";
    ysTextView.userInteractionEnabled = NO;
    ysTextView.font = [UIFont systemFontOfSize:16];
    
    [scr addSubview:ysTextView];
    
    // Do any additional setup after loading the view, typically from a nib.
//    [self.leftButton addTarget:self action:@selector(gotoMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    dateStr = @"today";
    StarStr = @"白羊座";
    [self getInfoFromNetWithStar:StarStr date:dateStr];
    
}

/*
 **创建第二view
 综合 运势 健康 财运 爱情等
 
 */

-(void)buildCustomYSView
{
    
//背景
    customysView = [[UIView alloc]initWithFrame:CGRectMake(0, 188, width(self.view), width(self.view)*0.37f)];
    customysView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:customysView];
    
    
    zhImgeView =[ self buildTitleImgWithFrame:CGRectMake(30, 30, width(self.view)/2-30, 20) text:@"综合"];
    loveImgView =[ self buildTitleImgWithFrame:CGRectMake(30, 50, width(self.view)/2-30, 20) text:@"爱情"];
    workImgView =[ self buildTitleImgWithFrame:CGRectMake(30,70, width(self.view)/2-30, 20) text:@"工作"];
    moneyImgView =[ self buildTitleImgWithFrame:CGRectMake(30, 90, width(self.view)/2-30, 20) text:@"财运"];
    healthLabel =[ self buildTitleImgWithFrame:CGRectMake(width(self.view)/2+10, 30, width(self.view)/2-30, 20) text:@"健康"];
    
    colorLabel = [self buildTitleWithFrame:CGRectMake(width(self.view)/2+10, 50, width(self.view)/2-30, 20) text:@"幸运色:"];
    
    
     numLabel = [self buildTitleWithFrame:CGRectMake(width(self.view)/2+10, 70, width(self.view)/2-30, 20) text:@"幸运数字:"];
    
     spStarLabel = [self buildTitleWithFrame:CGRectMake(width(self.view)/2+10, 90, width(self.view)/2-30, 20) text:@"速配星座:"];
    
    
    [scr addSubview:customysView];
//综合
    
}

-(UILabel *)buildTitleWithFrame:(CGRect)frame text:(NSString *)text
{
    UIView *customView =[[ UIView alloc]initWithFrame:frame];
    customView.backgroundColor = [UIColor whiteColor];
    
    UILabel *lb = [self buildLabelWithFrame:CGRectMake(0, 0, 13*text.length, 20) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentLeft text:text];
    [customView addSubview:lb];
    

   UILabel * view2 = [self buildLabelWithFrame:CGRectMake(sx(lb)+5, 0, 100, 20) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentLeft text:@""];
    //        view2.backgroundColor = [UIColor grayColor];
    [customView addSubview:view2];

    [customysView addSubview:customView];
    return view2;
}
-(UIImageView *)buildTitleImgWithFrame:(CGRect)frame text:(NSString *)text
{
    UIView *customView =[[ UIView alloc]initWithFrame:frame];
    customView.backgroundColor = [UIColor whiteColor];
    
    UILabel *lb = [self buildLabelWithFrame:CGRectMake(0, 0, 13*text.length, 20) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentLeft text:text];
    [customView addSubview:lb];
    
    UIImageView *view1 = [[UIImageView alloc]initWithFrame:CGRectMake(sx(lb)+5, 3, 70, 14)];
    [customView addSubview:view1];
    //        view1.backgroundColor = [UIColor redColor];
    [customysView addSubview:customView];
    return view1;
}



/*
 **网络请求接口
 **需要传数据：
 * 1. 星座（star）
 * 2. 今日运势，明日运势，本周运势。等（date）
 */

-(void)getInfoFromNetWithStar:(NSString *)star date:(NSString *)date
{
  NSString *  urlStr =[NSString stringWithFormat:@"http://apis.haoservice.com/lifeservice/constellation/GetAll?consName=%@&type=%@&key=%@",star,date,YSKEY];

    
    [[AFHTTPSessionManager manager]GET:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            return ;
        }
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        NSDictionary *dict =KISDictionaryHaveKey(dic, @"result");
        
        
        ysTextView.text = KISDictionaryHaveKey(dict, @"summary");
        colorLabel.text = [NSString stringWithFormat:@"%@色",KISDictionaryHaveKey(dict, @"color")];
        numLabel.text  = KISDictionaryHaveKey(dict, @"number");
        spStarLabel.text = KISDictionaryHaveKey(dict, @"OFriend");
        zhImgeView.image = KUIImage([self getImgWithString:KISDictionaryHaveKey(dict, @"all")]);
        loveImgView.image = KUIImage([self getImgWithString:KISDictionaryHaveKey(dict, @"love")]);
        workImgView.image = KUIImage([self getImgWithString:KISDictionaryHaveKey(dict, @"work")]);
        moneyImgView.image = KUIImage([self getImgWithString:KISDictionaryHaveKey(dict, @"money")]);
        healthLabel.image = KUIImage([self getImgWithString:KISDictionaryHaveKey(dict, @"health")]);
        
        
        
    if (![responseObject isKindOfClass:[NSDictionary class]]) {
        return ;
    }
    
} failure:^(NSURLSessionDataTask *task, NSError *error) {
    [self showAlertViewWithtitle:@"提示" message:@"获取失败"];
}];

}


/*
 创建 星座列表
 */

-(void)buildconstellationScroll
{
    constellationScrl = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -16, KScreenWidth, 80)];
    constellationScrl.contentSize = CGSizeMake(600, 0);
    constellationScrl.backgroundColor = UIColorFromRGBA(0x2f2f2f, 1);
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
        lb.font = [UIFont systemFontOfSize:13];
        [constellationScrl addSubview:lb];
    }
    constellationScrl.hidden = YES;
}





//创建运势view


-(void)buildYsView
{
    ysView = [[UIView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, KScreenHeight-(KISHighVersion_7?64:44))];
    ysView.backgroundColor = kColorWithRGB(0, 0, 0, 0.5);
    ysView.hidden = YES;
    [self.view addSubview:ysView];
   
    ysImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 150)];
    ysImgView.image = KUIImage(@"ys_c_down");
    ysImgView.center = CGPointMake(KScreenWidth/2, -75);
    ysImgView.userInteractionEnabled = YES;
    [ysView addSubview:ysImgView];
    
    
    for (int i = 0; i<4; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, i*36, 100, 36)];
        [btn setTitle:ysArr[i] forState:UIControlStateNormal];
        [btn setTag: 1000+i];
        [btn addTarget:self action:@selector(changeYsTitle:) forControlEvents:UIControlEventTouchUpInside];
        [ysImgView addSubview:btn];
    }
}







//点击星座选择button方法
-(void)changeConstellation:(UIButton *)sender
{
    if (constellationScrl.hidden ==NO) {
        [UIView animateWithDuration:0.3 animations:^{
            constellationScrl.frame = CGRectMake(0, -16, KScreenWidth, 80);
            scr.frame = CGRectMake(0, 64, KScreenWidth, KScreenHeight-64);
            
        } completion:^(BOOL finished) {
            constellationScrl. hidden =YES;
            
            [starButton setBackgroundImage:KUIImage(xArray[sender.tag-1000]) forState:UIControlStateNormal];
            
            nameLabel.text = [NSString stringWithFormat:@"%@座",xArray[sender.tag-1000]];
            /*
             重写 namelabel。text  datelabel.text、
             
             dateLabel.text = ;
             */
            
            NSLog(@"----%@",xArray[sender.tag-1000]);
            [scr removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenConstellScr:)]];
        }];
        
    }

    
    
    
/*
 后续添加 选择星座方法 并且添加网络请求 更换星座数据
 
 */
    
    
}


//- (void)gotoMenu:(UIGestureRecognizer * )ges
//{
//    if ([self.sideMenuController isMenuVisible]) {
//        [self.sideMenuController hideMenuAnimated:YES];
//    }else
//    {
//        [self.sideMenuController showMenuAnimated:YES];
//    }
//}

/*
 
 更换星座方法
 */

-(void)chooseConstellation:(UIButton *)sender
{
    constellationScrl.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        constellationScrl.frame = CGRectMake(0, 64, KScreenWidth, 80);
        scr.frame = CGRectMake(0, 144, KScreenWidth, KScreenHeight-144);
        
        [scr addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenConstellScr:)]];
        
    } completion:^(BOOL finished) {
    }];

}

-(void)hiddenConstellScr:(id)sender
{
    if (constellationScrl.hidden ==NO) {
        [UIView animateWithDuration:0.3 animations:^{
            constellationScrl.frame = CGRectMake(0, -16, KScreenWidth, 80);
            scr.frame = CGRectMake(0, 64, KScreenWidth, KScreenHeight-64);
            
        } completion:^(BOOL finished) {
            constellationScrl. hidden =YES;
            [scr removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenConstellScr:)]];
        }];

    }
}

-(void)changeTitle:(UIButton *)sender
{
    ysView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        ysImgView.center = CGPointMake(KScreenWidth/2, 75);
     } completion:^(BOOL finished) {
         [ysView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenYsView:)]];
    }];

}

-(void)changeYsTitle:(UIButton *)sender
{
    [titleBtn setTitle:ysArr[sender.tag-1000] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        ysImgView.center = CGPointMake(KScreenWidth/2, -75);
        
        StarStr = ysArr[sender.tag-1000];
        [self getInfoFromNetWithStar:StarStr date:dateStr];
        
    } completion:^(BOOL finished) {
        ysView.hidden = YES;
        [ysView removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenYsView:)]];
    }];

}

-(void)hiddenYsView:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        ysImgView.center = CGPointMake(KScreenWidth/2, -75);
    } completion:^(BOOL finished) {
        ysView.hidden = YES;
        [ysView removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenYsView:)]];

    }];
}

-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"今日运势";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"yunshi.png";
}



/*
 *****
 *
 根据返回数据(一般为百分比字符串)选择不同的图片
 
 
 */

-(NSString *)getImgWithString:(NSString *)str
{
    NSLog(@"%@----%.f",str,[str floatValue]);
    
    float lod = [str floatValue];
    
    NSLog(@"%f",lod);
    if (lod==0) {
        return @"star-0";
    }
   else if (lod>0&&lod<21) {
        return @"star-1";
    }
    else if (lod>20&&lod<41)
    {
        return @"star-2";
    }
    else if (lod>40&&lod<61)
    {
        return @"star-3";
    }
    else if(lod>60&&lod<81)
    {
        return @"star-4";
    }
    else if (lod>80&&lod<101)
    {
        return @"star-5";
    }else{
        return nil;
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
