//
//  signup2ViewController.m
//  Horoscope
//
//  Created by SAT on 15/1/9.
//
//

#import "signup2ViewController.h"
#import "signup3ViewController.h"

@interface signup2ViewController ()
{
    NSString * sjyzmStr;
}
@end

@implementation signup2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopViewWithTitle:@"第二步" withBackButton:NO];
    
    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, KISHighVersion_7 ? 20 : 0, 65, 44)];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateNormal];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateHighlighted];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-60, KISHighVersion_7?20:0, 60, 44)];
    [button setImage:KUIImage(@"wancheng@2x.png") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNextPage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
     [_telPhoneNumber setText:_telNum];
    
//    [self.password shouldChangeTextInRange:20 replacementText:@""];
    
    [_sendCode setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    [_password setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    _password.delegate = self;
    NSLog(@"lallala========  %@",_password.text);
    [self sendTelCode];
    
    
    
    [_resenVerificationCode addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];_resenVerificationCode.userInteractionEnabled = NO;
    
    
    

    UIImage *buttonImageNomal=[UIImage imageNamed:@"button-click@2x.png"];
    UIImage *stretchableButtonImageNomal=[buttonImageNomal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [_resenVerificationCode setBackgroundImage:stretchableButtonImageNomal forState:UIControlStateNormal];
    _resenVerificationCode.userInteractionEnabled = NO;
    [self startTime];

    
    // Do any additional setup after loading the view from its nib.==00000
}


//倒计时
-(void)startTime{
    _resenVerificationCode.userInteractionEnabled = NO;

    
    __block int timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [_resenVerificationCode setTitle:@"重新发送验证码" forState:UIControlStateNormal];
                _resenVerificationCode.userInteractionEnabled = YES;
                UIImage *buttonImageNomal=[UIImage imageNamed:@"after60.png"];
                UIImage *stretchableButtonImageNomal=[buttonImageNomal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
                [_resenVerificationCode setBackgroundImage:stretchableButtonImageNomal forState:UIControlStateNormal];
                [_resenVerificationCode addTarget:self action:@selector(VerifyButtonAction) forControlEvents:UIControlEventTouchUpInside];
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //                NSLog(@"____%@",strTime);
                [_resenVerificationCode setTitle:[NSString stringWithFormat:@"%@秒后可重新发送",strTime] forState:UIControlStateNormal];
                _resenVerificationCode.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);


}


//重新发送验证码事件
-(void) VerifyButtonAction{
    NSString * loginStr =[NSString stringWithFormat:@"veruser?mobilenum=%@",_telPhoneNumber.text];
    
    [[AFAppDotNetAPIClient sharedClient] GET:loginStr parameters:nil success:^ (NSURLSessionDataTask *task, id responseObject) {
        NSString * state   =KISDictionaryHaveKey(responseObject, @"id");
        NSLog(@"😄－－－－－－－%@",state);
        if ([state isEqualToString:@"0"]) {
            [[UserCache sharedInstance] setObject:_telPhoneNumber.text forKey:@"regTel"];
            signup2ViewController * signStep2 =[[signup2ViewController alloc]init];
            signStep2.telNum =[NSMutableString stringWithString:_telPhoneNumber.text];
//            [self.navigationController pushViewController:signStep2 animated:YES];
            //                [self.menuController pushViewController:signStep2 withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
        }else{
            [self showAlertViewWithtitle:@"提示" message:@"此账号已被注册"];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    }];

}


-(void)backButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendTelCode
{
    
//    [UserCache sharedInstance] valueForKey:@""
  
    NSString * parameterStr =[NSString stringWithFormat:@"mobilesms?mobnum=%@",_telNum];
    
    NSLog(@"😄－－－－－%@",parameterStr);
    //😄－－－－－mobilesms?mobnum=18210453451
    [[AFAppDotNetAPIClient sharedClient] GET:parameterStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSString *state  =KISDictionaryHaveKey(responseObject, @"SMSCODE");
            NSLog(@"😄－－－－－%@",state);
            if (![state isEqualToString:@""]) {
//                [_sendCode setText:state ];
                sjyzmStr = state;
            }
//-------------------//-------13261649688--------//-----------//-------------//--------------//-------//
        }

        else{
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"验证码返回失败！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

-(void)enterNextPage:(UIButton *)btn
{
//    if ([self isEmtity:_password.text] || [self isEmtity:_sendCode.text]) {
    
        
        if ([self isEmtity:_password.text]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
        if ([self isEmtity:_sendCode.text]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"验证码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
        
    
       
    else if(_password.text.length >= 6 && _password.text.length <=18){
//    }else{

    if (![_sendCode.text isEqualToString:sjyzmStr]) {
        [self  showAlertViewWithtitle:@"提示" message:@"验证码不正确"];
        return;
    }
    
    
        signup3ViewController * signStep3 =[[signup3ViewController alloc]init];
        signStep3.telPhoneNumber = self.telPhoneNumber.text;
        signStep3.passWordStr = self.password.text;
        NSLog(@"lalalla========    %@",signStep3.telPhoneNumber);

        NSLog(@"lalalla========    %@",signStep3.passWordStr);
//        [self.menuController pushViewController:signStep3 withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
        [self.navigationController pushViewController:signStep3 animated:YES];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能少于6位或大于18位" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];

    }
//    }

    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //string就是此时输入的那个字符 textField就是此时正在输入的那个输入框 返回YES就是可以改变输入框的值 NO相反

    if ([string isEqualToString:@"n"])//按会车可以改变
    {
        return YES;
    }
    
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
    
    if (self.password == textField)//判断是否时我们想要限定的那个输入框
    {
        if ([toBeString length] > 18) { //如果输入框内容大于18则弹出警告
            self.password.text = [toBeString substringToIndex:18];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"密码超过18位" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return NO;
        }
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reSendCode:(id)sender {
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
