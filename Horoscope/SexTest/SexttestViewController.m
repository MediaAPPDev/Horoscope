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


#import "MyScrollView.h"



#import <QuartzCore/QuartzCore.h>



@interface SexttestViewController ()

@end

@implementation SexttestViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        _imageNames = [NSMutableArray arrayWithObjects:@"lunbo1.jpg",
                       @"lunbo2.jpg",
                       @"lunbo3.jpg",
                       @"lunbo4.jpg",
                       
                       nil] ;

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTopviewWithBackButton:YES title:@"测试" rightImage:@"订阅－正常.png"];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    MyScrollView *myScorollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 280)] ;
    [myScorollView setImagePathsInBundle:_imageNames];
    [self.view addSubview:myScorollView];
    [myScorollView setAutoRunEnableWithInterval:5];
    myScorollView.playDirection = Right;
    myScorollView.timerInterval = 3;
    /*
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 240, KScreenWidth, 40)];
    titleLable.backgroundColor = [UIColor blackColor];
    titleLable.alpha = 0.6;
    titleLable.text = @" 你的闺蜜是小三吗？";
    titleLable.textColor = [UIColor whiteColor];
    [myScorollView addSubview:titleLable];
     */
    myScorollView.pageControlEnabled = YES;
   
   
    /*
    
    MyScrollView *myLabelScorollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 240, KScreenWidth, 40)];
    
    [myScorollView addSubview:myLabelScorollView];
    [myLabelScorollView setAutoRunEnableWithInterval:5];
    myLabelScorollView.playDirection = Right;
    myLabelScorollView.timerInterval = 3;
    myLabelScorollView.pageControlEnabled = NO;
    [myLabelScorollView addSubview:titleLable];
    
//    [myScorollView addSubview:myLabelScorollView];

    
    */
    
    
    _testTableView.delegate =self;
    _testTableView.dataSource =self;
    _testTableView.tableHeaderView =myScorollView;
    
    //请求数据
    [[AFAppDotNetAPIClient sharedClient] GET:@"testlist.php" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        _allArray = responseObject;
        [_testTableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
    
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
    
    
    if (_allArray.count <1) {
        
    }else{
        
        [cell.titleLable setText:[_allArray[indexPath.row]valueForKey:@"title"]];
        [cell.facePIc setImageWithURL:[NSURL URLWithString:[_allArray[indexPath.row]valueForKey:@"pics"]]placeholderImage:[UIImage imageNamed:@"touxiang1.png"]];
        cell.facePIc.layer.cornerRadius = 6;
        cell.facePIc.layer.masksToBounds = YES;
        cell.howPolple.text=@"111人";
        cell.timeLable.text =@"1小时前";
        
    }
    
    return cell;
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
    
    
    ExampleViewController * exampleVC =[[ExampleViewController alloc]init];
    
    
    exampleVC.exampleDic = [NSMutableDictionary dictionary];
    
    exampleVC.exampleDic =[_allArray objectAtIndex:indexPath.row];
    
    
    [self.menuController pushViewController:exampleVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

