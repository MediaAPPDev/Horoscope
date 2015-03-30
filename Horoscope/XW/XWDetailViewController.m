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

@end

@implementation XWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"000000000-----------%@",_exampleDic);
    [self setTopViewWithTitle:@"星文" withBackButton:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-80, KISHighVersion_7?20:0, 80, 44)];
//    [button setImage:KUIImage(@"123123") forState:UIControlStateNormal];
    [button setTitle:@"12345评论>" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:12];
    [button addTarget:self action:@selector(enterNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
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
    
}

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
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.commSendButton setImage:[UIImage imageNamed:@"Send-click@2x"] forState:UIControlStateNormal];
    [self.commSendButton addTarget:self action:@selector(sendButtonAction) forControlEvents:UIControlEventEditingDidEnd];
}


- (void) sendButtonAction
{
    
}

//按下Done按钮的调用方法，我们让键盘消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(void) enterNextPage
{
    XWCommentsVC *commentVC = [[XWCommentsVC alloc] init];
    //    derailVC
    [self.menuController pushViewController:commentVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
