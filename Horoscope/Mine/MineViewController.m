//
//  MineViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/11.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "MineViewController.h"
#import "CircleCell.h"
#import "PersonInfoCell.h"
#import "PhotoViewController.h"
@interface MineViewController ()
{
    UIScrollView * mainScrl;
    UITableView  * myTableView;
    NSArray *arr1;
    NSArray *arr2;
}
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self buildTopviewWithBackButton:YES title:@"西门吹雪" rightImage:@""];
    mainScrl =[[ UIScrollView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, KScreenHeight-(KISHighVersion_7?64:44))];
    mainScrl.backgroundColor = [UIColor grayColor];

    mainScrl.contentSize  = CGSizeMake(0, KScreenWidth/2-30+KScreenWidth*0.52+100+40*9+10);
    
    [self.view addSubview:mainScrl];
    [self buildFirstView];
    
    [self buildPhotosWall];

    myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, KScreenWidth/2+KScreenWidth*.52-30, KScreenWidth, 100+40*9+10) style:UITableViewStylePlain];
    myTableView.bounces = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [mainScrl addSubview:myTableView];
    arr1 = [NSArray arrayWithObjects:@"情感状态",@"外貌",@"职业",@"爱好",@"语言",@"出生地",@"学校",@"公司", nil];
    arr2 = [NSArray arrayWithObjects:@"单身",@"180cm 55kg 强壮",@"学生",@"泡妞 游戏 电影 读书",@"中 英 法 德 西班牙 日 韩 俄罗斯 意大利",@"China",@"英国剑桥",@"SF", nil];
    
}

//创建第一条
-(void)buildFirstView
{
    UIView * blackView =[[ UIView alloc]initWithFrame:CGRectMake(0,1, KScreenWidth, KScreenWidth/2-30)];
    blackView.backgroundColor =[ UIColor blackColor];
    [mainScrl addSubview:blackView];
    
    //头像
    UIImageView *headImgView =[[ UIImageView alloc]initWithFrame:CGRectMake(47, 15, (width(blackView)/2-30)/2, (width(blackView)/2-30)/2)];
    headImgView.image = KUIImage(@"1.jpg");
    [blackView addSubview:headImgView];
    
    //星座图标
    UIImageView * xzImgViwe = [[UIImageView alloc]initWithFrame:CGRectMake(sx(headImgView)+10, 20, 30, 30)];
    xzImgViwe.image = KUIImage(@"ys_c_sp");
    [blackView addSubview:xzImgViwe];
    
    //星座LB
    UILabel *xzLabel = [[UILabel alloc]initWithFrame:CGRectMake(sx(xzImgViwe)+10, 20, 50, 20)];
    xzLabel.textColor = [UIColor whiteColor];
    xzLabel.font = [UIFont boldSystemFontOfSize:15];
    xzLabel.backgroundColor = [UIColor clearColor];
    xzLabel.text = @"水瓶座";
    [blackView addSubview:xzLabel];
    
    
    //年龄LB
    UILabel *ageLabel = [self buildLabelWithFrame:CGRectMake(sx(xzLabel)+10, 20, 30, 20) backgroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter text:@"22"];
    [blackView addSubview:ageLabel];
    
    
    
    //签名LB
    UILabel * qmLabel = [self buildLabelWithFrame:CGRectMake(sx(headImgView)+10, sy(xzImgViwe), 200, 20) backgroundColor:[UIColor clearColor] textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentLeft text:@"no zuo no die why you try?"];
    [blackView addSubview:qmLabel];
    
    UIImageView*lineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, height(blackView)-42, width(blackView), 2)];
    lineView.image = KUIImage(@"dotted line");
    [blackView addSubview:lineView];
    
    UIButton * button1= [[UIButton alloc]initWithFrame:CGRectMake(0, height(blackView)-40, width(blackView)*0.56, 40)];
    
    button1.backgroundColor = [UIColor clearColor];
    [button1 setTitle:@"粉丝 205" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(didClickFuns:) forControlEvents:UIControlEventTouchUpInside];
    [blackView addSubview:button1];
    
    UIImageView *lineLView = [[UIImageView alloc]initWithFrame:CGRectMake(width(blackView)*0.56, height(blackView)-40, 2, 40)];
    lineLView.image = KUIImage(@"line");
    [blackView addSubview:lineLView];
    
    UIButton * button2= [[UIButton alloc]initWithFrame:CGRectMake(width(blackView)*0.56+2, height(blackView)-40, width(blackView)-width(blackView)*0.56+2, 40)];
    
    button2.backgroundColor = [UIColor clearColor];
    [button2 addTarget:self action:@selector(didClickgz:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"关注 250" forState:UIControlStateNormal];
    [blackView addSubview:button2];
    
    
    
}

