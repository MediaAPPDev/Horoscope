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
#import "LoginViewController.h"
#import "LoginViewController.h"

@interface XWCommentsVC ()
{
    UITableView * myTabelView;
    NSMutableArray * infoArr;
    XWCommentCell *cell3;
    
    UIView * commentBgView;
    UIView * commentView;
    UITextField *commentTF;
    UIButton *sendBtn;
    BOOL isReply;//判断是不是给评论者的评论 默认是NO
    NSDictionary * commentDic;
    NSString *urlStrid;
    UIButton *logInButton;

}
@end

@implementation XWCommentsVC
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self getInfoFromNet];
    
}


-(void)getInfoFromNet
{
    //    UIImage *image = [UIImage imageNamed:@""];
    //    commentView.layer.contents = (id)image.CGImage;
//    [self.hud hide:YES];

    
    urlStrid = [[UserCache sharedInstance]objectForKey:KMYUSERID];
    if (urlStrid == nil) {
        logInButton.hidden = NO;
    }else{
        logInButton.hidden = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTopViewWithTitle:@"评论" withBackButton:YES];
    isReply = NO;
    infoArr = [NSMutableArray array];
    myTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, startX, width(self.view), height(self.view)-startX) style:UITableViewStylePlain];
    myTabelView.delegate = self;
    myTabelView.dataSource = self;
    [self.view addSubview:myTabelView];
    [self setExtraCellLineHidden: myTabelView];
    [self createCommentText];
    [self registerForKeyboardNotifications];
    [self getInfoFromNetWithCommentId:self.commentId];
}

-(void)getInfoFromNetWithCommentId:(NSString *)commentId
{
    NSString *urlStr = [NSString stringWithFormat:@"http://star.allappropriate.com/comment?articleid=%@",commentId];
    [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (![responseObject isKindOfClass:[NSArray class]]) {
            return ;
        }
        [self.hud hide:YES];

        
        [infoArr removeAllObjects];
        [infoArr addObjectsFromArray:responseObject];
        [myTabelView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self showAlertViewWithtitle:@"提示" message:@"请求失败"];

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
    
    commentDic = infoArr[indexPath.row];

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
//<<<<<<< HE/AD

//    if (isReply) {
        cell.commentLabel.text = KISDictionaryHaveKey(dic, @"comment");

//    }else{
//        cell.commentLabel.text = [[NSString stringWithFormat:@"%@%@",@"@",KISDictionaryHaveKey(commentDic, @"nickname")] stringByAppendingString: KISDictionaryHaveKey(dic, @"comment")];
//        NSLog(@"===========    %@",KISDictionaryHaveKey(commentDic, @"nickname"));
//    }
    
//=======
    
    cell.commentLabel.text = KISDictionaryHaveKey(dic, @"comment");
//    if (![self isEmtity:KISDictionaryHaveKey(dic, @"zancount")]) {
        cell.zanLabel.text = KISDictionaryHaveKey(dic, @"zancount");
//    }else{
//        cell.zanLabel.text = @"0";
//    }
//>>>>>>> origin/master
    cell.commentLabel.frame = CGRectMake(80, 60, KScreenWidth-100, [self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"comment") FontSize:12.0 MaxSize:CGSizeMake(KScreenWidth-100, 200)].height+3*cell.commentLabel.numberOfLines);
    
    
    cell.replyLable.text = [[NSString stringWithFormat:@"%@%@ : ",@"@",KISDictionaryHaveKey(commentDic, @"nickname")] stringByAppendingString: KISDictionaryHaveKey(dic, @"replaycomment")];

//    cell.replyLable.text = KISDictionaryHaveKey(dic, @"replaycomment");
    if ([self isEmtity:KISDictionaryHaveKey(dic, @"replaycomment")]) {
        cell.replyLable.frame = CGRectMake(0, 0, 0, 0);
    }else{
    cell.replyLable.frame = CGRectMake(80, 65+[self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"comment") FontSize:12.0 MaxSize:CGSizeMake(KScreenWidth-100, 200)].height+3*cell.commentLabel.numberOfLines, KScreenWidth-100, [self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"replaycomment") FontSize:11.0 MaxSize:CGSizeMake(KScreenWidth-100, 200)].height+1*cell.commentLabel.numberOfLines);
    }
    NSLog(@"😄%@",cell.zanLabel.text);
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    commentDic = infoArr[indexPath.row];
    commentTF.placeholder = [NSString stringWithFormat:@"%@%@",@"@",KISDictionaryHaveKey(commentDic, @"nickname")];
    NSLog(@"===========    %@",KISDictionaryHaveKey(commentDic, @"nickname"));

    [commentTF becomeFirstResponder];
    isReply = YES;

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
    
    CGSize size1 =[self labelAutoCalculateRectWith:KISDictionaryHaveKey(dic, @"replaycomment") FontSize:12.0 MaxSize:CGSizeMake(KScreenWidth-100, 200)];
    height +=size1.height;
    return height;
}

