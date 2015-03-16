//
//  ChangemboilViewController.m
//  Horoscope
//
//  Created by Satellite on 15/3/6.
//
//

#import "ChangemboilViewController.h"

@interface ChangemboilViewController ()

@end

@implementation ChangemboilViewController
{
    UITextField * zhLabel;
    UITextField * mmLabel;
    UITextField * newMob;
    UITextField * yzm2TF;
    NSString * smscodesStr;
    UIButton *yzbtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTopViewWithTitle:@"更改手机号" withBackButton:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *ar = [NSArray arrayWithObjects:@"账号",@"密码", nil];
    for (int i = 0; i < 2; i++) {
        UILabel *lb = [self buildLabelWithFrame:CGRectMake(20, startX+40+i*50, 60, 30) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont boldSystemFontOfSize:17] textAlignment:NSTextAlignmentLeft text:ar[i]];
        [self.view addSubview:lb];
    }
    
    zhLabel = [[UITextField alloc]initWithFrame:CGRectMake(80, startX+40, self.view.bounds.size.width-140, 30)];
    zhLabel.borderStyle =UITextBorderStyleRoundedRect;
    zhLabel.textColor =[UIColor blackColor ];
    zhLabel.clearButtonMode = UITextFieldViewModeAlways;
//    zhLabel.secureTextEntry = YES;
    zhLabel.textAlignment = NSTextAlignmentCenter;
    zhLabel.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:zhLabel];
    
    mmLabel = [[UITextField alloc]initWithFrame:CGRectMake(80, startX+90, self.view.bounds.size.width-140, 30)];
    mmLabel.borderStyle =UITextBorderStyleRoundedRect;
    mmLabel.textColor =[UIColor blackColor ];
    mmLabel.clearButtonMode = UITextFieldViewModeAlways;
//    mmLabel.secureTextEntry = YES;
    mmLabel.textAlignment = NSTextAlignmentCenter;
    mmLabel.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:mmLabel];
    
    UIButton *button  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width-180, 30)];
    button.backgroundColor = [UIColor grayColor];
    button.center = CGPointMake(self.view.bounds.size.width/2, startX+160);
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)enterNext:(id)sender
{
    
    NSString *urlStr =[NSString stringWithFormat:@"veruser?mobilenum=%@&password=%@",zhLabel.text,mmLabel.text];
    [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSString *uid = [responseObject objectForKey:@"id"];
            if ([uid isEqualToString:[[UserCache sharedInstance]objectForKey:KMYUSERID]]) {
              
                UIView *view =[[ UIView alloc]initWithFrame:CGRectMake(0, startX, width(self.view), height(self.view)-startX)];
                view.backgroundColor  = [UIColor whiteColor];
//                UILabel *lb =[self buildLabelWithFrame:CGRectMake(0, 0, 200, 30) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter text:@"请输入新手机号"];
//                lb.center = CGPointMake(view.center.x, 40);
//                [view addSubview:lb];
                
                newMob = [[UITextField alloc]initWithFrame:CGRectMake(0, 70, 250, 40)];
                newMob.center = CGPointMake(view.center.x, newMob.center.y);
                newMob.clearButtonMode = UITextFieldViewModeWhileEditing;
                newMob.borderStyle = UITextBorderStyleRoundedRect;
                newMob.placeholder = @"请输入新手机号";
                [view addSubview:newMob];
                
                yzm2TF =[[UITextField alloc]initWithFrame:CGRectMake((width(view)-250)/2, 130, 160, 40)];
//                yzm2TF.center = CGPointMake(view.center.x, newMob.center.y);
                yzm2TF.clearButtonMode = UITextFieldViewModeWhileEditing;
                yzm2TF.borderStyle = UITextBorderStyleRoundedRect;
                yzm2TF.placeholder = @"请输入验证码";
                [view addSubview:yzm2TF];
                
                yzbtn  = [[UIButton alloc]initWithFrame:CGRectMake((width(view)-250)/2+170, 130,80, 40)];
                yzbtn.backgroundColor = [UIColor grayColor];
//                yzbtn.center = CGPointMake(self.view.bounds.size.width/2, startX+160);
                [yzbtn setTitle:@"验证" forState:UIControlStateNormal];
                [yzbtn addTarget:self action:@selector(getYzm2:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:yzbtn];
                
                
                
                UIButton *button  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,200, 30)];
                button.center = CGPointMake(view.center.x, button.center.y);
                button.backgroundColor = [UIColor grayColor];
                button.center = CGPointMake(self.view.bounds.size.width/2, startX+160);
                [button setTitle:@"提交" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(changeSuccess:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:button];
                [self.view addSubview:view];
            }else{
                [self showAlertViewWithtitle:@"提示" message:@"账号或密码不正确"];
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
//倒计时
-(void)startTime{
    yzbtn.userInteractionEnabled = NO;
    
    
    __block int timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [yzbtn setTitle:@"重发" forState:UIControlStateNormal];
                yzbtn.userInteractionEnabled = YES;
                UIImage *buttonImageNomal=[UIImage imageNamed:@"after60.png"];
                UIImage *stretchableButtonImageNomal=[buttonImageNomal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
                [yzbtn setBackgroundImage:stretchableButtonImageNomal forState:UIControlStateNormal];
                [yzbtn addTarget:self action:@selector(getYzm2:) forControlEvents:UIControlEventTouchUpInside];
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //                NSLog(@"____%@",strTime);
                [yzbtn setTitle:[NSString stringWithFormat:@"%@",strTime] forState:UIControlStateNormal];
                yzbtn.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
    
    
}

-(void)getYzm2:(UIButton *)sender
{
    NSString * yzStr =[NSString stringWithFormat:@"veruser?mobilenum=%@",newMob.text];
    [[AFAppDotNetAPIClient sharedClient]GET:yzStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSString * idStr = [responseObject objectForKey:@"id"];
            if ([idStr intValue] == 0) {
                NSString *urlStr =[NSString stringWithFormat:@"forgetpwd?mobilenum=%@",newMob.text];
                [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        smscodesStr = [responseObject objectForKey:@"smscodes"];
                        [self startTime];
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                }];
            }else{
                [self showAlertViewWithtitle:@"提示" message:@"您要修改的手机号已存在"];
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


-(void)changeSuccess:(id)sender
{
    
    if ([self isEmtity:newMob.text]) {
        [self showAlertViewWithtitle:@"提示" message:@"手机号不能为空"];
        return;
    }
    if ([self isEmtity:yzm2TF.text]) {
        [self showAlertViewWithtitle:@"提示" message:@"验证码不能为空"];
        return;
    }
    if (![yzm2TF.text isEqualToString:smscodesStr]) {
        [self showAlertViewWithtitle:@"提示" message:@"验证码不正确"];
        return;
    }

    
    NSString *urlStr =[NSString stringWithFormat:@"modifymm?uid=%@&mobilenum=%@",[[UserCache sharedInstance]objectForKey:KMYUSERID],newMob.text];
    [[AFAppDotNetAPIClient sharedClient]GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"RESPONSEOBJECT--->%@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSString *uid = [responseObject objectForKey:@"id"];
            if ([uid intValue] ==1) {
                [self showMessageWindowWithContent:@"修改成功" imageType:0];
                [self.menuController popViewControllerAnimated:YES];
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"ERROR-->%@",error);
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
