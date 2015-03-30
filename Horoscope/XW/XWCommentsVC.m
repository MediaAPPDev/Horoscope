//
//  XWCommentsVC.m
//  Horoscope
//
//  Created by qihonggang on 15-3-26.
//
//

#import "XWCommentsVC.h"
#import "XWCommentCell.h"
#import "MineViewController.h"
@interface XWCommentsVC ()
{
    UITableView * myTabelView;
    NSMutableArray * infoArr;
    XWCommentCell *cell3;
}
@end

@implementation XWCommentsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTopViewWithTitle:@"评论" withBackButton:YES];
    infoArr = [NSMutableArray array];
    myTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, startX, width(self.view), height(self.view)-startX) style:UITableViewStylePlain];
    myTabelView.delegate = self;
    myTabelView.dataSource = self;
    [self.view addSubview:myTabelView];
    [self setExtraCellLineHidden: myTabelView];
    
    [self getInfoFromNetWithCommentId:self.commentId];
}

-(void)getInfoFromNetWithCommentId:(NSString *)commentId
{
    NSString *urlStr = [NSString stringWithFormat:@"http://star.allappropriate.com/comment?articleid=%@",commentId];
    [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (![responseObject isKindOfClass:[NSArray class]]) {
            return ;
        }
        [infoArr removeAllObjects];
        [infoArr addObjectsFromArray:responseObject];
        [myTabelView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifier = @"cell";
    XWCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[XWCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.delegate = self;
    cell.tag = indexPath.row;
    NSDictionary *dic = infoArr[indexPath.row];
    cell.headImgBtn.imageURL = [NSURL URLWithString:KISDictionaryHaveKey(dic, @"userphotos")];
    cell.nickname.text = KISDictionaryHaveKey(dic, @"nickname");
    cell.timeLabel.text = KISDictionaryHaveKey(dic, @"crtime");
    
    cell.commentLabel.text = KISDictionaryHaveKey(dic, @"comment");
    
    cell.commentLabel.frame = CGRectMake(80, 60, KScreenWidth-100, [self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"comment") FontSize:12.0 MaxSize:CGSizeMake(KScreenWidth-100, 200)].height+3*cell.commentLabel.numberOfLines);
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//   XWCommentCell * cell = (XWCommentCell*)[myTabelView cellForRowAtIndexPath:indexPath];
    NSDictionary *dic = infoArr[indexPath.row];
    float height = 0.0f;
    height += 70;
    
//    float height2 = 0.0f;
//    if (cell.commentLabel.numberOfLines==3) {
//        height2 +=50;
//    }else {
//        height2 +=200;
//    }
    CGSize size = [self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"comment") FontSize:12.0 MaxSize:CGSizeMake(KScreenWidth-100, 200)];

    height+=size.height+20;
    return height;
}

#pragma mark----commentCellDelegate
-(void)didClickHeadImgWithCell:(XWCommentCell*)cell
{
    NSDictionary *dic = infoArr[cell.tag];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    mineVC.userid = KISDictionaryHaveKey(dic, @"userid");
    mineVC.mytype = COME_OTHER;
    [self.menuController pushViewController:mineVC animated:YES];
    
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
