//
//  XWViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "XWViewController.h"
//#import "XingWenTableViewCell.h"

#import "AFAppDotNetAPIClient.h"

#import "UIImageView+AFNetworking.h"
#import "XWDetailViewController.h"
#define KZFURL @"http://star.allappropriate.com/article"



@interface XWViewController ()
{
    NSMutableArray * infoArray;

    MJRefreshHeaderView *m_header;

}

@end

@implementation XWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0,0,KScreenWidth,KScreenHeight)];
    self.tableView.tableFooterView = v;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self buildTopviewWithBackButton:YES title:@"星文" rightImage:@"订阅－正常"];
    self.view.backgroundColor = [UIColor blackColor];
    _tableView =[[UITableView alloc]init];

    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.frame =CGRectMake(0,startX, KScreenWidth, KScreenHeight -(KISHighVersion_7?64:44));
//  )
    
    [self getInfoFromNet];

    [self addHeader];

//    tableView.frame =self.view.bo;
    //解析
    

    [self.view addSubview:_tableView];
    
//    [self buildTopviewWithBackButton:YES title:@"星文" rightImage:nil];
}


-(void)getInfoFromNet
{
    [[AFAppDotNetAPIClient sharedClient] GET:@"article" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        [self.hud hide:YES];

        NSLog(@"88888888     %@",responseObject);
        _allArray = responseObject;
        
        [m_header endRefreshing];
        
        [_tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [m_header endRefreshing];
        [self.hud hide:YES];
        [self showAlertViewWithtitle:@"提示" message:@"请求失败"];
        
    }];

}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic =_allArray[indexPath.row];

    UITextView *text = [[UITextView alloc]init];
    text.text = KISDictionaryHaveKey(dic, @"content");
    
//    float f = [self getContenSizeAction:text];
    
    CGSize g = [self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"content") FontSize:14 MaxSize:CGSizeMake(KScreenWidth-28, 100)];
    NSLog(@"CGSize = %@",NSStringFromCGSize(g));
