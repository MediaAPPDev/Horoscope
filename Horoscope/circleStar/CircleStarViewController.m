//
//  CircleStarViewController.m
//  Horoscope
//
//  Created by Satellite on 15/1/5.
//
//

#import "CircleStarViewController.h"
#import "CircleCell.h"
@interface CircleStarViewController ()
{
    NSMutableArray * infoArray;
    UITableView * myTableView;
    
}
@end

@implementation CircleStarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self buildTopviewWithBackButton:NO title:@"星友圈" rightImage:nil];
    infoArray = [NSMutableArray array];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, width(self.view), height(self.view)-(KISHighVersion_7?64:44)) style:UITableViewStylePlain];
    
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    [self getInfoFromNet];
    
}

#pragma mark ---网络请求

-(void)getInfoFromNet
{
    
    [[AFAppDotNetAPIClient sharedClient] GET:@"friendcontent.php?id=6283429397" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (![responseObject isKindOfClass:[NSArray class]]) {
            return ;
        }
        [infoArray addObjectsFromArray:responseObject];
        [myTableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    CircleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CircleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *dic = [infoArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.headImageView.imageURL = nil;
    cell.titleLabel.text =KISDictionaryHaveKey(dic, @"title");
    cell.nameLabel.text = KISDictionaryHaveKey(dic, @"username");
    cell.cImageView.imageURL = [NSURL URLWithString:KISDictionaryHaveKey(dic, @"photo")];
    cell.timeLabel.text = KISDictionaryHaveKey(dic, @"crtime");
    [cell.zanBtn setTitle:KISDictionaryHaveKey(dic, @"zcount") forState:UIControlStateNormal];
    [cell.commBtn setTitle:@"1" forState:UIControlStateNormal];
    if ([KISDictionaryHaveKey(dic, @"zcount")intValue]>0) {
        [cell buildZanViewWithdic:nil];
    }
    if (KISDictionaryHaveKey(dic, @"comment")) {
        [cell buildCommentViewWithDic:[NSArray arrayWithObjects:@{@"comment":KISDictionaryHaveKey(dic, @"comment")}, nil]];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 300;
    NSDictionary *dic = [infoArray objectAtIndex:indexPath.row];
    if ([KISDictionaryHaveKey(dic, @"zcount")intValue]>0) {
        height +=30;
    }
    if (KISDictionaryHaveKey(dic, @"comment")) {
        height+=30;
    }
    return height;
}


-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"星友圈";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"xingyouquan.png";
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
