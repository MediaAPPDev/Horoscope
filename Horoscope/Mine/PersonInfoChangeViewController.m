//
//  PersonInfoChangeViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "PersonInfoChangeViewController.h"
#import "PersonInfoCell.h"
#import "ChangeViewController.h"
@interface PersonInfoChangeViewController ()
{
    UITableView  * myTableView;
    NSMutableArray *arr1;
    NSArray *arr2;

}
@end

@implementation PersonInfoChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
    
//    [self buildTopviewWithBackButton:NO title:@"修改个人信息" rightImage:@""];
    
    [self setTopViewWithTitle:@"修改个人信息" withBackButton:NO];
    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, KISHighVersion_7 ? 20 : 0, 65, 44)];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateNormal];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateHighlighted];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];

    
    myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, KScreenHeight-(KISHighVersion_7?64:44)) style:UITableViewStylePlain];
//    myTableView.bounces = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
//    arr1 = [NSArray arrayWithObjects:@"情感状态",@"外貌",@"职业",@"爱好",@"语言",@"出生地",@"学校",@"公司", nil];
//    arr2 = [NSArray arrayWithObjects:@"单身",@"180cm 55kg 强壮",@"学生",@"泡妞 游戏 电影 读书",@"中 英 法 德 西班牙 日 韩 俄罗斯 意大利",@"China",@"英国剑桥",@"SF", nil];
 
//    arr1 = [NSArray arrayWithObjects:@"昵称",@"生日",@"签名", nil];
//    arr2 = [NSArray arrayWithObjects:KISDictionaryHaveKey(self.infoDict, @"nickname"),KISDictionaryHaveKey(self.infoDict, @"birthday"),KISDictionaryHaveKey(self.infoDict, @"phrase"), nil];
    
     NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
     NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
     NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
    NSMutableDictionary *dic4 = [NSMutableDictionary dictionary];
    NSMutableDictionary *dic5 = [NSMutableDictionary dictionary];
    NSMutableDictionary *dic6 = [NSMutableDictionary dictionary];
    
    [dic1 setObject:@"昵称" forKey:@"name"];
    [dic1 setObject:@"nickname" forKey:@"key"];
    [dic1 setObject:KISDictionaryHaveKey(self.infoDict, @"nickname") forKey:@"info"];
    
    [dic2 setObject:@"年龄" forKey:@"name"];
    [dic2 setObject:@"age" forKey:@"key"];
    [dic2 setObject:KISDictionaryHaveKey(self.infoDict, @"userage") forKey:@"info"];

    [dic3 setObject:@"签名" forKey:@"name"];
    [dic3 setObject:@"phrase" forKey:@"key"];
    [dic3 setObject:KISDictionaryHaveKey(self.infoDict, @"phrase") forKey:@"info"];
    
    [dic4 setObject:@"外貌" forKey:@"name"];
    [dic4 setObject:@"face" forKey:@"key"];
    [dic4 setObject:KISDictionaryHaveKey(self.infoDict, @"face") forKey:@"info"];

    [dic5 setObject:@"职业" forKey:@"name"];
    [dic5 setObject:@"jobs" forKey:@"key"];
    [dic5 setObject:KISDictionaryHaveKey(self.infoDict, @"jobs") forKey:@"info"];

    [dic6 setObject:@"情感状态" forKey:@"name"];
    [dic6 setObject:@"personal" forKey:@"key"];
    [dic6 setObject:KISDictionaryHaveKey(self.infoDict, @"personal") forKey:@"info"];

    
    arr1 = [NSMutableArray array];
    [arr1 addObject:dic1];
    [arr1 addObject:dic2];
    [arr1 addObject:dic3];
    [arr1 addObject:dic4];
    [arr1 addObject:dic5];
    [arr1 addObject:dic6];
 
    
}
-(void)backButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr1.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    PersonInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    
    if (!cell) {
        cell = [[PersonInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *dic = arr1[indexPath.row];
    cell.titleLabel.text= KISDictionaryHaveKey(dic, @"name");
    if ([self isEmtity:KISDictionaryHaveKey(dic, @"info")]) {
        cell.ctLabel.text =@"还未设置";
    }else{
    cell.ctLabel.text = KISDictionaryHaveKey(dic, @"info");
}
    cell.accessoryType = YES;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ChangeViewController *change = [[ChangeViewController alloc]init];
    change.contentDic = [NSMutableDictionary dictionaryWithDictionary:arr1[indexPath.row]];
//    [self.menuController pushViewController:change withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
    [self.navigationController pushViewController:change animated:YES];
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