//    return g.height+250+28+20;
//    return 600;
    
    return 320;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CustomCellIdentifier";

    XWCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[XWCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.delegate = self;
    cell.tag = indexPath.row;

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic =_allArray[indexPath.row];
    
    cell.titleName.text = [dic valueForKey:@"title"] ;
    
    cell.subtitle.text = [dic valueForKey:@"subtitle"] ;

//        [cell.facePic setImage:[UIImage imageNamed:@"touxiang1.png"]];
    cell.facePic.placeholderImage = KUIImage(@"appicont.png");
    cell.facePic.imageURL = nil;
//    cell.newsPic.placeholderImage = KUIImage(@"touxiang1.png");
    cell.newsPic.imageURL =[NSURL URLWithString:KISDictionaryHaveKey(dic, @"photo")];
    NSLog(@"%@",cell.newsPic.imageURL);
        cell.newsText.text=[[[dic valueForKey:@"content"]substringToIndex:15] stringByAppendingString:@"..."];
//    cell.newsText.text = [[dic valueForKey:@"content"]stringByAppendingString:@"..." ];
    cell.newsText.textColor = [UIColor grayColor];
//            cell.newsText.text=[[dic valueForKey:@"content"]substringToIndex:50];
        cell.newsText.editable =NO;
        cell.newsTime.text =[dic valueForKey:@"crtime"];
    NSLog(@"8888888888    %@",cell.newsTime);
//    CGSize g = [self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"content") FontSize:14 MaxSize:CGSizeMake(KScreenWidth-28, 70)];

    
    
    cell.newsText.frame = CGRectMake(14, 80, KScreenWidth-28,30 );
    cell.newsPic.frame = CGRectMake(14, cell.newsText.frame.origin.y+cell.newsText.frame.size.height+10, KScreenWidth-28, 150);
    cell.newsPic.backgroundColor = [UIColor grayColor];

    
    
    
    
    
    cell.zanBtn.frame = CGRectMake(14, sy(cell.newsPic)+10, 30, 28);
    //    [cell.zanBtn setTitle:@"👍" forState:UIControlStateNormal];
    [cell.zanBtn setBackgroundImage:[UIImage imageNamed:@"button02-normal@2x"] forState:UIControlStateNormal];
    cell.zanBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    cell.zanNumLb.frame = CGRectMake(44, sy(cell.newsPic)+10, 60, 28);
    cell.zanNumLb.textColor = [UIColor grayColor];
    cell.zanNumLb.text = [dic valueForKey:@"zcount"];
    
   
    
    
    
    
    cell.share.frame = CGRectMake(105, sy(cell.newsPic)+10, 30, 28);
    [cell.share setBackgroundImage:[UIImage imageNamed:@"button03-normal@2x"] forState:UIControlStateNormal];
    
    cell.shareNumLb.frame = CGRectMake(136,  sy(cell.newsPic)+10, 60, 28);
    cell.shareNumLb.text = [dic valueForKey:@"fcount"];
    cell.shareNumLb.textColor = [UIColor grayColor];
    cell.share.titleLabel.font = [UIFont boldSystemFontOfSize:15];

    

    
    cell.commLb.frame = CGRectMake(KScreenWidth-60, sy(cell.newsPic)+10, 50, 30);
    cell.commNumLb.frame = CGRectMake(KScreenWidth-90, sy(cell.newsPic)+10, 30, 30);
    cell.commNumLb.text = [dic valueForKey:@"pcount"];
    cell.commNumLb.textColor = [UIColor grayColor];

//        [cell.newsText sizeToFit];
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
    XWDetailViewController *derailVC = [[XWDetailViewController alloc] init];
//    derailVC
//<<<<<<< HEAD
    derailVC.exampleDic = [_allArray objectAtIndex:indexPath.row];
//=======
    NSDictionary *dic =_allArray[indexPath.row];

    derailVC.aid =KISDictionaryHaveKey(dic, @"aid");
    
//>>>>>>> origin/master
    [self.menuController pushViewController:derailVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
    
}

-(void)didClickShareWithCell:(XWCell*)cell
{
    UIActionSheet *shareSheet= [[UIActionSheet alloc]initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"新浪微博" otherButtonTitles:@"QQ",@"微信好友",@"微信朋友圈", nil];
    shareSheet.tag = cell.tag;
    [shareSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSDictionary *dic = [_allArray objectAtIndex:actionSheet.tag];
    NSLog(@"----------------%ld",actionSheet.tag);
    if (buttonIndex + 1 >= actionSheet.numberOfButtons ) {
        return;
    }
    NSArray *arr = [NSArray arrayWithObjects:@"sina",@"qq",@"wxsession",@"wxtimeline", nil];
    
    NSLog(@"%@",arr[buttonIndex]);
    //    [[UMSocialControllerService defaultControllerService] setShareText:shareText shareImage:shareImage socialUIDelegate:self];
    //    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:snsName];
    //    snsPlatform.snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
    
    NSString *titleStr = KISDictionaryHaveKey(dic, @"content");
    EGOImageView *imgView= [[ EGOImageView alloc]init];
    imgView.imageURL = [NSURL URLWithString:KISDictionaryHaveKey(dic, @"photo")];
    
    NSData * imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:KISDictionaryHaveKey(dic, @"photo")]];
    
    if (titleStr.length>128) {
        titleStr = [titleStr substringToIndex:128];
    }
    
    NSString *shareUrlStr =[@"http://star.allappropriate.com/articlef?aid="stringByAppendingString:KISDictionaryHaveKey(dic, @"aid")];
    
    [[AFAppDotNetAPIClient sharedClient]GET:shareUrlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",responseObject);
        [UMSocialQQHandler setQQWithAppId:SHAREQQID appKey:SHAREQQAPPKEY url:responseObject];
        [UMSocialWechatHandler setWXAppId:SHAREWXID appSecret:SHAREWXAPPKEY url:responseObject];
        [[UMSocialDataService defaultDataService] postSNSWithTypes:@[arr[buttonIndex]] content:titleStr image:imgData location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity * response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"成功" message:@"分享成功" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
                [alertView show];
                
            } else if(response.responseCode != UMSResponseCodeCancel) {
                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"失败" message:@"分享失败" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
                [alertView show];
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
   
    
    
    //    [UMSocialSnsService presentSnsIconSheetView:self
    //appKey:@"507fcab25270157b37000010"
    //shareText:@" 你要分享的文字"
    //shareImage:[UIImage imageNamed:@"icon.png"]
    //shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
    //    delegate:self];
}

#pragma mark-----CircleCell delegate ----did ZAN AND COMMENT

-(void)didClickZanWithCell:(XWCell *)cell
{
    self.hud = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:self.hud];
    self.hud.labelText = @"点赞成功！";
    
    NSLog(@"点赞");
//    cell.zanBtn.hidden = YES;
//    cell.commLb. hidden = YES;
    [cell.zanBtn setBackgroundImage:[UIImage imageNamed:@"button02-click@2X"] forState:UIControlStateNormal];
//    cell.zanBtn.userInteractionEnabled = NO;
    /*
     http://star.allappropriate.com/addcount?cid=3&zcount=102&uid=2696868409
     */
    NSDictionary *dic = [_allArray objectAtIndex:cell.tag];
    
//    NSLog(@"---------------%@",_allArray);
    //addcount_article?articleid=0134429197&uid=2326730
    // http://star.allappropriate.com/addcount_article?articleid=&uid=87932944
//addcount_article?articleid=3491090564&uid=87932944
    //    http://star.allappropriate.com/addcount_article?addcount_article?articleid=0134429197&uid=87932944
    NSString *urlStr = [NSString stringWithFormat:@"addcount_article?articleid=%@&uid=%@",KISDictionaryHaveKey(dic, @"aid"),[[UserCache sharedInstance]objectForKey:KMYUSERID]];
    NSLog(@"~~~~~~~~~~~~~~~~%@---------------%@*****************%ld",KISDictionaryHaveKey(dic, @"aid"),_allArray,cell.tag);
    NSLog(@"=========%@",urlStr);
    
    [[AFAppDotNetAPIClient sharedClient]POST:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"成功---%@",responseObject);
//        NSDictionary *dic = responseObject;
        
        if ([[responseObject valueForKey:@"id"]isEqualToString:@"您已经赞过了"]) {
//            cell.zanBtn
            self.hud.labelText = @"你已经赞过了！";
            [self.hud show:YES];

        }else{
        
        //        NSString *zanCount = KISDictionaryHaveKey(dic, @"zcount");
        //        cell.zanBtn.countLabel.text = [NSString stringWithFormat:@"%d",[zanCount intValue]+1];
//        [cell.zanBtn setTitle:@"已赞" forState:UIControlStateNormal];
//        self.hud = [[MBProgressHUD alloc]initWithView:self.view];
//        [self.view addSubview:self.hud];
//        self.hud.labelText = @"点赞成功！";
        [self.hud show:YES];

        }
        [self getInfoFromNet];
//        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败");
    }];
}




- (void)addHeader
{
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    CGRect headerRect = header.arrowImage.frame;
    headerRect.size = CGSizeMake(30, 30);
    header.arrowImage.frame = headerRect;
    header.activityView.center = header.arrowImage.center;
    header.scrollView = self.tableView;
    header.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        [self getInfoFromNet];
    };
    m_header = header;
}

#pragma mark-----textView delegate ----did  COMMENT

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    /*错误更正
     
     textView.text = [NSString stringWithFormat:@"%@%@", textView.text, text];
     
     */
    if (textView.contentSize.height > 50) {
        textView.text = [textView.text substringToIndex:[textView.text length]-1];
        return NO;
    }
    
    /*错误更正
     
     if([textView.text length]>0) {
     textView.text = [textView.text substringToIndex:[textView.text length]-1];
     
     }
     
     */
    return YES;
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
