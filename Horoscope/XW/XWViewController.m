//
//  XWViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "XWViewController.h"
#import "XingWenTableViewCell.h"

#import "AFAppDotNetAPIClient.h"

#import "UIImageView+AFNetworking.h"

@interface XWViewController ()

@end

@implementation XWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:YES title:@"星文" rightImage:@"订阅－正常"];
    
    _tableView =[[UITableView alloc]init];

    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.frame =CGRectMake(0,(KISHighVersion_7?64:44), KScreenWidth, KScreenHeight -(KISHighVersion_7?64:44));
//  sx(<#m#>)
//    tableView.frame =self.view.bo;
    //解析
    [[AFAppDotNetAPIClient sharedClient] GET:@"article.php" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        


        _allArray = responseObject;
   
        
        [_tableView reloadData];

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    
        
    }];
    
   
    
    
    
    
    
    [self.view addSubview:_tableView];
    
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
    
    
 
    
    return _allArray.count;
    
    
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
    
    
//    @property (weak, nonatomic) IBOutlet UIButton *zan;
//    @property (weak, nonatomic) IBOutlet UIButton *pinglun;
//    @property (weak, nonatomic) IBOutlet UIButton *share;
//    
//    @property (weak, nonatomic) IBOutlet UIImageView *facePic;
//    
//    @property (weak, nonatomic) IBOutlet UIButton *titleName;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *newsTime;
//    
//    @property (weak, nonatomic) IBOutlet UITextView *newsText;
//    @property (weak, nonatomic) IBOutlet UIImageView *newsPic;
    
    
    if (_allArray.count <1) {
        
    }else{
        
        [cell.titleName setTitle:[_allArray[indexPath.row]valueForKey:@"title"] forState:UIControlStateNormal];
        
        [cell.facePic setImage:[UIImage imageNamed:@"touxiang1.png"]];
        
        
         [cell.newsPic setImageWithURL:[NSURL URLWithString:[_allArray[indexPath.row]valueForKey:@"photo"]]placeholderImage:[UIImage imageNamed:@"touxiang1.png"]];
        
        cell.newsText.text=[_allArray[indexPath.row]valueForKey:@"content"];
        cell.newsText.editable =NO;
        
        cell.newsTime.text =[_allArray[indexPath.row]valueForKey:@"crtime"];

        [cell.zan setTitle:[_allArray[indexPath.row]valueForKey:@"count1"] forState:UIControlStateNormal];
        
              [cell.pinglun setTitle:[_allArray[indexPath.row]valueForKey:@"count2"] forState:UIControlStateNormal];
        
        [cell.share setTitle:[_allArray[indexPath.row]valueForKey:@"count3"] forState:UIControlStateNormal];
        //    [tableView reloadData];
        
        
        
        
        
        //    NSUInteger row = [indexPath row];
        //    NSDictionary *rowData = [self.dataList objectAtIndex:row];
        
        //    cell.name = [rowData objectForKey:@"name"];
        //    cell.dec = [rowData objectForKey:@"dec"];
        //    cell.loc = [rowData objectForKey:@"loc"];
        //    cell.image = [imageList objectAtIndex:row];

        
    }
    
    
    
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
