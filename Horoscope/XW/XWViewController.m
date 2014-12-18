//
//  XWViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "XWViewController.h"
#import "XingWenTableViewCell.h"

@interface XWViewController ()

@end

@implementation XWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:YES title:@"星文" rightImage:@"订阅－正常"];
    
    UITableView * tableView =[[UITableView alloc]init];
    NSArray * arrry =@[@"a",@"a",@"a",@"a",@"a"@"a"];
    
    tableView.delegate =self;
    tableView.dataSource =self;
    tableView.frame =CGRectMake(0,(KISHighVersion_7?64:44), KScreenWidth, KScreenHeight -(KISHighVersion_7?64:44));
//  sx(<#m#>)
//    tableView.frame =self.view.bo;
    
    [self.view addSubview:tableView];
    
//    [self buildTopviewWithBackButton:YES title:@"星文" rightImage:nil];
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier";
    
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"XingWenTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
        nibsRegistered = YES;
    }
    
    XingWenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    
    
//    NSUInteger row = [indexPath row];
//    NSDictionary *rowData = [self.dataList objectAtIndex:row];
    
//    cell.name = [rowData objectForKey:@"name"];
//    cell.dec = [rowData objectForKey:@"dec"];
//    cell.loc = [rowData objectForKey:@"loc"];
//    cell.image = [imageList objectAtIndex:row];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"星文";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"xingwen.png";
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
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
