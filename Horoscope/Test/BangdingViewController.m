//
//  BangdingViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/18.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BangdingViewController.h"

@interface BangdingViewController ()
{
    UITableView * myTableView;
    NSArray * titleArr;
}
@end

@implementation BangdingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:NO title:@"绑定" rightImage:@""];
    
    myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, 100+40*9+10) style:UITableViewStylePlain];
    myTableView.bounces = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [self.view addSubview:myTableView];
    
    titleArr = [NSArray arrayWithObjects:@"手机通讯录",@"QQ",@"微信",@"新浪微博", nil];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = [titleArr objectAtIndex:indexPath.row];
    cell.imageView.image = KUIImage(@"");
    cell.accessoryType = YES;
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