#pragma mark----commentCellDelegate

/*
 *1.点击评论者头像
 *2.给评论者点赞
 *3.评论某人的评论
 */

-(void)didClickHeadImgWithCell:(XWCommentCell*)cell
{
    NSDictionary *dic = infoArr[cell.tag];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    mineVC.userid = KISDictionaryHaveKey(dic, @"userid");
    mineVC.mytype = COME_OTHER;
    [self.menuController pushViewController:mineVC animated:YES];
    
}

-(void)didClickZanWithCell:(XWCommentCell*)cell
{
    /*
     http://star.allappropriate.com/addcount_article?articleid=0134429197&uid=2326730
     */
//    NSDictionary *dic = infoArr[cell.tag];
//    
//    NSLog(@"--点击评论的赞~~~%ld  %@",(long)cell.tag,dic);
//    
//    NSString *urlStr = [NSString stringWithFormat:@"http://star.allappropriate.com/addcount_article?articleid=%@&uid=%@",KISDictionaryHaveKey(dic, @"articleid"),[[UserCache sharedInstance]objectForKey:KMYUSERID]];
//    [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        if (![responseObject isKindOfClass:[NSDictionary class]]) {
//            return ;
//        }
//        NSString * info = [responseObject objectForKey:@"id"];
//        if ([info isEqualToString:@"您已经赞过了"]) {
//            [self showAlertViewWithtitle:@"提示" message:@"您已经赞过了"];
//            return;
//        }
//    [cell.zanBtn setBackgroundImage:KUIImage(@"button01-selected") forState:UIControlStateNormal];
//        [self showMessageWindowWithContent:@"点赞成功" imageType:0];
//        cell.zanLabel.text = [NSString stringWithFormat:@"%d",[cell.zanLabel.text intValue]+1];
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
    
    
    
    
    
    
    self.hud = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:self.hud];
    self.hud.labelText = @"点赞成功！";
    
    NSDictionary *dic = [infoArr objectAtIndex:cell.tag];
    NSLog(@"~~~~~~~~~~~~~     %@",dic);
    if ([KISDictionaryHaveKey(dic, @"replyid") isEqualToString:@"N"]) {
        NSLog(@"评论");

    //http://star.allappropriate.com/addcount_comment?commentid=6277425637&uid=18746671
        
        //评论点赞接口
        NSString *urlStr = [NSString stringWithFormat:@"addcount_comment?commentid=%@&uid=%@",KISDictionaryHaveKey(dic, @"commentid"),[[UserCache sharedInstance]objectForKey:KMYUSERID]];
        NSLog(@"url---%@",urlStr);
        //
        [[AFAppDotNetAPIClient sharedClient]POST:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            //
            NSLog(@"成功---%@",responseObject);
                        //        NSDictionary *dic = responseObject;
            //
                        if ([[responseObject valueForKey:@"id"]isEqualToString:@"您已经赞过了"]) {
                            //            cell.zanBtn
                            self.hud.labelText = @"你已经赞过了！";
                            [self.hud show:YES];
            
                        }else{
            
                            NSString *zanCount = KISDictionaryHaveKey(dic, @"zancount");
                            cell.zanLabel.text = [NSString stringWithFormat:@"%d",[zanCount intValue]+1];
                            NSLog(@"````````````````      %@",cell.zanLabel.text)  ;

//                            [cell.zanBtn setTitle:@"已赞" forState:UIControlStateNormal];
                            self.hud = [[MBProgressHUD alloc]initWithView:self.view];
                            [self.view addSubview:self.hud];
                            self.hud.labelText = @"评论点赞成功！";
                            [self.hud show:YES];
//                            [self.hud show:YES];
            
                        }
            [self getInfoFromNetWithCommentId:self.commentId];
                        //        [_tableView reloadData];
            //
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
                        NSLog(@"失败");
        }];

        
           }else {
        NSLog(@"回复");

               //addcount_reply?replayid=5045582687&uid=18746671
               //http://star.allappropriate.com/addcount_reply?replayid=5045582687&uid=18746671
               NSString *urlStr = [NSString stringWithFormat:@"addcount_reply?replayid=%@&uid=%@",KISDictionaryHaveKey(dic, @"replyid"),[[UserCache sharedInstance]objectForKey:KMYUSERID]];
               NSLog(@"url---%@",urlStr);
               //
               [[AFAppDotNetAPIClient sharedClient]POST:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                   //
                   NSLog(@"成功---%@",responseObject);
//                   NSDictionary *dic = responseObject;
                   if (![responseObject isKindOfClass:[NSDictionary class]]) {
                                   return ;
                               }

                   if ([[responseObject objectForKey:@"id"]isEqualToString:@"您已经赞过了"]) {
                                   //            cell.zanBtn
                                   self.hud.labelText = @"你已经赞过了！";
                                   [self.hud show:YES];
                   //
                               }else{
                   //
                           NSString *zanCount = KISDictionaryHaveKey(dic, @"zancount");
                           cell.zanLabel.text = [NSString stringWithFormat:@"%d",[zanCount intValue]+1];
                                   NSLog(@"`````````````    %@",cell.zanLabel.text)  ;
//                           [cell.zanBtn setTitle:@"已赞" forState:UIControlStateNormal];
                           self.hud = [[MBProgressHUD alloc]initWithView:self.view];
                           [self.view addSubview:self.hud];
                            self.hud.labelText = @"回复点赞成功！";
                            [self.hud show:YES];
                   //
                            }
                   [self getInfoFromNetWithCommentId:self.commentId];
                   //            //        [_tableView reloadData];
                   //            
               } failure:^(NSURLSessionDataTask *task, NSError *error) {
                               NSLog(@"失败");
               }];


    }


}

