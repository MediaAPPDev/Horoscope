//
//  testViewController.m
//  Horoscope
//
//  Created by SAT on 14/12/29.
//
//

#import "SexttestViewController.h"
#import "AFAppDotNetAPIClient.h"
#import "testTableViewCell.h"
#import "UIImageView+AFNetworking.h"

#import "testDetailedViewController.h"

#import "ExampleViewController.h"

#import "CustHeadView.h"

@interface SexttestViewController ()

@end

@implementation SexttestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:YES title:@"测试" rightImage:@"订阅－正常.png"];

    
     NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CustHeadView" owner:nil options:nil];
    

    
    CustHeadView * custHeadView =   [nibView objectAtIndex:0];
    
    
    [custHeadView setFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight/3)];
    
    _testTableView.delegate =self;
    _testTableView.dataSource =self;
    
    
    [_headView setBackgroundColor:[UIColor redColor]];

    
    _testTableView.tableHeaderView =custHeadView;

    [[AFAppDotNetAPIClient sharedClient] GET:@"testlist.php" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        
        _allArray = responseObject;
        
        
        [_testTableView reloadData];
        
        
        [self custView];
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
    
    
    
    
//    [self.view addSubview:_tableView];
    
    //    [self buildTopviewWithBackButton:YES title:@"星文" rightImage:nil];
}



-(void)custView
{
    
    
//    [_headView setFrame:CGRectMake(0, 0, 0, 0)];
//    _testTableView.tableHeaderView =_headView;
    
    
//    _testTableView.frame =self.view.bounds;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 83;
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
        UINib *nib = [UINib nibWithNibName:@"testTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
        nibsRegistered = YES;
    }
    
    testTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    
    
//    @property (weak, nonatomic) IBOutlet UIImageView *facePIc;
//    @property (weak, nonatomic) IBOutlet UILabel *titleLable;
//    @property (weak, nonatomic) IBOutlet UIButton *testButton;
//    @property (weak, nonatomic) IBOutlet UILabel *howPolple;
//    @property (weak, nonatomic) IBOutlet UILabel *timeLable;

    if (_allArray.count <1) {
        
    }else{
        
//        [cell.titleLable setTitle:[_allArray[indexPath.row]valueForKey:@"title"] forState:UIControlStateNormal];
        [cell.titleLable setText:[_allArray[indexPath.row]valueForKey:@"title"]];
//        [cell.facePIc setImage:[UIImage imageNamed:@"touxiang1.png"]];
        
        
        [cell.facePIc setImageWithURL:[NSURL URLWithString:[_allArray[indexPath.row]valueForKey:@"pics"]]placeholderImage:[UIImage imageNamed:@"touxiang1.png"]];
        
//        cell.howPolple.text=[_allArray[indexPath.row]valueForKey:@"content"];
        
         cell.howPolple.text=@"111人";
//        cell.newsText.editable =NO;
        
//        cell.timeLable.text =[_allArray[indexPath.row]valueForKey:@"crtime"];
        cell.timeLable.text =@"1小时前";
    
   
      
        
        
        
        
        
        
        
        
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
    return @"测试";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"ceshi.png";
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    testDetailedViewController * testDetailed =[[testDetailedViewController alloc]init];
//     [self.menuController pushViewController:testDetailed withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
    
    ExampleViewController * exampleVC =[[ExampleViewController alloc]init];
    
    NSArray * a =@[@"1",@"2",@"3",@"4"];
    
    exampleVC.exampleArray = [NSMutableArray arrayWithArray:a];
    
         [self.menuController pushViewController:exampleVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
    

    
    
}
@end
