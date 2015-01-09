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

#define KZFURL @"http://star.allappropriate.com/articlef"

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
    
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    CGFloat sdfdsf=cell.frame.size.height;
    return cell.frame.size.height;
//    return 600;
    
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
    cell.delegate = self;
    cell.tag = indexPath.row;
    
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
        [cell.newsText sizeToFit];
        CGRect f = cell.newsText.frame;
        
        CGFloat floadf=   [self getContenSizeAction:cell.newsText];
        
        
//        [cell.newsText setFrame:CGRectMake(f.origin.x, f.origin.y, f.size.width, [self getContenSizeAction:cell.newsText]+500)];
        
        [cell.newsText setFrame:CGRectMake(0 , 12, 12321321,500)];
        
        [cell.newsPic setFrame:CGRectMake(0 , 12, 12321321,500)];
        
        
//      [cell.newsText setFrame:CGRectMake(f.origin.x, f.origin.y, f.size.width, 500)];
//      cell.newsText.frame.size.height =[self getContenSizeAction:cell.newsText];
       
        CGRect c =cell.frame;
        float  heightss =[self getContenSizeAction:cell.newsText] +c.size.height;
        
        
        [cell setFrame:CGRectMake(c.origin.x, c.origin.y, c.size.width, c.size.height +heightss)];
        
        
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

-(void)didClickShareWithCell:(XingWenTableViewCell*)cell
{
    
    UIActionSheet *shareSheet= [[UIActionSheet alloc]initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"新浪微博" otherButtonTitles:@"QQ",@"微信好友",@"微信朋友圈", nil];
    shareSheet.tag = cell.tag;
    [shareSheet showInView:self.view];

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSDictionary *dic = [_allArray objectAtIndex:actionSheet.tag];

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
    
    if (titleStr.length>128) {
        titleStr = [titleStr substringToIndex:128];
    }
    
    
    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[arr[buttonIndex]] content:titleStr image:KUIImage(@"1.jpg") location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity * response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"成功" message:@"分享成功" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
            [alertView show];
        } else if(response.responseCode != UMSResponseCodeCancel) {
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"失败" message:@"分享失败" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
            [alertView show];
        }
    }];
    
    
    //    [UMSocialSnsService presentSnsIconSheetView:self
    //appKey:@"507fcab25270157b37000010"
    //shareText:@"你要分享的文字"
    //shareImage:[UIImage imageNamed:@"icon.png"]
    //shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
    //    delegate:self];
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
