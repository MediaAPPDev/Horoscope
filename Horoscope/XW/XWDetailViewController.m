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
    [self setTopViewWithTitle:@"星文" withBackButton:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    contentDict = [NSMutableDictionary dictionary];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-80, KISHighVersion_7?20:0, 80, 44)];
//    [button setImage:KUIImage(@"123123") forState:UIControlStateNormal];
    [button setTitle:@"12345评论>" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:12];
    [button addTarget:self action:@selector(enterNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    sfHeight = startX;
    
    titileLabel = [self buildLabelWithFrame:CGRectMake(10, sfHeight+20, width(self.view)-50, 25) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont boldSystemFontOfSize:16] textAlignment:NSTextAlignmentLeft text:nil];
    [self.view addSubview:titileLabel];
    
    sfHeight+=45;
    
    timeLabel = [self buildLabelWithFrame:CGRectMake(10, sfHeight, width(self.view)-50, 25) backgroundColor:[UIColor clearColor] textColor:UIColorFromRGBA(0xa2a2a2, 1) font:[UIFont boldSystemFontOfSize:12] textAlignment:NSTextAlignmentLeft text:nil];
    [self.view addSubview:timeLabel];

    sfHeight+=30;
    
    contentImageView = [[EGOImageView alloc]initWithPlaceholderImage:KUIImage(@"placeholder")];
    contentImageView.delegate = self;
    contentImageView.frame = CGRectMake(10, sfHeight, width(self.view)-20, (width(self.view)-20)/2);
    [self.view addSubview:contentImageView];
    
    
    contentTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, startX+90+(width(self.view)-20)/2, width(self.view)-20, 400)];
    contentTextView.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:contentTextView];
    [self createCommentText];
    [self registerForKeyboardNotifications];
    [self getInfoFromNetWithUid:self.aid];

    
}

#pragma mark---创建评论条
-(void)createCommentText
{
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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardadf:) name:UIKeyboardDidChangeFrameNotification object:nil];
}



-(void)keyboardadf:(NSNotification*)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize =[[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [self begainMoveUpAnimation:kbSize.height];
}

-(void)begainMoveUpAnimation:(float)heigth
{
    [UIView animateWithDuration:0.00  animations:^{
        commentView.frame =CGRectMake(0, KScreenHeight-55- heigth, KScreenWidth, 55);
    } completion:^(BOOL finished) {
    }];
}

-(void)goBackKeyBoard:(UITapGestureRecognizer *)tap
{
    [commentTF resignFirstResponder];
    commentView.frame = CGRectMake(0, KScreenHeight-55, KScreenWidth, 55);
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