-(void)didClickReplyWithCell:(XWCommentCell*)cell
{
    

}

#pragma mark---创建评论条
-(void)createCommentText
{
    
    commentBgView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight-startX, KScreenWidth, 50)];
    //    commentView.backgroundColor = UIColorFromRGBA(0xa2a2a2, 1);
    commentBgView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:.6];
    commentBgView.hidden = YES;
    [commentBgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBackKeyBoard:)]];
    [self.view addSubview:commentBgView];
    
    commentView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight-50, KScreenWidth, 50)];
    //    commentView.backgroundColor = UIColorFromRGBA(0xa2a2a2, 1);
    commentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:commentView];
    
    commentTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 7.5f, KScreenWidth-80, 30)];
    commentTF.backgroundColor = [UIColor whiteColor];
    //    commentTF.borderStyle = UITextBorderStyleRoundedRect;
    commentTF.font = [UIFont systemFontOfSize:14];
    commentTF.adjustsFontSizeToFitWidth = YES;
    commentTF.delegate = self;
    commentTF.returnKeyType =UIReturnKeyGo;
    commentTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //    commentTF.keyboardType = UIKeyboardTypeDefault;
    commentTF.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [commentView addSubview:commentTF];
    
    
    UIImage *image = [UIImage imageNamed:@"line_03"];
    
    NSInteger leftCapWidth = image.size.width * 0.5f;
    // 顶端盖高度
    NSInteger topCapHeight = image.size.height * 0.5f;
    // 重新赋值
    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    UIImageView *lineImgeView = [[UIImageView alloc]initWithImage:image];
    lineImgeView.frame = CGRectMake(8, 30.5f, KScreenWidth-78, 8);
    
    [commentView addSubview:lineImgeView];
    
    
    
    
    sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-60, 7.5f, 50, 35)];
    [sendBtn setBackgroundImage:KUIImage(@"Send-disabled") forState:UIControlStateNormal];
    //    [sendBtn setBackgroundColor: [UIColor whiteColor]];
    sendBtn.userInteractionEnabled = NO;
    [sendBtn addTarget:self action:@selector(senderComment:) forControlEvents:UIControlEventTouchUpInside];
    [commentView addSubview:sendBtn];
    
    
    logInButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    [logInButton setBackgroundImage:[UIImage imageNamed:@"h1136-Login-click@2x"] forState:UIControlStateNormal];
    [logInButton setTitle:@"请先登陆" forState:UIControlStateNormal];
    [logInButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [commentView addSubview:logInButton];
    
    
}


