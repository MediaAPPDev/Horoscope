//
//  FriendsViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendsCell.h"
#import "TopTableViewCell.h"
#import "AddFriendsViewController.h"
#import "MineViewController.h"
@interface FriendsViewController ()
{
    UITableView *myTabelView;
    NSArray *nameArr;
    NSArray *imgArr;
}
@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildTopviewWithBackButton:NO title:@"星友" rightImage:@""];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, KISHighVersion_7?20:0, 60, 44)];
    [button setImage:KUIImage(@"123123") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
    // Do any additional setup after loading the view.
    myTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, KScreenHeight-(KISHighVersion_7?64:44))];
    
    myTabelView.delegate = self;
    myTabelView.dataSource = self;
    myTabelView.rowHeight = 90;
    [self.view addSubview:myTabelView];
    
    nameArr = [NSArray arrayWithObjects:@"新朋友",@"好友推荐", nil];
    imgArr =[NSArray arrayWithObjects:@"xinpingyou",@"dianhualianxiren", nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 27;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section ==0) {
        static NSString * identifier = @"adfasdf";
        TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[TopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.headimgView.image = KUIImage(imgArr[indexPath.row]);
        cell.nameLb.text = nameArr[indexPath.row];
        return cell;
        
    }else{
        static NSString *identifier = @"cell";
        FriendsCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[FriendsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        }
        
        
        cell.headimgView.image = KUIImage(@"1.jpg");
        cell.nameLb.text = @"用户未命名";
        cell.starImgView.image = KUIImage(@"ys_c_by");
        cell.starLb.text = @"白羊座";
        cell.sexImg.image = KUIImage(@"sexImg");
        cell.signatureLb.text =@"所谓知之为知之不知为不知 莫装逼 ";
        cell.timeLabel.text = @"1分钟前";
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MineViewController *mine = [[MineViewController alloc]init];
    mine.isRootView = NO;
    [self.navigationController pushViewController:mine animated:YES];

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *arr = [NSArray arrayWithObjects:@"✨",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"S",@"Y",@"Z", nil];
    return arr[section];
}


-(void)enterNextPage:(id)sender
{
    AddFriendsViewController *add =[[AddFriendsViewController alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"星友";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"xingyou.png";
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
