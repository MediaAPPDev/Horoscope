//
//  XWDetailViewController.m
//  Horoscope
//
//  Created by qihonggang on 15-3-24.
//
//

#import "XWDetailViewController.h"
#import "XWCommentsVC.h"
@class XWViewController;
//@class XWCommentsVC;
@interface XWDetailViewController ()
{
    UILabel * titileLabel;
    UILabel * timeLabel;
    EGOImageView * contentImageView;
    UITextView * contentTextView;
    float sfHeight;
    
    UIView * commentBgView;
    UIView * commentView;
    UITextField *commentTF;
    UIButton *sendBtn;
    NSDictionary *contentDict;
}
@end

@implementation XWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"000000000-----------%@",_exampleDic);
    [self setTopViewWithTitle:@"星文" withBackButton:YES];
    self.view.backgroundColor = [UIColor whiteColor];
//<<<<<<< HEAD
//=======
    contentDict = [NSMutableDictionary dictionary];
    
//>>>>>>> origin/master
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-80, KISHighVersion_7?20:0, 80, 44)];
//    [button setImage:KUIImage(@"123123") forState:UIControlStateNormal];
    [button setTitle:[[_exampleDic valueForKey:@"pcount"]stringByAppendingString:@"评论>"] forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:14];
    [button addTarget:self action:@selector(enterNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
//
//    
//    self.titleName = [[UILabel alloc]initWithFrame:CGRectMake(28, 20+60, KScreenWidth-56, 30)];
//    self.titleName.textColor  = UIColorFromRGBA(0x1bb5f5, 1);
//    self.titleName.backgroundColor = [UIColor clearColor];
//    self.titleName.font = [UIFont systemFontOfSize:15];
//    self.titleName.text = [_exampleDic valueForKey:@"title"];
//    [self.view addSubview:self.titleName];
//    
//    
//    
//    self.timeLb = [[UILabel alloc] initWithFrame:CGRectMake(28, 50+60, 300, 30)];
//    self.timeLb.text = [_exampleDic valueForKey:@"crtime"];
//    self.timeLb.font = [UIFont systemFontOfSize:13];
//    self.timeLb.textColor = [UIColor grayColor];
//    [self.view addSubview:self.timeLb];
//    
//    self.imageView = [[EGOImageView alloc] initWithImage:[UIImage imageNamed:[_exampleDic valueForKey:@"photo"]]];
//    [self.imageView setFrame:CGRectMake(14, 150, KScreenWidth-28, 200)];
//    _imageView.imageURL =[NSURL URLWithString:KISDictionaryHaveKey(_exampleDic, @"photo")];
//    [self.view addSubview:self.imageView];
//    
//    self.contentTV = [[UITextView alloc]initWithFrame:CGRectMake(14, 355, KScreenWidth-30,KScreenHeight-350-55)];
//    self.contentTV.scrollEnabled = YES;
//    self.contentTV.text = [_exampleDic valueForKey:@"content"]/*stringByAppendingString:@"中新社法国塞讷阿尔卑斯3月26日电  对德翼航空A320空难展开调查的法国司法部门26日证实，该航班坠毁时驾驶仓内只有副驾驶员一人，他还按下降低飞行高度的按钮。此举可被视为“有意毁灭飞机”的行                           据此间媒体报道，马赛共和国检察官布里斯·罗班(BriceRobin)在法国马赛机场举行的新闻发布会上透露，根据黑匣子记录的数据，机长和副驾驶员在前二十分钟内都在正常交谈。布里斯·罗班表示，对话录音显示，机长随后将驾驶飞机的工作交给副驾驶员，起身离开驾驶舱。据推测，机长应该是出去如厕。此时，只有副驾驶员一人留在驾驶仓内，并启动了下降按钮。这位检察官说，接下来就听到机长数次通过对讲系统要求副驾驶员开门，但未获回应。录音中的激烈撞门声应该是被锁在驾驶舱外的机长试图破门而入的努力。此外，直至飞机坠毁时驾驶舱内都有人的呼吸声，可见副驾驶员活到了最后一刻。"]*/;
//    self.contentTV.backgroundColor = [UIColor clearColor];
//    self.contentTV.editable = NO;
//    //        [self.newsText setNumberOfLines:0];
//    self.contentTV.font = [UIFont systemFontOfSize:14];
//    [self.view addSubview:self.contentTV];
//    
//    
//    
//    self.commTfBackImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
//    [self.commTfBackImageView setFrame:CGRectMake(0, KScreenHeight-50, KScreenWidth, 50)];
//
//    self.commTfBackImageView.userInteractionEnabled = YES;
//    [self.view addSubview:self.commTfBackImageView];
//    
//    
//    self.commSendButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth-70, 5,70 , 40)];
//    [self.commSendButton setBackgroundImage:[UIImage imageNamed:@"Send-normal@2x"] forState:UIControlStateNormal];
//    [self.commTfBackImageView addSubview:self.commSendButton];
//
//    
//    self.commTF = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, KScreenWidth-70, 40)];
//    [self.commTF setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
//    self.commTF.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
//    self.commTF.delegate = self;
//    self.commTF.placeholder = @"我也来说一句";
//    [self.commTfBackImageView addSubview:self.commTF];
    
    
//<<<<<<< HEAD
    self.titleName = [[UILabel alloc]initWithFrame:CGRectMake(28, 20+60, KScreenWidth-56, 30)];
    self.titleName.textColor  = UIColorFromRGBA(0x1bb5f5, 1);
    self.titleName.backgroundColor = [UIColor clearColor];
    self.titleName.font = [UIFont systemFontOfSize:15];
    self.titleName.text = [_exampleDic valueForKey:@"title"];
    [self.view addSubview:self.titleName];
    
    
    
    self.timeLb = [[UILabel alloc] initWithFrame:CGRectMake(28, 50+60, 300, 30)];
    self.timeLb.text = [_exampleDic valueForKey:@"crtime"];
    self.timeLb.font = [UIFont systemFontOfSize:13];
    self.timeLb.textColor = [UIColor grayColor];
    [self.view addSubview:self.timeLb];
    
    self.imageView = [[EGOImageView alloc] initWithImage:[UIImage imageNamed:[_exampleDic valueForKey:@"photo"]]];
    [self.imageView setFrame:CGRectMake(14, 150, KScreenWidth-28, 200)];
    _imageView.imageURL =[NSURL URLWithString:KISDictionaryHaveKey(_exampleDic, @"photo")];
    [self.view addSubview:self.imageView];
    
    self.contentTV = [[UITextView alloc]initWithFrame:CGRectMake(14, 355, KScreenWidth-30,KScreenHeight-350-55)];
    self.contentTV.scrollEnabled = YES;
    self.contentTV.text = [_exampleDic valueForKey:@"content"]/*stringByAppendingString:@"中新社法国塞讷阿尔卑斯3月26日电  对德翼航空A320空难展开调查的法国司法部门26日证实，该航班坠毁时驾驶仓内只有副驾驶员一人，他还按下降低飞行高度的按钮。此举可被视为“有意毁灭飞机”的行                           据此间媒体报道，马赛共和国检察官布里斯·罗班(BriceRobin)在法国马赛机场举行的新闻发布会上透露，根据黑匣子记录的数据，机长和副驾驶员在前二十分钟内都在正常交谈。布里斯·罗班表示，对话录音显示，机长随后将驾驶飞机的工作交给副驾驶员，起身离开驾驶舱。据推测，机长应该是出去如厕。此时，只有副驾驶员一人留在驾驶仓内，并启动了下降按钮。这位检察官说，接下来就听到机长数次通过对讲系统要求副驾驶员开门，但未获回应。录音中的激烈撞门声应该是被锁在驾驶舱外的机长试图破门而入的努力。此外，直至飞机坠毁时驾驶舱内都有人的呼吸声，可见副驾驶员活到了最后一刻。"]*/;
    self.contentTV.backgroundColor = [UIColor clearColor];
    //        [self.newsText setNumberOfLines:0];
    self.contentTV.userInteractionEnabled=  NO;
    self.contentTV.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.contentTV];
    
    
    
    self.commTfBackImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    [self.commTfBackImageView setFrame:CGRectMake(0, KScreenHeight-50, KScreenWidth, 50)];

    self.commTfBackImageView.userInteractionEnabled = YES;
    [self.view addSubview:self.commTfBackImageView];
    
    
    self.commSendButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth-70, 5,70 , 40)];
    [self.commSendButton setBackgroundImage:[UIImage imageNamed:@"Send-click@2x"] forState:UIControlStateNormal];
    [self.commTfBackImageView addSubview:self.commSendButton];

    
    self.commTF = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, KScreenWidth-70, 40)];
    [self.commTF setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    self.commTF.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    self.commTF.delegate = self;
    self.commTF.placeholder = @"我也来说一句";
    [self.commTfBackImageView addSubview:self.commTF];
//=======
//>>>>>>> origin/master
    
    [self createCommentText];
    [self registerForKeyboardNotifications];
    [self getInfoFromNetWithUid:self.aid];
}

