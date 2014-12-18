//
//  SafeViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/18.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "SafeViewController.h"

@interface SafeViewController ()
{
    UITableView * myTableView;
    NSArray * titleArr;
}
@end

@implementation SafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:NO title:@"安全" rightImage:@""];
    
    myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, KScreenWidth/2+KScreenWidth*.52-30, KScreenWidth, 100+40*9+10) style:UITableViewStylePlain];
    myTableView.bounces = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [self.view addSubview:myTableView];
    
    titleArr = [NSArray arrayWithObjects:@"修改绑定手机",@"密码修改", nil];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
