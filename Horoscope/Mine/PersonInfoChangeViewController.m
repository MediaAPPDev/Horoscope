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
    NSArray *arr1;
    NSArray *arr2;

}
@end

@implementation PersonInfoChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self buildTopviewWithBackButton:NO title:@"修改个人信息" rightImage:@""];
    
    [self setTopViewWithTitle:@"修改个人信息" withBackButton:YES];
    
    
    myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, KScreenHeight-(KISHighVersion_7?64:44)) style:UITableViewStylePlain];
//    myTableView.bounces = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    arr1 = [NSArray arrayWithObjects:@"情感状态",@"外貌",@"职业",@"爱好",@"语言",@"出生地",@"学校",@"公司", nil];
    arr2 = [NSArray arrayWithObjects:@"单身",@"180cm 55kg 强壮",@"学生",@"泡妞 游戏 电影 读书",@"中 英 法 德 西班牙 日 韩 俄罗斯 意大利",@"China",@"英国剑桥",@"SF", nil];
 
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *identifier = @"cell";
        PersonInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
        
        if (!cell) {
            cell = [[PersonInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.titleLabel.text= arr1[indexPath.row];
        cell.ctLabel.text = arr2[indexPath.row];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ChangeViewController *change = [[ChangeViewController alloc]init];
    change.contentStr = arr2[indexPath.row];
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