//<<<<<<< HEAD
//当开始点击textField会调用的方法
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];
    
    
//    [self.commTfBackImageView setFrame:CGRectMake(KScreenHeight-216,KScreenHeight-50, KScreenWidth, 50)];
//    [self.view addSubview:self.commTfBackImageView];
    if ([self.commTF.text isEqualToString:@""]) {
        [self.commSendButton setImage:[UIImage imageNamed:@"Send-normal@2x"] forState:UIControlStateNormal];
    }else{
         [self.commSendButton setImage:[UIImage imageNamed:@"Send-click@2x"] forState:UIControlStateNormal];
    }
}

//当textField编辑结束时调用的方法
//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    [self.commSendButton setImage:[UIImage imageNamed:@"Send-click@2x"] forState:UIControlStateNormal];
//    [self.commSendButton addTarget:self action:@selector(sendButtonAction) forControlEvents:UIControlEventEditingDidEnd];
//}
//
//
//- (void) sendButtonAction
//{
//    
//}


//- (void )addView
//{
//<<<<<<< HEAD
//    
//}


//按下Done按钮的调用方法，我们让键盘消失
//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    
//    
//    
//    [textField resignFirstResponder];
//    
//    return YES;
//=======
//    sfHeight = startX;
//    
//    titileLabel = [self buildLabelWithFrame:CGRectMake(10, sfHeight+20, width(self.view)-50, 25) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont boldSystemFontOfSize:16] textAlignment:NSTextAlignmentLeft text:nil];
//    [self.view addSubview:titileLabel];
//    
//    sfHeight+=45;
//    
//    timeLabel = [self buildLabelWithFrame:CGRectMake(10, sfHeight, width(self.view)-50, 25) backgroundColor:[UIColor clearColor] textColor:UIColorFromRGBA(0xa2a2a2, 1) font:[UIFont boldSystemFontOfSize:12] textAlignment:NSTextAlignmentLeft text:nil];
//    [self.view addSubview:timeLabel];
//
//    sfHeight+=30;
//    
//    contentImageView = [[EGOImageView alloc]initWithPlaceholderImage:KUIImage(@"placeholder")];
//    contentImageView.delegate = self;
//    contentImageView.frame = CGRectMake(10, sfHeight, width(self.view)-20, (width(self.view)-20)/2);
//    [self.view addSubview:contentImageView];
//    
//    
//    contentTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, startX+90+(width(self.view)-20)/2, width(self.view)-20, 400)];
//    contentTextView.font = [UIFont systemFontOfSize:14];
//    [self.view addSubview:contentTextView];
//    [self createCommentText];
//    [self registerForKeyboardNotifications];
//    [self getInfoFromNetWithUid:self.aid];

