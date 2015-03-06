//
//  ForgetPassWordViewController.m
//  Horoscope
//
//  Created by Satellite on 15/3/6.
//
//

#import "ForgetPassWordViewController.h"

@interface ForgetPassWordViewController ()
{
    UITextField * mobTf;
    UITextField * yzmTf;
    UITextField * passwordTf;
    NSString * smscodesStr;
    NSString *uidStr;
}
@end

@implementation ForgetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTopViewWithTitle:@"忘记密码" withBackButton:NO];
    self.view.backgroundColor =[ UIColor whiteColor];
    mobTf = [[UITextField alloc]initWithFrame:CGRectMake(40, startX+40, KScreenWidth-80, 40)];
    mobTf.borderStyle =UITextBorderStyleRoundedRect;
    mobTf.textColor =[UIColor blackColor ];
    mobTf.clearButtonMode = UITextFieldViewModeAlways;
    mobTf.secureTextEntry = YES;
    mobTf.placeholder = @"请输入手机号";
    mobTf.textAlignment = NSTextAlignmentCenter;
    mobTf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:mobTf];
    
    yzmTf = [[UITextField alloc]initWithFrame:CGRectMake(40, startX+100, (KScreenWidth-80)/3*2, 40)];
    yzmTf.borderStyle =UITextBorderStyleRoundedRect;
    yzmTf.textColor =[UIColor blackColor ];
    yzmTf.clearButtonMode = UITextFieldViewModeAlways;
    yzmTf.secureTextEntry = YES;
    yzmTf.placeholder = @"请输入验证码";
    yzmTf.textAlignment = NSTextAlignmentCenter;
    yzmTf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:yzmTf];
    
    
    passwordTf = [[UITextField alloc]initWithFrame:CGRectMake(40, startX+160, KScreenWidth-80, 40)];
    passwordTf.borderStyle =UITextBorderStyleRoundedRect;
    passwordTf.textColor =[UIColor blackColor ];
    passwordTf.clearButtonMode = UITextFieldViewModeAlways;
    passwordTf.secureTextEntry = YES;
    passwordTf.placeholder = @"请输入密码";
    passwordTf.textAlignment = NSTextAlignmentCenter;
    passwordTf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:passwordTf];

    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(40+(KScreenWidth-80)/3*2+5, startX+100, (KScreenWidth-80)/3*1-5, 40)];
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    button.backgroundColor =[ UIColor grayColor];
    [button addTarget:self action:@selector(getYzm:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(40, startX+210, KScreenWidth-80, 40)];
    [button1 setTitle:@"提交" forState:UIControlStateNormal];
    button1.backgroundColor =[ UIColor grayColor];
    [button1 addTarget:self action:@selector(uploadPassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    
    
    
    
}
-(void)getYzm:(id)sender
{
    NSString *urlStr =[NSString stringWithFormat:@"forgetpwd?mobilenum=%@",mobTf.text];
    [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            smscodesStr = [responseObject objectForKey:@"smscodes"];
            uidStr =[responseObject objectForKey:@"id"];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

-(void)uploadPassword:(id)sender
{
    if ([self isEmtity:mobTf.text]) {
        [self showAlertViewWithtitle:@"提示" message:@"手机号不能为空"];
        return;
    }
    if ([self isEmtity:passwordTf.text]) {
        [self showAlertViewWithtitle:@"提示" message:@"密码不能为空"];
        return;
    }
    if ([self isEmtity:yzmTf.text]) {
        [self showAlertViewWithtitle:@"提示" message:@"验证码不能为空"];
        return;
    }
    if (![yzmTf.text isEqualToString:smscodesStr]) {
        [self showAlertViewWithtitle:@"提示" message:@"验证码不正确"];
        return;
    }
    
    NSString *urlStr =[NSString stringWithFormat:@"modifymp?uid=%@&password=%@",uidStr,yzmTf.text];
    [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self showMessageWindowWithContent:@"修改成功" imageType:0];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
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