//坑爹的照片墙
-(void)buildPhotosWall
{
    
    UIView *photoView =[[ UIView alloc]initWithFrame:CGRectMake(0,KScreenWidth/2-30, KScreenWidth, KScreenWidth*0.52)];
    photoView.backgroundColor = [UIColor whiteColor];
    [mainScrl addSubview:photoView];
    
    for (int i = 0; i<8; i++) {
        
        CGFloat imgWidth = (width(mainScrl)-30)/4;
        
        CGFloat imgY = 10 +imgWidth*(i/4)+i/4*5;
        CGFloat imgX = 5 + imgWidth*(i%4)+(i%4)*5;
        NSLog(@"%d----%d--%d--%d",4%4,5%4,6%4,7%4);
        
        UIButton  *imgView =[[ UIButton alloc]initWithFrame:CGRectMake(imgX,imgY, imgWidth, imgWidth)];
        [imgView setImage:KUIImage(@"1.jpg") forState:UIControlStateNormal] ;
        imgView.tag = i;
        [imgView addTarget:self action:@selector(seeBigImg:) forControlEvents:UIControlEventTouchUpInside];
        [photoView addSubview:imgView];
//        NSLog(@"%@",imgView);
        
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        default:
            return 8;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        static NSString * identifier1 = @"cell1";
        CircleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
        if (!cell) {
            cell = [[CircleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        cell.accessoryType = YES;
        return cell;
    }else{
    static NSString *identifier = @"cell";
    PersonInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];

    if (!cell) {
        cell = [[PersonInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.titleLabel.text= arr1[indexPath.row];
    cell.ctLabel.text = arr2[indexPath.row];
    return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section ==0) {
        
    }
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor grayColor];
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 1, KScreenWidth, 50-2)];
        view1.backgroundColor = [UIColor whiteColor];
        [view addSubview:view1];
        
        UILabel *lb1 = [self buildLabelWithFrame:CGRectMake(0, 0, 80, 40) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont boldSystemFontOfSize:17] textAlignment:NSTextAlignmentRight text:@"基本资料"];
        [view1 addSubview:lb1];
        
        UILabel *lb2 = [self buildLabelWithFrame:CGRectMake(KScreenWidth-200, 0, 180, 40) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont boldSystemFontOfSize:17] textAlignment:NSTextAlignmentRight text:@"星缘号 ：1234567890"];
        [view1 addSubview:lb2];

        return view;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 0;
            break;
            
        default:
            return 50;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 80;
    }else{
        return 40;
    }
    
}

//点击 粉丝
-(void)didClickFuns:(UIButton *)sender
{
    UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"粉丝250" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [ale show];

}

//点击关注
-(void)didClickgz:(UIButton *)sender
{
    UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"提示" message:@"关注250" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [ale show];
}

-(void)seeBigImg:(UIButton *)sender
{
    PhotoViewController *photoVC = [[PhotoViewController alloc]init];
    photoVC.photoArray = [NSMutableArray arrayWithObjects:@"1.jpg", @"1.jpg",@"1.jpg",@"1.jpg",@"1.jpg",@"1.jpg",@"1.jpg",@"1.jpg",nil];
    photoVC.num = sender.tag;
    photoVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:photoVC animated:YES completion:^{
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