//    return YES;
//}

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
//<<<<<<< HEAD
//=======
    
//>>>>>>> origin/master
    
//>>>>>>> origin/master
}

-(void)getInfoFromNetWithUid:(NSString *)uid
{
    NSString * urlStr = [NSString stringWithFormat:@"articledetail?articleid=%@",uid];
    NSLog(@"%@ %@",urlStr,uid);
    [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
//        if (![responseObject isKindOfClass:[NSDictionary class]]) {
//            return ;
//        }
        contentDict = [responseObject lastObject];
        
        titileLabel.text =KISDictionaryHaveKey(contentDict, @"title");
        timeLabel.text =KISDictionaryHaveKey(contentDict, @"crtime");
        contentImageView.imageURL = [NSURL URLWithString:KISDictionaryHaveKey(contentDict, @"photo")];
        contentTextView.text = KISDictionaryHaveKey(contentDict, @"content");
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
-(void) enterNextPage
{
    XWCommentsVC *commentVC = [[XWCommentsVC alloc] init];
    //    derailVC
    commentVC.commentId = self.aid;
    commentVC.contentDict = [NSDictionary dictionaryWithDictionary:contentDict];
    [self.menuController pushViewController:commentVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
}

#pragma mark---EGOIMAGE DELEGATE
- (void)imageViewLoadedImage:(EGOImageView*)imageView
{
    CGRect imgFrame = imageView.frame;
    contentImageView.frame = CGRectMake(10, sfHeight, width(self.view)-20, width(self.view)/imgFrame.size.width*imgFrame.size.height);
    contentTextView.frame = CGRectMake(10, sfHeight+=width(self.view)/imgFrame.size.width*imgFrame.size.height, width(self.view)-20, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
    
    NSString *urlStr = [NSString stringWithFormat:@"http://star.allappropriate.com/commentarticle?articleid=%@&comment=%@&userid=%@",KISDictionaryHaveKey(contentDict, @"aid"),commentTF.text,[[UserCache sharedInstance]objectForKey:KMYUSERID]];
    
    [[AFAppDotNetAPIClient sharedClient]GET:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
        commentTF.text = @"";
        [self goBackKeyBoard:nil];
        [commentTF resignFirstResponder];
        [self showMessageWindowWithContent:@"发送成功" imageType:0];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self showAlertViewWithtitle:@"提示" message:@"评论失败"];
    }];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

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
