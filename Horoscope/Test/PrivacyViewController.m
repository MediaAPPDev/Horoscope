//
//  PrivacyViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/18.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "PrivacyViewController.h"

@interface PrivacyViewController ()
{
    UITableView * myTableView;
    NSArray * titleArr;
}
@end

@implementation PrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTopviewWithBackButton:NO title:@"隐私" rightImage:@""];

    
    myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, 100+40*9+10) style:UITableViewStylePlain];
    myTableView.bounces = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [self.view addSubview:myTableView];
    
    titleArr = [NSArray arrayWithObjects:@"星友圈",@"不让他看我的朋友圈",@"不看他的朋友圈",@"通过ID可以搜索到我",@"允许陌生人查看相册",@"私密资料",@"向我推荐QQ好友",@"向我推荐微博好友",@"向我推荐微信好友", nil];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [titleArr objectAtIndex:indexPath.row];
//    cell.accessoryType = YES;
    return cell;
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