-(void) loginAction
{
    //    GuidePageViewController *guidePageVC = [[GuidePageViewController alloc]init];
    ////    self.window.rootViewController =guidePageVC;
    //    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"FirstLoign"];
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:^(void){
        
        
        
    }];
}

#pragma mark ----评论条
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardadf:) name:UIKeyboardDidShowNotification object:nil];
}
-(void)keyboardadf:(NSNotification*)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize =[[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [self begainMoveUpAnimation:kbSize.height];
}

-(void)begainMoveUpAnimation:(float)heigth
{
    commentBgView.frame = CGRectMake(0, startX, KScreenWidth, KScreenHeight-startX);
    commentBgView.hidden = NO;
    [UIView animateWithDuration:0.00  animations:^{
        commentView.frame =CGRectMake(0, KScreenHeight-55- heigth, KScreenWidth, 55);
    } completion:^(BOOL finished) {
    }];
}

-(void)goBackKeyBoard:(id)tap
{
    [commentTF resignFirstResponder];
    commentView.frame = CGRectMake(0, KScreenHeight-55, KScreenWidth, 55);
    commentBgView.hidden = YES;
    [commentBgView removeGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBackKeyBoard:)]];
    isReply = NO;
    commentBgView.hidden = YES;
}

#pragma mark ----发送评论
-(void)senderComment:(id)sender
{
    NSLog(@"发送评论");
    [commentTF resignFirstResponder];
    
    /*
     http://star.allappropriate.com/commentarticle?articleid=0134429197&comment=XXXXXXXX&userid=23267309
     */
    
    if (!isReply) {
        NSString *urlStr = [NSString stringWithFormat:@"http://star.allappropriate.com/commentarticle"];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjects:@[KISDictionaryHaveKey(self.contentDict, @"aid"),[commentTF.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[UserCache sharedInstance]objectForKey:KMYUSERID]] forKeys:@[@"articleid",@"comment",@"userid"]];
        
        NSLog(@"%@",dic);
        
        [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"~~~~~~~~~~~~%@",responseObject);
            commentTF.text = @"";
            [self goBackKeyBoard:nil];
            [commentTF resignFirstResponder];
            [self showMessageWindowWithContent:@"发送成功" imageType:0];
            [self getInfoFromNetWithCommentId:self.commentId];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self showAlertViewWithtitle:@"提示" message:@"评论失败"];
        }];
        
    }else{
        /*
         http://star.allappropriate.com/reply_comment?commentid=7972592692
         &reply=YYYYYY&userid=23267309
         */
        NSString * urlStr =[NSString stringWithFormat:@"http://star.allappropriate.com/reply_comment"];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjects:@[KISDictionaryHaveKey(commentDic, @"commentid"),[commentTF.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[UserCache sharedInstance]objectForKey:KMYUSERID]] forKeys:@[@"commentid",@"reply",@"userid"]];
        
        commentTF.text = @"";
        commentTF.placeholder = @"";
        isReply = NO;
        
        [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"****************%@",responseObject);
            [self goBackKeyBoard:nil];
            [self getInfoFromNetWithCommentId:self.commentId];

        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    }
    
}- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location>0&&![self isEmtity:textField.text]) {
        [sendBtn setBackgroundImage:KUIImage(@"Send-normal") forState:UIControlStateNormal];
        sendBtn.userInteractionEnabled = YES;
    }else{
        [sendBtn setBackgroundImage:KUIImage(@"Send-disabled") forState:UIControlStateNormal];
        sendBtn.userInteractionEnabled = NO;
    }
    NSLog(@"%lu",(unsigned long)range.location);
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self senderComment:nil];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    commentTF.delegate = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
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
