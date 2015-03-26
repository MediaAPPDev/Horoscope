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
}
@end

@implementation XWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTopViewWithTitle:@"星文" withBackButton:YES];
    self.view.backgroundColor = [UIColor whiteColor];
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
//    commentBgView = [[UIView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, KScreenHeight-(KISHighVersion_7?64:44))];
//    commentBgView.backgroundColor = [UIColor colorWithRed:0/225.0f green:0/225.0f blue:0/225.0f alpha:0.6];
//    commentBgView.hidden = YES;
//    [self.view addSubview:commentBgView];
    
    commentView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight-50, KScreenWidth, 50)];
    commentView.backgroundColor = UIColorFromRGBA(0xa2a2a2, 1);
    [self.view addSubview:commentView];
    
    commentTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 7.5f, KScreenWidth-80, 35)];
    commentTF.backgroundColor = [UIColor whiteColor];
    commentTF.borderStyle = UITextBorderStyleRoundedRect;
    commentTF.font = [UIFont systemFontOfSize:14];
    commentTF.adjustsFontSizeToFitWidth = YES;
    commentTF.delegate = self;
    commentTF.returnKeyType =UIReturnKeyGo;
    commentTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //    commentTF.keyboardType = UIKeyboardTypeDefault;
    commentTF.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [commentView addSubview:commentTF];
    sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-60, 7.5f, 50, 35)];
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [sendBtn setBackgroundColor: [UIColor whiteColor]];
    sendBtn.enabled = NO;
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
        NSDictionary *dic = [responseObject lastObject];
        
        titileLabel.text =KISDictionaryHaveKey(dic, @"title");
        timeLabel.text =KISDictionaryHaveKey(dic, @"crtime");
        contentImageView.imageURL = [NSURL URLWithString:KISDictionaryHaveKey(dic, @"photo")];
        contentTextView.text = KISDictionaryHaveKey(dic, @"content");
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
-(void) enterNextPage
{
    XWCommentsVC *commentVC = [[XWCommentsVC alloc] init];
    //    derailVC
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
    [UIView animateWithDuration:0.05  animations:^{
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
