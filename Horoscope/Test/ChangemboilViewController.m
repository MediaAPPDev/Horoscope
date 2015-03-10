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
                UILabel *lb =[self buildLabelWithFrame:CGRectMake(0, 0, 200, 30) backgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter text:@"请输入新手机号"];
                lb.center = CGPointMake(view.center.x, 40);
                [view addSubview:lb];
                
                newMob = [[UITextField alloc]initWithFrame:CGRectMake(0, 70, 200, 30)];
                newMob.center = CGPointMake(view.center.x, newMob.center.y);
                newMob.clearButtonMode = UITextFieldViewModeWhileEditing;
                newMob.borderStyle = UITextBorderStyleRoundedRect;
                [view addSubview:newMob];
                
                
                UIButton *button  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,200, 30)];
                button.center = CGPointMake(view.center.x, button.center.y);
                button.backgroundColor = [UIColor grayColor];
                button.center = CGPointMake(self.view.bounds.size.width/2, startX+160);
                [button setTitle:@"提交" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(changeSuccess:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:button];
                [self.view addSubview:view];
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
-(void)changeSuccess:(id)sender
{
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
